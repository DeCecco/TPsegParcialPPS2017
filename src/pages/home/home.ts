import { Component } from '@angular/core';
import { NavController, ModalController } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
//import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';
import { AngularFireAuth } from 'angularfire2/auth';
//import { Observable } from 'rxjs/Observable';
import { MenuPage } from '../menu/menu';
import { UsuariosPage } from '../usuarios/usuarios';
import { Storage } from '@ionic/storage';


@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  formLogin: FormGroup;
  mail: string;
  password: string;
  constructor(public navCtrl: NavController, public formBuilder: FormBuilder, private ApiProvider: ApiProvider, /*private db: AngularFirestore,*/
    private GlobalF: GlobalFunctionsProvider, public modalCtrl: ModalController, private afAuth: AngularFireAuth, private storage: Storage) {
    //this.mail = "pablomdececcorios@gmail.com";
    //this.password = "agos1305";
    this.formLogin = formBuilder.group({
      mail: [this.mail, Validators.compose([Validators.required, Validators.maxLength(30), Validators.minLength(6), Validators.pattern(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)])],
      password: [this.password, Validators.compose([Validators.required, Validators.maxLength(30), Validators.minLength(6)])]
    });


  }
  presentProfileModal() {
    let profileModal = this.modalCtrl.create(UsuariosPage, { where: 'HOME' });
    profileModal.present();
  }
  registrarse() {
    this.presentProfileModal();
  }



  async ingresar2() {
    this.GlobalF.cargando();
    try {
      const result = await this.afAuth.auth.signInWithEmailAndPassword(this.mail, this.password);
      if (result) {
        this.navCtrl.setRoot(MenuPage);
      }
    }
    catch (e) {
      console.error(e);
    }
  }


  ingresar() {

    if (this.formLogin.valid) {
      try {

        //this.afAuth.auth.signInWithEmailAndPassword(this.mail, this.password).then(response => {
        this.GlobalF.cargando();
        console.info(this.mail)
        this.ApiProvider.verificarUsuario(this.mail).then(response => {
          if (response[0].existe > 0) {

            var array = [{
              "nombre": response[0].nombre, "apellido": response[0].apellido, "email": response[0].mail, "tipo": response[0].idtipo, "img": response[0].idimagen
            }];
            console.info(array)
            this.ApiProvider.token(array).then(tk => {
              this.storage.set('Token', tk);
              this.GlobalF.cargando();
              setTimeout(() => {

                this.navCtrl.setRoot(MenuPage);  
              }, 2000);
              
            }).catch(error => {
              this.GlobalF.error(3)
              console.log(error);
            });
            //this.local.set("userInfo",data[0]);              
          } else {
            this.GlobalF.error(2)
          }

        }).catch(error => {
          this.GlobalF.error(0)
          console.warn(error)
        })
        /*}).catch(error => {
          this.GlobalF.error(2)
        });*/
      } catch (e) {
        console.error(e);
      }
    } else {
      this.GlobalF.error(1)
    }

  }
  harcode(donde) {
    switch (donde) {
      case 1:
        this.mail = "pablomdececcorios@gmail.com";
        this.password = '568977pñ';
        break;
      case 2:
        this.mail = "ovillegas@gmail.com";
        this.password = '123456';
        break;
      case 3:
        this.mail = "luciana.a.arrua@gmail.com";
        this.password = '123456';
        break;
      case 4:
        this.mail = "pablo.dececco@hotmail.com";
        this.password = '123456';
        break;
      default:

        break;
    }
  }

  forgot() {
    this.afAuth.auth.sendPasswordResetEmail(this.mail).then(response=> {     

    }).catch(error=> {
      //TODO: FALTA MENSAJE
      this.GlobalF.error(error.message)
      console.error(error)
    });

  }


}
