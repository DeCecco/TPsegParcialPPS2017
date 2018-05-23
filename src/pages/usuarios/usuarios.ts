import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { HomePage } from '../home/home';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { ApiProvider } from '../../providers/api/api';
import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';
import { AngularFireAuth } from 'angularfire2/auth';

/**
 * Generated class for the UsuariosPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-usuarios',
  templateUrl: 'usuarios.html',
})
export class UsuariosPage {
  where: string;
  formUser: FormGroup;
  mail: string;
  password: string;
  password2: string;
  nombre: string;
  apellido: string;
  idimagen: number;
  idtipo: number;
  menu: string;
  constructor(public navCtrl: NavController, public navParams: NavParams, public formBuilder: FormBuilder, private GlobalF: GlobalFunctionsProvider,
    private ApiProvider: ApiProvider, private db: AngularFirestore, private afAuth: AngularFireAuth) {
    this.formUser = formBuilder.group({
      mail: [this.mail, Validators.compose([Validators.required, Validators.maxLength(30), Validators.minLength(6), Validators.pattern(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)])],
      password: [this.password, Validators.compose([Validators.required, Validators.maxLength(30)])],
      password2: [this.password2, Validators.compose([Validators.required, Validators.maxLength(30)])],
      nombre: [this.nombre, Validators.compose([Validators.required, Validators.maxLength(30), Validators.pattern('^[a-zA-Z ]+$')])],
      apellido: [this.apellido, Validators.compose([Validators.required, Validators.maxLength(30), Validators.pattern('^[a-zA-Z ]+$')])],
      idtipo: [this.idtipo, Validators.compose([Validators.required])],
      idimagen: [this.idimagen, Validators.compose([Validators.required])]
    });
    this.where = navParams.get('where');

    if (this.where == 'HOME') {
      this.menu = "Agregar usuario";
    } else {
      this.menu = "Usuarios";
    }

  }
  back() {
    if (this.where == 'HOME') {
      this.navCtrl.setRoot(HomePage);

    } else {
      this.navCtrl.setRoot(MenuPage);
    }
  }
  checkPassword() {
    if (this.password == this.password2)
      return true;
    else
      return false;
  }
  guardar2(array) {
    this.ApiProvider.altaUsuario(array).then(response => {
      this.GlobalF.correcto(1);
      this.back();
    }).catch(error => {
      this.GlobalF.error(3)
      console.log(error);
    })
  }
  guardar() {
    if (this.checkPassword()) {
      if (this.formUser.valid) {
        var array = [{
          "nombre": this.nombre, "apellido": this.apellido, "mail": this.mail, "password": this.password,
          "idtipo": this.idtipo, "idimagen": this.idimagen
        }];
        this.insertarEnFB(array);
      } else {
        this.GlobalF.error(1);
      }
    } else {
      this.GlobalF.error(4);
      this.password = '';
      this.password2 = '';
    }
  }

  insertarEnFB(array) {
    const result = this.afAuth.auth.createUserWithEmailAndPassword(array[0].mail, array[0].password);
    if (result) {
      this.insertarEnFB2(array);
      this.guardar2(array);
    } else {
      this.GlobalF.error(3)
    }
  }
  insertarEnFB2(array) {
    this.db.collection("usuarios").add({
      nombre: array[0].nombre,
      apellido: array[0].apellido,
      mail: array[0].mail,
      idtipo: array[0].idtipo,
      idimagen: array[0].idimagen
    })
      .then((docRef) => {
        console.log("Document written with ID: ", docRef.id);
      })
      .catch((error) => {
        console.error("Error adding document: ", error);
      });
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad UsuariosPage');
  }

}
