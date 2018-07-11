import { Component } from '@angular/core';
import { ViewController, NavController, ModalController } from 'ionic-angular';
import { MenuPage } from '../../pages/menu/menu';

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
  items:any;

  constructor( public viewCtrl : ViewController,public navCtrl: NavController) {    
    this.text = 'Hello World';
    this.items=[
      {item: 'Volver al menu', do: 1,icon:'md-list'},
      {item: 'Tomar asistencia', do: 1,icon:'ios-list-box'},
      {item: 'Reportes', do: 1,icon:'ios-stats'},
      {item: 'Salir', do: 2,icon:'md-log-out'}
    ]
  }

  itemClick(item){    
    switch(item.do){
      case 1:        
        this.navCtrl.push(MenuPage)
      break;
      default:
      break;
    }    
    //this.viewCtrl.dismiss(item);
  }

}
