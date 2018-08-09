import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { HomePage } from '../home/home';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { ApiProvider } from '../../providers/api/api';
import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';
import { AngularFireAuth } from 'angularfire2/auth';
import { UsuariosGPage } from '../usuarios-g/usuarios-g';
import { Storage } from '@ionic/storage';
import { Camera, CameraOptions } from '@ionic-native/camera';
import { Vibration } from '@ionic-native/vibration';
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
  arreglo: any;
  tipo: any;
  name: any;
  testImg: any;
  constructor(private vibration: Vibration, public navCtrl: NavController, private camera: Camera, public navParams: NavParams, public formBuilder: FormBuilder, private storage: Storage, private GlobalF: GlobalFunctionsProvider,
    private ApiProvider: ApiProvider, private db: AngularFirestore, private afAuth: AngularFireAuth) {
    this.where = navParams.get('where');
    this.idimagen = 1;
    if (this.where == 'HOME') {
      this.menu = "Agregar usuario";
      this.idtipo = 3;
    } else if (this.where == 'Alta') {
      this.menu = "Alta de usuario";
      this.password = '123456';
      this.password2 = '123456';
      this.returnToken();
    } else {
      this.returnToken();
      this.menu = "Modificar usuario";
      this.arreglo = navParams.get('arreglo');
      console.info(this.arreglo)
      this.password = '123456';
      this.password2 = '123456';
      this.mail = this.arreglo.mail;
      this.nombre = this.arreglo.nombre;
      this.apellido = this.arreglo.apellido;
      this.idtipo = Number(this.arreglo.idtipo);
      this.idimagen = this.arreglo.idimagen;
    }
    this.formUser = formBuilder.group({
      mail: [this.mail, Validators.compose([Validators.required, Validators.maxLength(30), Validators.minLength(6), Validators.pattern(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)])],
      password: [this.password, Validators.compose([Validators.required, Validators.maxLength(30)])],
      password2: [this.password2, Validators.compose([Validators.required, Validators.maxLength(30)])],
      nombre: [this.nombre, Validators.compose([Validators.required, Validators.maxLength(30), Validators.pattern('^[a-zA-Z ]+$')])],
      apellido: [this.apellido, Validators.compose([Validators.required, Validators.maxLength(30), Validators.pattern('^[a-zA-Z ]+$')])],
      idtipo: [this.idtipo, Validators.compose([Validators.required])],
      idimagen: [this.idimagen, Validators.compose([Validators.required])]
    });
  }
  returnToken() {
    this.ApiProvider.returnToken().then(response => {      
      this.name = response.nombre + ' ' + response.apellido;
      this.tipo = response.idtipo;
    }).catch(error => {
      this.GlobalF.cargando();
      this.storage.clear();
      this.navCtrl.setRoot(HomePage);
    })
  }

  back() {
    this.GlobalF.cargando();
    if (this.where == 'HOME') {
      this.navCtrl.setRoot(HomePage);

    } else {
      this.navCtrl.setRoot(UsuariosGPage);
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

    console.info(this.idimagen);
    if (this.checkPassword()) {
      if (this.formUser.valid) {
        if (this.where != 'Modificar') {

          var array = [{
            "nombre": this.nombre, "apellido": this.apellido, "mail": this.mail, "password": this.password,
            "idtipo": this.idtipo, "idimagen": this.idimagen
          }];
          this.insertarEnFB(array);
        } else {
          var array2 = [{
            "idusuario": this.arreglo.idusuario, "nombre": this.nombre, "apellido": this.apellido, "mail": this.mail, "idtipo": this.idtipo, "idimagen": this.idimagen, "estado": this.arreglo.estado
          }];
          this.ApiProvider.abmGralPost(array2, 'usuarios/modificarUsuario').then(Response => {
            this.navCtrl.setRoot(UsuariosGPage);
          }).catch(error => {
            this.GlobalF.error(0);
          })
        }
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
    try {
      const result = this.afAuth.auth.createUserWithEmailAndPassword(array[0].mail, array[0].password);
      if (result) {
        this.insertarEnFB2(array);

      } else {
        this.GlobalF.error(3)
      }
    } catch (error) {
      console.info(error)
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
        this.guardar2(array);
      })
      .catch((error) => {
        console.error("Error adding document: ", error);
      });
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad UsuariosPage');
  }

  photo(x) {
    this.vibration.vibrate(300);
    if (x == 1) {
      const options: CameraOptions = {
        quality: 50,
        destinationType: this.camera.DestinationType.FILE_URI,
        encodingType: this.camera.EncodingType.JPEG,
        mediaType: this.camera.MediaType.PICTURE,
        saveToPhotoAlbum: true,        
      }

      this.camera.getPicture(options).then((imageData) => {
        // imageData is either a base64 encoded string or a file URI
        // If it's base64 (DATA_URL):      
        this.idimagen = imageData;
      }, (err) => {
        // Handle error
      });
    } else {
      const options: CameraOptions = {
        quality: 50,
        destinationType: this.camera.DestinationType.NATIVE_URI,
        encodingType: this.camera.EncodingType.JPEG,
//        mediaType: this.camera.MediaType.PICTURE,
        saveToPhotoAlbum: true,
        sourceType: 2
      }

      this.camera.getPicture(options).then((imageData) => {
        // imageData is either a base64 encoded string or a file URI
        // If it's base64 (DATA_URL):      
        this.idimagen = imageData;
      }, (err) => {
        // Handle error
      });
    }
  }
}
