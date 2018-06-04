import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';


/*
  Generated class for the ApiProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class ApiProvider {
  route: string = "http://localhost:8080/UTN/TPsegParcialPPS2017/API/index.php/"; //servidor local
  constructor(public http: HttpClient) { }

  //----------------------------------------I-TOKEN----------------------------------------//
  token(formData) {
    var body = {
      "email": formData[0].email,
      "tipo": formData[0].tipo,
      "nombre": formData[0].nombre,
      "apellido": formData[0].apellido,
      "img": formData[0].img
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
  traerDatosUser(mail){
    var data = {
      "mail": mail      
    }
    return this.http.post(this.route + "usuarios/traerDatosUser", data).toPromise();
  }
  //----------------------------------------F-USUARIOS----------------------------------------//

}
