import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MateriasGPage } from '../materias-g/materias-g';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';
import { Storage } from '@ionic/storage';
import { HomePage } from '../home/home';
import { Vibration } from '@ionic-native/vibration';
import { NativeAudio } from '@ionic-native/native-audio';
/**
 * Generated class for the MateriasAmPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-materias-am',
  templateUrl: 'materias-am.html',
})
export class MateriasAmPage {
  estado: string;
  arreglo: any;
  formAM: FormGroup;
  descripcion: string;
  descripcionCorta: string;
  turno: any;
  listadoAulaM: any;
  listadoAulaT: any;
  listadoAulaN: any;
  habilitarM: any;
  habilitarT: any;
  habilitarN: any;
  aulaAsig: any[];
  aulaAsigform: any;
  aulaAsigformT: any;
  aulaAsigformN: any;
  anio: string;
  cuatrimestre: string;
  nombre: string;
  tipo: any;
  constructor(private vibration: Vibration,private nativeAudio: NativeAudio,public navCtrl: NavController, public navParams: NavParams, public formBuilder: FormBuilder, private ApiProvider: ApiProvider, private storage: Storage, private GlobalF: GlobalFunctionsProvider,
    private db: AngularFirestore) {
      this.nativeAudio.preloadSimple('tambor', 'assets/sound/tambor.mp3');
    this.estado = this.navParams.get("estado");
    this.habilitarM = 0;
    this.habilitarT = 0;
    this.habilitarN = 0;
    this.aulaAsig = [];
    if (this.estado == 'Modificar') {
      this.arreglo = this.navParams.get("arreglo");
      this.descripcion = this.arreglo[1].descripcion;
      this.descripcionCorta = this.arreglo[1].descripcionCorta;
      this.anio = this.arreglo[1].anio;
      this.cuatrimestre = this.arreglo[1].cuatrimestre;
      this.turno = this.arreglo[0];
      let arr = [];
      this.aulaAsigform = '0';
      this.aulaAsigformT = '0';
      this.aulaAsigformN = '0';
      for (let key in this.turno) {
        arr[key] = this.turno[key].idturno.toString();
      }
      this.turno = arr;
      var each = this.arreglo[2]
      console.info(this.arreglo);
      for (let key2 in each) {
        if (each[key2].idaula != null) {
          switch (each[key2].idturno.toString()) {
            case '1':
            case 1:
              this.aulaAsigform = each[key2].idaula.toString();
              this.aulaAsig["1"] = this.aulaAsigform;
              break;
            case '2':
            case 2:
              this.aulaAsigformT = each[key2].idaula.toString();
              this.aulaAsig["2"] = this.aulaAsigformT;
              break;
            case '3':
            case 3:
              this.aulaAsigformN = each[key2].idaula.toString();
              this.aulaAsig["3"] = this.aulaAsigformN;
              break;
          }
          console.info(this.aulaAsig);
        }
      }

    }
    this.formAM = formBuilder.group({
      descripcion: [this.descripcion, Validators.compose([Validators.maxLength(100), Validators.required, Validators.pattern('^[a-zA-Z ]+$')])],
      descripcionCorta: [this.descripcionCorta, Validators.compose([Validators.maxLength(40), Validators.pattern('^[a-zA-Z ]+$')])],
      turno: [this.turno, Validators.compose([Validators.maxLength(40), Validators.required])],
      anio: [this.anio, Validators.compose([Validators.required])],
      cuatrimestre: [this.cuatrimestre, Validators.compose([Validators.required])],
      aulaAsigform: [this.aulaAsigform],
      aulaAsigformT: [this.aulaAsigformT],
      aulaAsigformN: [this.aulaAsigformN],
    });
    this.returnToken();
  }
  
  returnToken() {
    this.ApiProvider.returnToken().then(response => {
      console.info(response)
      this.nombre = response.nombre + ' ' + response.apellido;
      this.tipo = response.idtipo;
    }).catch(error => {
      this.GlobalF.cargando();
      this.storage.clear();
      this.navCtrl.setRoot(HomePage);
    })
  }
  ver() {
    var arrx = [];
    this.habilitarM = '0';
    this.habilitarT = '0';
    this.habilitarN = '0';

    if (this.turno != null) {

      for (let i = 0; i < this.turno.length; i++) {
        arrx.push(this.turno[i])

        if (this.turno[i] == 1)
          this.habilitarM = '1';
        else if (this.turno[i] == 2)
          this.habilitarT = '2';
        else
          this.habilitarN = '3';
      }
    }
  }

  asigAulaMateria(item, turno) {
    this.aulaAsig[turno] = item;
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad MateriasAmPage');
    this.traerAulas();
  }
  back() {

    let promt = this.GlobalF.alerta(0);
    promt.present();
    promt.onDidDismiss((data) => {
      if (data) {
        this.GlobalF.cargando();
        this.navCtrl.setRoot(MateriasGPage);
      }
    })
  }

  guardar() {

    if (this.formAM.valid) {
      this.vibration.vibrate(100);
      this.nativeAudio.play('tambor');
      this.GlobalF.cargando3Seg();
      if (this.estado != 'Modificar') {
        var array = [{ "descripcion": this.descripcion, "descripcionCorta": this.descripcionCorta, "turno": this.turno, "aulaAsig": this.aulaAsig, "anio": this.anio, "cuatrimestre": this.cuatrimestre }];
        this.ApiProvider.abmGralPost(array, 'materias/altaMateria').then(Response => {
          //this.GlobalF.guardarFirebaseDB(array,'materias');
          if (Response == 1) {
            this.GlobalF.correcto(1);
            this.navCtrl.setRoot(MateriasGPage);
          } else {
            this.GlobalF.error(Response);
          }
        }).catch(error => {
          this.GlobalF.error(0);
        })
      } else {

        var array2 = [{ "idmateria": this.arreglo[1].idmateria, "descripcion": this.descripcion, "descripcionCorta": this.descripcionCorta, "estado": this.arreglo[1].estado, "turno": this.turno, "aulaAsig": this.aulaAsig, "anio": this.anio, "cuatrimestre": this.cuatrimestre }];
        console.info(array2);
        this.ApiProvider.abmGralPost(array2, 'materias/modificarMateria').then(Response => {

          if (Response == 1) {
            this.GlobalF.correcto(1);
            this.navCtrl.setRoot(MateriasGPage);
          } else {
            this.GlobalF.error(Response);
          }
        }).catch(error => {
          this.GlobalF.error(5);
        })
      }

    } else {
      this.GlobalF.error(1);
    }
  }
  /*verificarAulaOcupada() {
    var Vidmateria;
    if(!this.arreglo){
      Vidmateria=0;
    }else{
      Vidmateria=this.arreglo[1].idmateria;
    }
    
    var array0 = [{ "idturno": this.turno, "idaula": this.aulaAsig, "anio": this.anio, "cuatrimestre": this.cuatrimestre,"idmateria":Vidmateria }];
    
    this.aulaAsig.forEach(element => {
      if(element){
        console.info(element)
      }
    });
    this.ApiProvider.abmGralPost(array0, 'materias/verificarAulaOcupada').then(Response => {
      console.info(Response)
      if (Response[0].existe == 0) {
        
        //this.guardar();
      } else {

      }
    }).catch(error => {
      this.GlobalF.error(5);
    })
  }*/
  traerAulas() {
    this.ApiProvider.traerAulas()
      .then(data => {
        this.listadoAulaM = data;
        this.listadoAulaT = data;
        this.listadoAulaN = data;
      })
      .catch(error => {
        console.log('ERROR: ' + error);
      });
  }


}
