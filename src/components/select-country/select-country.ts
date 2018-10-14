import { Component } from '@angular/core';
import { ViewController, NavController, ModalController } from 'ionic-angular';
import { MenuPage } from '../../pages/menu/menu';
import { Storage } from '@ionic/storage';
import { MateriasGPage } from '../../pages/materias-g/materias-g';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { HomePage } from '../../pages/home/home';
import { TranslateService } from '@ngx-translate/core'
import { Globalization } from '@ionic-native/globalization';
/**
 * Generated class for the SelectCountryComponent component.
 *
 * See https://angular.io/api/core/Component for more info on Angular
 * Components.
 */
@Component({
  selector: 'select-country',
  templateUrl: 'select-country.html'
})
export class SelectCountryComponent {

  text: string;
  items: any;
  lan:string;
  constructor(private translateService: TranslateService,public viewCtrl: ViewController, public navCtrl: NavController, private globalization: Globalization,private GlobalF: GlobalFunctionsProvider, private storage: Storage) {
    this.globalization.getPreferredLanguage()
      .then(res => this.choose(res.value.substring(0, 2)))
      .catch(e => console.log(e));

    this.items = [
      { item: 'Español', do: 'es', icon: 'md-flag',color:'red' },
      { item: 'Ingles', do: 'en', icon: 'md-flag',color:'blue' },
      { item: 'Portugués', do: 'pt', icon: 'md-flag',color:'green' },
      // { item: 'Reportes', do: 1, icon: 'ios-stats' },
      //{ item: 'Salir', do: 4, icon: 'md-log-out' }
    ]
  }

  itemClick(item) {    
    this.choose(item);
    this.viewCtrl.dismiss(item);
  }

  choose(lang) {
    this.translateService.use(lang);
    this.lan=lang;
  }

}
