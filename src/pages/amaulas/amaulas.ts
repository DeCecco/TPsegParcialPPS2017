import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AulasgPage } from '../aulasg/aulasg';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';
import { Storage } from '@ionic/storage';
import { HomePage } from '../home/home';

/**
 * Generated class for the AmaulasPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-amaulas',
  templateUrl: 'amaulas.html',
})
export class AmaulasPage {
  estado: string;
  aulaM: any;
  formAM: FormGroup;
  aula: string;
  nombre:string;
  tipo:any;
  constructor(public navCtrl: NavController, public navParams: NavParams, public formBuilder: FormBuilder, private storage: Storage,private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider,
    private db: AngularFirestore) {
    this.estado = this.navParams.get("estado");
    this.returnToken();
    if (this.estado == 'Modificar') {
      this.aulaM = this.navParams.get("aula");
      this.aula = this.aulaM.descripcion;
    }
    this.formAM = formBuilder.group({                                                                       //'^[a-zA-Z ]+$'
      aula: [this.aula, Validators.compose([Validators.maxLength(25), Validators.required, Validators.pattern('^[a-zA-Z0-9 ]+$')])],
    });
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad AmaulasPage');
  }
  returnToken() {    
    this.ApiProvider.returnToken().then(response=> {     
      console.info(response)  
      this.nombre = response.nombre + ' ' + response.apellido;    
      this.tipo = response.tipo;
    }).catch(error=>{
      this.GlobalF.cargando();
      this.storage.clear();
      this.navCtrl.setRoot(HomePage);
    })    
  }
  back() {

    let promt = this.GlobalF.alerta(0);
    promt.present();
    promt.onDidDismiss((data) => {
      if (data) {
        this.navCtrl.setRoot(AulasgPage);
      }
    })
  }

  guardar() {

    if (this.formAM.valid) {


      if (this.estado != 'Modificar') {
        var array = [{ "aula": this.aula }];
        this.ApiProvider.altaAula(array).then(Response => {
          this.GlobalF.guardarFirebaseDB(array, 'aulas');
          this.GlobalF.correcto(1);
          this.navCtrl.setRoot(AulasgPage);
        }).catch(error => {
          this.GlobalF.error(5);
        })
      } else {
        var array2 = [{ "descripcion": this.aula, "idaula": this.aulaM.idaula, "estado": this.aulaM.estado }];
        this.ApiProvider.abmGralPost(array2, 'materias/modificarAula').then(Response => {
          this.GlobalF.correcto(1);
          this.navCtrl.setRoot(AulasgPage);
        }).catch(error => {
          this.GlobalF.error(5);
        })
      }

    } else {
      this.GlobalF.error(1);
    }
  }
  verificarAulaCreada() {
    if (this.formAM.valid) {
      var aula = 0;
      if (!this.aulaM) {
        aula = 0;
      } else {
        aula = this.aulaM.idaula
      }
      var array0 = [{ "descripcion": this.aula, "idaula": aula }];

      this.ApiProvider.abmGralPost(array0, 'materias/verificarAulaCreada').then(Response => {
        if (Response[0].existe == 0) {
          this.guardar();
        } else {
          this.GlobalF.error(10);
        }
      }).catch(error => {
        this.GlobalF.error(5);
      })
    } else {
      this.GlobalF.error(1);
    }

  }
}
