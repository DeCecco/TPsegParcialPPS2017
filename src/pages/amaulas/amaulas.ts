import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AulasgPage } from '../aulasg/aulasg';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';

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
  estado:string;
  aulaM:any;
  formAM : FormGroup;
  aula:string;
  constructor(public navCtrl: NavController, public navParams: NavParams,public formBuilder: FormBuilder,private ApiProvider: ApiProvider,private GlobalF: GlobalFunctionsProvider,
    private db: AngularFirestore) {
    this.estado = this.navParams.get("estado");
    if(this.estado=='Modificar'){
      this.aulaM = this.navParams.get("aula");
      this.aula=this.aulaM.descripcion;
    }
    this.formAM = formBuilder.group({
      aula: [this.aula, Validators.compose([Validators.maxLength(30), Validators.required, Validators.pattern('^[a-zA-Z0-9]+$')])],      
    });
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad AmaulasPage');
  }
  back(){        
    
    let promt = this.GlobalF.alerta(0);
    promt.present();
    promt.onDidDismiss((data)=>{      
      if(data){
        this.navCtrl.setRoot(AulasgPage); 
      }
    })
  }
  
  guardar(){
    
    if(this.formAM.valid){
      
      if(this.estado!='Modificar'){
        var array = [{"aula": this.aula }];      
        this.ApiProvider.altaAula(array).then(Response=>{
          this.GlobalF.guardarFirebaseDB(array,'aulas');
          this.GlobalF.correcto(1);
          this.navCtrl.setRoot(AulasgPage); 
        }).catch(error=>{
          this.GlobalF.error(5);
        })
      }else{
        var array2 = [{"descripcion": this.aula,"idaula":this.aulaM.idaula,"estado":this.aulaM.estado }];      
        this.ApiProvider.abmGralPost(array2,'materias/modificarAula').then(Response=>{
          this.GlobalF.correcto(1);
          this.navCtrl.setRoot(AulasgPage); 
        }).catch(error=>{
          this.GlobalF.error(5);
        })
      }
    
    }else{
      this.GlobalF.error(1);
    }    
  }
   

}
