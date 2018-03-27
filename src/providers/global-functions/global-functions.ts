import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { LoadingController } from 'ionic-angular';
/*
  Generated class for the GlobalFunctionsProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class GlobalFunctionsProvider {

  constructor(public http: HttpClient,public loadingCtrl: LoadingController) {
    console.log('Hello GlobalFunctionsProvider Provider');
  }

  cargando() {
    let loader = this.loadingCtrl.create({       
      dismissOnPageChange:true,      
      spinner:'ios'
    });
    loader.present();
  }

}
