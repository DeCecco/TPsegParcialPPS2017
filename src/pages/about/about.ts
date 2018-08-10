import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
/**
 * Generated class for the AboutPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-about',
  templateUrl: 'about.html',
})
export class AboutPage {

  constructor(public navCtrl: NavController, public navParams: NavParams,private GlobalF: GlobalFunctionsProvider) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad AboutPage');
  }
  back() {
    this.GlobalF.cargando();    
    this.navCtrl.setRoot(MenuPage)
  }

}
