import { Component } from '@angular/core';
import { NavController, ModalController } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
//import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';
import { AngularFireAuth } from 'angularfire2/auth';
//import { Observable } from 'rxjs/Observable';
import { MenuPage } from '../menu/menu';
import { EstadisticasPage } from '../estadisticas/estadisticas';
import { UsuariosPage } from '../usuarios/usuarios';
import { Storage } from '@ionic/storage';
import { Vibration } from '@ionic-native/vibration';
import { Toast } from '@ionic-native/toast';
import { ScreenOrientation } from '@ionic-native/screen-orientation';


@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  formLogin: FormGroup;
  mail: string;
  password: string;
  constructor(private screenOrientation: ScreenOrientation,private vibration: Vibration,public navCtrl: NavController, public formBuilder: FormBuilder, private ApiProvider: ApiProvider, /*private db: AngularFirestore,*/
    private GlobalF: GlobalFunctionsProvider, public modalCtrl: ModalController, private afAuth: AngularFireAuth, private storage: Storage,private toast: Toast) {
    //this.mail = "pablomdececcorios@gmail.com";
    //this.password = "agos1305";
    this.screenOrientation.lock(this.screenOrientation.ORIENTATIONS.PORTRAIT);
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
        this.navCtrl.setRoot(EstadisticasPage);
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
        
        this.ApiProvider.verificarUsuario(this.mail).then(response => {
          if (response[0].existe > 0) {
            
            var array = [{
              "idusuario": response[0].idusuario,"nombre": response[0].nombre, "apellido": response[0].apellido, "mail": response[0].mail, "idtipo": response[0].idtipo, "idimagen": response[0].idimagen
            }];
            console.info(array)
            this.ApiProvider.token(array).then(tk => {
              this.storage.set('Token', tk);
              //this.GlobalF.cargando();
              setTimeout(() => {

                this.navCtrl.setRoot(EstadisticasPage);  
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
    if(this.mail){
      this.vibration.vibrate(500);
      this.toast.show(`Se envio un correo a su casilla`, '5000', 'center').subscribe(
        toast => {
          console.log(toast);
        }
      );
      this.afAuth.auth.sendPasswordResetEmail(this.mail).then(response=> {     

      }).catch(error=> {
        //TODO: FALTA MENSAJE
        this.GlobalF.error(error.message)
        console.error(error)
      });
    }else{
      this.GlobalF.error('Ingrese un mail valido')
    }

  }


}
