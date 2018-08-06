import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiProvider } from '../../providers/api/api';
import { Storage } from '@ionic/storage';
import { AulasgPage } from '../aulasg/aulasg';
import { MateriasGPage } from '../materias-g/materias-g';
import { UsuariosGPage } from '../usuarios-g/usuarios-g';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { HomePage } from '../home/home';
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
  nombre: any;
  name: string;
  tipo:any;
  constructor(public navCtrl: NavController, public navParams: NavParams, private storage: Storage, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider) {
    this.nombre='-Sin Nombre-';             
    
    this.returnToken();
    

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
  
  ionViewDidLoad() {
    console.log('ionViewDidLoad MenuPage');
  }
  goTo(where) {
    console.info(where);
    switch (where) {
      case 1:
        break;
      case 2:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(MateriasGPage, { estado: 'Asistencia' });
        break;
      case 3:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(MateriasGPage);
        break;
      case 4:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(AulasgPage);
        break;
      case 5:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(UsuariosGPage);
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        this.GlobalF.cargando();
        this.storage.clear();
        this.navCtrl.setRoot(HomePage);
        break;
      default:
        break;
    }
  }
}
