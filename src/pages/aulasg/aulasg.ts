import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { PopoverController } from 'ionic-angular';
import { PopoverComponent } from '../../components/popover/popover';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { AmaulasPage } from '../amaulas/amaulas';
import { Storage } from '@ionic/storage';
import { HomePage } from '../home/home';
/**
 * Generated class for the AulasgPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-aulasg',
  templateUrl: 'aulasg.html',
})
export class AulasgPage {
  listado: any;
  estado: string;
  nombre: string;
  tipo: any;
  constructor(public navCtrl: NavController, public navParams: NavParams, public popoverCtrl: PopoverController, private storage: Storage, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider) {
    this.returnToken();
  }

  returnToken() {
    this.ApiProvider.returnToken().then(response => {
      console.info(response)
      this.nombre = response.nombre + ' ' + response.apellido;
      this.tipo = response.tipo;
    }).catch(error => {
      this.nombre = '0'
      this.tipo = 0;
      this.GlobalF.cargando();
      this.storage.clear();
      this.navCtrl.setRoot(HomePage);
    })
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad AulasgPage');
    this.listar();
  }
  listar() {
    this.ApiProvider.traerAulas()
      .then(data => {
        this.listado = data;
      })
      .catch(error => {
        console.log('ERROR: ' + error);
      });
  }
  back() {
    this.navCtrl.setRoot(MenuPage);
  }
  menu(evento) {
    const popover = this.popoverCtrl.create(PopoverComponent);
    popover.present({
      ev: evento
    });
  }

  add() {

    this.estado = 'Alta';
    this.navCtrl.push(AmaulasPage, { estado: this.estado });
  }

  modificar(item) {

    this.estado = 'Modificar';
    this.navCtrl.push(AmaulasPage, { estado: this.estado, aula: item });
  }

  eliminar(item) {
    

      let promt = this.GlobalF.alerta(2);
      promt.present();
      promt.onDidDismiss((data) => {
        if (data) {
          let array = [];
          array.push(item);

          this.ApiProvider.abmGralPost(array, 'materias/modificarAula').then(Response => {
            this.GlobalF.correcto(1);
            this.listar()
          }).catch(error => {
            this.GlobalF.error(5);
          })
        }
      })
    
  }
  opciones(x) {
    const as = this.GlobalF.opcionesAS();
    as.present({
      ev: event
    })
    as.onDidDismiss(response => {
      switch (response) {
        case 1:
          this.modificar(x);
          break;
        case 2:
          x.estado = 0;
          this.eliminar(x);
          break;
        default:
          break;
      }
    })
  }
}
