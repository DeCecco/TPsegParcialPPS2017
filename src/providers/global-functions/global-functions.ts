import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { LoadingController, ToastController } from 'ionic-angular';
/*
  Generated class for the GlobalFunctionsProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class GlobalFunctionsProvider {

  constructor(public http: HttpClient, public loadingCtrl: LoadingController, public toastCtrl: ToastController) {
    console.log('Hello GlobalFunctionsProvider Provider');
  }

  cargando() {
    let loader = this.loadingCtrl.create({
      dismissOnPageChange: true,
      spinner: 'ios'
    });
    loader.present();
  }

  error(x) {
    switch (x) {
      case 1: x = 'Formulario invalido, revise sus datos';
        break;
      case 2: x = 'Credenciales invalidas';
        break;
      case 3: x = 'Token Invalido';
      break;
      default: x = 'COMUNIQUESE CON SOPORTE';
        break;
    }
    let toast = this.toastCtrl.create({

      message: 'ERROR: ' + x,
      position: 'middle',
      duration: 2000
    });
    toast.present();
  }

}
