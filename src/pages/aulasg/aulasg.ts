import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, Menu } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { PopoverController } from 'ionic-angular';
import { PopoverComponent } from '../../components/popover/popover';
import { ApiProvider } from '../../providers/api/api';
import { AmaulasPage } from '../amaulas/amaulas';
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
  listaAulas : any;
  estado:string;
  constructor(public navCtrl: NavController, public navParams: NavParams,public popoverCtrl: PopoverController,private ApiProvider: ApiProvider) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad AulasgPage');
    this.ApiProvider.traerAulas()
      .then(data => {
        this.listaAulas=data;        
      })
      .catch(error => {
          console.log('ERROR: '+error);
        });

  }

  back(){
    this.navCtrl.setRoot(MenuPage);
  }
  menu(evento){
    const popover = this.popoverCtrl.create(PopoverComponent);
    popover.present({
      ev:evento
    });
    /*popover.onDidDismiss(popoverData=>{
      console.log(popoverData);
      console.log(popoverData.do);
      switch(popoverData.do){
        case 1:

        break;
        default:
        break;
      }
    })*/
  }

  add(){
    this.estado='Alta';
    this.navCtrl.push(AmaulasPage, { estado: this.estado });
  }
}
