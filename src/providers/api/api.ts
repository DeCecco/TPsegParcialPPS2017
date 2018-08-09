import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { Storage } from '@ionic/storage';


/*
  Generated class for the ApiProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class ApiProvider {
  route: string = "http://localhost/UTN/TPsegParcialPPS2017/API/index.php/"; //servidor local work
  //route: string = "http://nggroup.esy.es/API/index.php/"; //servidor local //8@xZtlYoZNLpHKUOi(RM
  constructor(public http: HttpClient, private storage: Storage) { }

  //----------------------------------------I-TOKEN----------------------------------------//
  token(formData) {
    var body = {
      "mail": formData[0].mail,
      "idtipo": Number(formData[0].idtipo),
      "nombre": formData[0].nombre,
      "apellido": formData[0].apellido,
      "idimagen": formData[0].idimagen,
      "idusuario": formData[0].idusuario
    }
    return this.http.post(this.route + "crearToken", body).toPromise();
  }
  verificarToken(formData) {
    var body = {
      "token": formData[0].token
    }
    
    return this.http.post(this.route + "verificarToken", body).toPromise();
  }
  payLoad(formData) {
    var body = {
      "token": formData[0].token
    }
    return this.http.post(this.route + "payLoad", body).toPromise();
  }
  returnToken() {
    return this.storage.get('Token').then((token) => {
      var array = [{ "token": token }];
      return this.verificarToken(array).then((token) => {
        var array2 = [{ "token": token }];
        return this.payLoad(array).then((response2) => {
          
          return response2['data'];
        });
      });
    });
  }
  //----------------------------------------F-TOKEN----------------------------------------//    
  //----------------------------------------I-USUARIOS----------------------------------------//
  verificarUsuario(mail) {
    var data = {
      "mail": mail
    }
    return this.http.post(this.route + "usuarios/verificarUsuario", data).toPromise();
  }
  altaUsuario(formData) {
    var data = {
      "mail": formData[0].mail,
      "idtipo": formData[0].idtipo,
      "nombre": formData[0].nombre,
      "apellido": formData[0].apellido,
      "idimagen": formData[0].idimagen
    }
    return this.http.post(this.route + "usuarios/altaUsuario", data).toPromise();
  }
  traerDatosUser(mail) {
    var data = {
      "mail": mail
    }
    return this.http.post(this.route + "usuarios/traerDatosUser", data).toPromise();
  }
  //----------------------------------------F-USUARIOS----------------------------------------//
  //----------------------------------------I-AULAS----------------------------------------//
  traerAulas() {
    return this.http.get(this.route + "materias/traerAulas").toPromise().then(data => data);
  }
  //----------------------------------------F-AULAS----------------------------------------//

  altaAula(formData) {
    var data = {
      "aula": formData[0].aula,
    }
    return this.http.post(this.route + "materias/altaAula", data).toPromise();
  }

  abmGralPost(formData, ruta) {
    let data = {};

    for (let key in formData[0]) {
      data[key] = formData[0][key]
    }
    return this.http.post(this.route + ruta, data).toPromise();
  }

}
