import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiProvider } from '../../providers/api/api';
import { Storage } from '@ionic/storage';
import { AulasgPage } from '../aulasg/aulasg';

/**
 * Generated class for the MenuPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-menu',
  templateUrl: 'menu.html',
})
export class MenuPage {  
  nombre : string ;
  
  constructor(public navCtrl: NavController, public navParams: NavParams,private storage: Storage,private ApiProvider: ApiProvider) {    
    this.nombre='-Sin Nombre-';     
   
  }

  load2(){
    this.ApiProvider.returnToken().then(function (response){           
      console.info(response)
      console.info(response.nombre +' '+ response.apellido)
      console.info(typeof (response.nombre))      
      this.nombre=response.nombre +' '+ response.apellido;
  })
  
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad MenuPage');
  }
  goTo(where){
    console.info(where);
    switch(where){
      case 1:
      break;
      case 2:
      break;
      case 3:
      break;
      case 4:
        this.navCtrl.setRoot(AulasgPage);
      break;
      case 5:
      break;
      case 6:
      break;
      case 7:
      break;
      case 8:
      break;
      default:
      break;
    }
  }
}
