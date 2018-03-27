import { Component } from '@angular/core';
import { NavController,ModalController } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { AngularFirestore/*, AngularFirestoreDocument */} from 'angularfire2/firestore';
//import { Observable } from 'rxjs/Observable';
import { MenuPage } from '../menu/menu';
import { UsuariosPage } from '../usuarios/usuarios';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  formLogin: FormGroup;
  mail: string;
  password: string;
  constructor(public navCtrl: NavController, public formBuilder: FormBuilder, private ApiProvider: ApiProvider, private db: AngularFirestore,
  private GlobalF: GlobalFunctionsProvider,public modalCtrl: ModalController) {
    this.formLogin = formBuilder.group({
      mail: [this.mail, Validators.compose([Validators.maxLength(30), Validators.pattern('[a-zA-Z ]*'), Validators.required])],
      password: [this.password, Validators.compose([Validators.maxLength(30), Validators.required])]
    });


  }
  presentProfileModal() {
    let profileModal = this.modalCtrl.create(UsuariosPage, { where: 'HOME' });
    profileModal.present();
  }
  registrarse() {
    this.presentProfileModal();
    /*
    this.db.collection("usuarios").add({
      nombre: "Pablo",
      apellido: "De Cecco",
      mail: 'pablo.dececco@hotmail.com',
      password: '722567'
    })
      .then((docRef) => {
        console.log("Document written with ID: ", docRef.id);
      })
      .catch((error) => {
        console.error("Error adding document: ", error);
      });*/
  }
   
  
  ingresar() {
    this.ApiProvider.verificarUsuario(this.mail, this.password).then(response => {
      console.info(response)
      
      var array = [{
        "nombre": response[0].nombre, "apellido": response[0].apellido, "email": response[0].mail, "tipo": response[0].idtipo, "img": response[0].idimagen
      }];
      this.ApiProvider.token(array).then(tk => {        
        this.GlobalF.cargando();
        this.navCtrl.setRoot(MenuPage); 
        
       // this.stop();
      }).catch(error => {
        console.log(error);
      });
      //this.local.set("userInfo",data[0]);              
      



    }).catch(error => {
      console.warn(error)
    })
  }
  administrador() {

    this.mail = 'pablo.dececco@hotmail.com';
    this.password = '722567';
    this.ingresar();
  }
}
