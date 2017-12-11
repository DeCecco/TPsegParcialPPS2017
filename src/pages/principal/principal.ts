import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ModalController } from 'ionic-angular';

import { Storage } from '@ionic/storage';//STORAGE FOR IONIC

import { PersonasPage } from '../personas/personas';
import { Asistencia } from '../asistencia/asistencia';
import { HomePage } from '../home/home';
/**
 * Generated class for the PrincipalPage page.
 *
 * See http://ionicframework.com/docs/components/#navigation for more info
 * on Ionic pages and navigation.
 */
@IonicPage()
@Component({
  selector: 'page-principal',
  templateUrl: 'principal.html',
})
export class PrincipalPage {
  nombre:string;
  idusuario:number;
  constructor(public navCtrl: NavController, public navParams: NavParams,public modalCtrl: ModalController,private storage: Storage) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad PrincipalPage');
     this.storage.get('nombre').then((val) => {
        this.nombre= val;
     })
     this.storage.get('idusuario').then((val) => {
        this.idusuario = val;
    })
  }
  persona(){    
    this.navCtrl.setRoot(PersonasPage);
  };
  irAsistencia(){
    this.navCtrl.setRoot(Asistencia, {}, {animate: true, direction: "forward"});
  }
  materias(){

  }
  acercade(){

  }
  ayuda(){

  };
  estadisticas(){
    
  };
  salir(){
    this.storage.ready().then(() => {
        this.storage.set('nombre', '');          
        this.storage.set('idusuario', 0);
    });
    this.navCtrl.setRoot(HomePage);
  }
}
