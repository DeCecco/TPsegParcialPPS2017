import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MateriasGPage } from '../materias-g/materias-g';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';
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
  turno:any;
  
  constructor(public navCtrl: NavController, public navParams: NavParams, public formBuilder: FormBuilder, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider,
    private db: AngularFirestore) {
    this.estado = this.navParams.get("estado");
    if (this.estado == 'Modificar') {
      this.arreglo = this.navParams.get("arreglo");      
      console.info(this.arreglo);
      this.descripcion=this.arreglo[1].descripcion;
      this.descripcionCorta=this.arreglo[1].descripcionCorta;
      this.turno=this.arreglo[0];
      let arr=[];
      for (let key in this.turno) {             
        arr[key]=this.turno[key].idturno.toString();
      }
      this.turno=arr;      
    } 
    this.formAM = formBuilder.group({
      descripcion: [this.descripcion, Validators.compose([Validators.maxLength(100), Validators.required, Validators.pattern('^[a-zA-Z]+$')])],
      descripcionCorta: [this.descripcionCorta, Validators.compose([Validators.maxLength(40), Validators.pattern('^[a-zA-Z]+$')])],
      turno: [this.turno, Validators.compose([Validators.maxLength(40), Validators.required])],
    });
  }
  ver(){
    console.info(this.turno)
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad MateriasAmPage');
  }
  back(){        
    
    let promt = this.GlobalF.alerta(0);
    promt.present();
    promt.onDidDismiss((data)=>{      
      if(data){
        this.navCtrl.setRoot(MateriasGPage); 
      }
    })
  }
  
  guardar(){
    
    if(this.formAM.valid){
      
      if(this.estado!='Modificar'){
        var array = [{"descripcion": this.descripcion,"descripcionCorta": this.descripcionCorta,"turno":this.turno }];      
        this.ApiProvider.abmGralPost(array,'materias/altaMateria').then(Response=>{          
          //this.GlobalF.guardarFirebaseDB(array,'materias');
          this.GlobalF.correcto(1);
          this.navCtrl.setRoot(MateriasGPage); 
        }).catch(error=>{
          this.GlobalF.error(0);
        })        
      }else{        
        var array2 = [{"idmateria":this.arreglo[1].idmateria,"descripcion": this.descripcion,"descripcionCorta": this.descripcionCorta,"estado": this.arreglo[1].estado,"turno":this.turno }];      
        console.info(array2);
        this.ApiProvider.abmGralPost(array2,'materias/modificarMateria').then(Response=>{
          this.GlobalF.correcto(1);
          this.navCtrl.setRoot(MateriasGPage); 
        }).catch(error=>{
          this.GlobalF.error(5);
        })
      }
    
    }else{
      this.GlobalF.error(1);
    }    
  }
   

}
