import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AulasgPage } from '../aulasg/aulasg';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';


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
  idAula:string;
  formAM : FormGroup;
  aula:string;
  constructor(public navCtrl: NavController, public navParams: NavParams,public formBuilder: FormBuilder,private ApiProvider: ApiProvider,private GlobalF: GlobalFunctionsProvider) {
    this.estado = this.navParams.get("estado");
    this.idAula = this.navParams.get("idAula");
    this.formAM = formBuilder.group({
      aula: ['', Validators.compose([Validators.maxLength(30), Validators.pattern('^[^a-zA-Z0-9]'), Validators.required])],      
  });
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad AmaulasPage');
  }
  back(){        
    
    let promt = this.GlobalF.alerta();
    promt.present();
    promt.onDidDismiss((data)=>{      
      if(data){
        this.navCtrl.setRoot(AulasgPage); 
      }
    })
  }
  guardar(){
    
    if(this.aula){
      var array = [{
        "aula": this.aula
      }];
      console.info(array);
    }else{
      this.GlobalF.error(1);
    }
    
    
  }

}
