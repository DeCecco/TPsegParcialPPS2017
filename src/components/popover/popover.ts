import { Component } from '@angular/core';
import { ViewController, NavController, ModalController } from 'ionic-angular';
import { MenuPage } from '../../pages/menu/menu';
import { Storage } from '@ionic/storage';
import { MateriasGPage } from '../../pages/materias-g/materias-g';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { HomePage } from '../../pages/home/home';
/**
 * Generated class for the PopoverComponent component.
 *
 * See https://angular.io/api/core/Component for more info on Angular
 * Components.
 */
@Component({
  selector: 'popover',
  templateUrl: 'popover.html'
})
export class PopoverComponent {

  text: string;
  items: any;

  constructor(public viewCtrl: ViewController, public navCtrl: NavController, private GlobalF: GlobalFunctionsProvider, private storage: Storage) {
    this.text = 'Hello World';
    this.items = [
      { item: 'Volver al menu', do: 1, icon: 'md-list' },
      { item: 'Tomar asistencia', do: 2, icon: 'ios-list-box' },
      // { item: 'Reportes', do: 1, icon: 'ios-stats' },
      //{ item: 'Salir', do: 4, icon: 'md-log-out' }
    ]
  }

  itemClick(item) {
    console.info(item)
    switch (item.do) {
      case 1:
        this.navCtrl.push(MenuPage)
        break;
      case 2:
        this.navCtrl.push(MateriasGPage, { estado: 'Asistencia' });
        break;
      case 4:
        this.GlobalF.cargando();
        this.storage.clear();
        //this.navCtrl.pop();
        this.navCtrl.push(HomePage);
        break;
      default:
        break;
    }
    //this.viewCtrl.dismiss(item);
  }

}
