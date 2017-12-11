import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, ModalController, AlertController, ToastController, ActionSheetController, Platform } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { Camera, CameraOptions } from '@ionic-native/camera';

import { PersonasService } from '../../app/personas.service';
import { personas } from './persona';
import { PersonasPage } from '../personas/personas';

/**
 * Generated class for the PersonasamPage page.
 *
 * See http://ionicframework.com/docs/components/#navigation for more info
 * on Ionic pages and navigation.
 */
@IonicPage()
@Component({
  selector: 'page-personasam',
  templateUrl: 'personasam.html',
})


export class PersonasamPage {
  estado: string;
  persona: personas;
  nombre: string = '';
  apellido: string = '';
  email: string = '';
  email2: string = '';
  password: string = '';
  password2: string = '';
  rolasignado: number;
  dni: number;
  dni2: number;
  legajo: number;
  legajo2: number;
  id: number;
  img:string;
  modifica: boolean = true;
  formPersonaAM: FormGroup;
  constructor(public navCtrl: NavController, public navParams: NavParams, public formBuilder: FormBuilder, private PersonaService: PersonasService,
    private alertCtrl: AlertController, public toastCtrl: ToastController, public actionSheetCtrl: ActionSheetController, public platform: Platform,
    private camera: Camera) {
    this.estado = this.navParams.get("estado");
    this.id = this.navParams.get("id");
    this.formPersonaAM = formBuilder.group({
      //VALIDACIONES
      nombre: [this.nombre, Validators.compose([Validators.required, Validators.maxLength(30), Validators.pattern('^[a-zA-Z]+$')])],
      apellido: [this.apellido, Validators.compose([Validators.required, Validators.maxLength(30), Validators.pattern('^[a-zA-Z ]+$')])],
      password: [this.password, Validators.compose([Validators.required, Validators.maxLength(30)])],
      password2: [this.password2, Validators.compose([Validators.required, Validators.maxLength(30)])],
      email: [this.email, Validators.compose([Validators.required, Validators.maxLength(30), Validators.pattern(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)])],
      rolasignado: [this.rolasignado, Validators.compose([Validators.required])],
      dni: [this.dni/*, Validators.compose([Validators.required])*/],
      legajo: [this.legajo/*, Validators.compose([Validators.required])*/]
    });
  }

  ionViewDidLoad() {
    if (this.estado != 'Alta') {
      this.modifica = true;
      this.PersonaService.TraerUsuarios(this.id).then(
        data => {
          if (typeof data[0] != 'undefined') {
            this.nombre = data[0].nombre;
            this.apellido = data[0].apellido;
            this.email = data[0].email;
            this.email2 = data[0].email;
            this.password = data[0].password;
            this.password2 = data[0].password;
            this.rolasignado = data[0].idRol;
            if (this.rolasignado == 3) {
              this.PersonaService.TraerUsuariosMasDatos(this.id).then(
                data => {
                  this.dni = data[0].dni;
                  this.dni2 = data[0].dni;
                  this.legajo = data[0].legajo;
                  this.legajo2 = data[0].legajo;
                })
                .catch(error => {
                  console.log('ERROR: ' + error);
                });
            }
          } else {
            this.ErrorAlGrabar();
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });
    } else {
      this.modifica = false;
    }
    console.log('ionViewDidLoad PersonasamPage');
  }
  create() {
    console.info('create')
    this.modifica = false;
  }
  ErrorForm() {
    let alert = this.alertCtrl.create({
      title: 'Formulario Incompleto',
      subTitle: 'Por favor, complete todos los campos antes de grabar',
      buttons: ['Aceptar']
    });
    alert.present();
  }
  ErrorAlGrabar() {
    let alert = this.alertCtrl.create({
      title: 'Error al grabar',
      subTitle: 'Verifique los datos ingresados o comuniquese con soporte',
      buttons: ['Aceptar']
    });
    alert.present();
  }
  ErrorAlBorrar() {
    let alert = this.alertCtrl.create({
      title: 'Error al Borrar',
      subTitle: 'Comuniquese con soporte',
      buttons: ['Aceptar']
    });
    alert.present();
  }
  ErrorEnUso(que, x) {
    let alert = this.alertCtrl.create({
      title: que + ' en uso',
      subTitle: 'El ' + que + ' ' + x + ' ya se encuentra en nuestra base de datos',
      buttons: ['Aceptar']
    });
    alert.present();
  }
  toastOk(x) {
    let toast = this.toastCtrl.create({
      message: x + ' correctamente',
      position: 'middle',
      duration: 1000
    });
    toast.present();
  }
  segunTipo() {
    //por ahora nada
  }
  back() {
    this.navCtrl.setRoot(PersonasPage);
  }
  verificarMail() {
    var pasa = 1;
    if (this.estado != 'Alta') {
      if (this.email == this.email2) {
        pasa = 0;
      }
    }
    if (this.email != '') {
      if (pasa == 1) {
        console.info('paso')
        this.PersonaService.VerificarEmail(this.email).then(
          data => {
            console.info(data)
            if (data['_body'] != "false") {
              this.ErrorEnUso('Email', this.email);
              this.email = '';
            }
          })
          .catch(error => {
            console.log('ERROR: ' + error);
          });
      }
    }
  }
  verificarDni() {
    var pasa = 1
    if (this.estado != 'Alta') {
      if (this.dni == this.dni2) {
        pasa = 0;
      }
    }
    // if(this.dni !=''){   
    if (pasa == 1) {
      this.PersonaService.VerificarDni(this.dni).then(
        data => {
          if (data['_body'] != "false") {
            this.ErrorEnUso('DNI', this.dni);
            this.dni = 0;
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });
      // }
    }
  }
  verificarLegajo() {
    //if(this.legajo!=''){ 
    var pasa = 1;
    if (this.estado != 'Alta') {
      if (this.legajo == this.legajo2) {
        pasa = 0;
      }
    }
    if (pasa == 1) {
      this.PersonaService.VerificarLegajo(this.legajo).then(
        data => {
          if (data['_body'] != "false") {
            this.ErrorEnUso('Legajo', this.legajo);
            this.legajo = 0;
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });
      //}
    }
  }
  checkPass() {
    if (this.password2 != '') {
      if (this.password2 != this.password) {
        let alert = this.alertCtrl.create({
          title: 'ATENCIÓN',
          subTitle: 'Verifique que los password sean iguales',
          buttons: ['Aceptar']
        });
        alert.present();
        this.password2 = '';
      }
    }
  }
  guardar() {
    var array = [{
      "nombre": this.nombre, "apellido": this.apellido, "email": this.email, "password": this.password,
      "rol": this.rolasignado, "dni": this.dni, "legajo": this.legajo, "id": this.id
    }];
    if (this.estado == 'Alta') {

      if (this.formPersonaAM.valid) {

        this.PersonaService.AgregarPersona(array).then(
          data => {
            if (data['_body'] == "true") {
              this.navCtrl.setRoot(PersonasPage);
              this.toastOk('Grabado');
            } else {
              this.ErrorAlGrabar();
            }
          })
          .catch(error => {
            console.log('ERROR: ' + error);
          });
      } else {
        this.ErrorForm();
      }
    } else {
      this.PersonaService.ModificarPersona(array).then(
        data => {
          if (data['_body'] == "true") {
            this.navCtrl.setRoot(PersonasPage);
            this.toastOk('Modificado');
          } else {
            this.ErrorAlGrabar();
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });
    }
  }

  delete() {
    let alert = this.alertCtrl.create({
      title: 'Eliminar',
      message: '¿Desea eliminar el usuario?',
      buttons: [
        {
          text: 'No',
          role: 'cancel',
          handler: () => {

          }
        },
        {
          text: 'Si',
          handler: () => {
            this.PersonaService.BorrarPersona(this.id, this.rolasignado).then(
              data => {
                console.info(data)
                if (data['_body'] != "true") {
                  this.ErrorAlBorrar();
                } else {
                  this.navCtrl.setRoot(PersonasPage);
                  this.toastOk('Borrado');
                }
              })
              .catch(error => {
                console.log('ERROR: ' + error);
              });
          }
        }
      ]
    });
    alert.present();
  }

  presentActionSheet() {
    let actionSheet = this.actionSheetCtrl.create({
      title: '¿Qué desea realizar?',
      buttons: [
        {
          text: 'Eliminar',
          role: 'eliminar',
          icon: !this.platform.is('ios') ? 'trash' : null,
          handler: () => {
            this.delete();
          }
        }, {
          text: 'Modificar',
          icon: !this.platform.is('ios') ? 'md-create' : null,
          handler: () => {
            this.create();
          }
        }, {
          text: 'Cancelar',
          icon: !this.platform.is('ios') ? 'close' : null,
          role: 'cancelar',
          handler: () => {

          }
        }
      ]
    });
    actionSheet.present();
  }

  imagen() {
    const options: CameraOptions = {
      quality: 100,
      destinationType: this.camera.DestinationType.DATA_URL,
      encodingType: this.camera.EncodingType.JPEG,
      mediaType: this.camera.MediaType.PICTURE
    }

    this.camera.getPicture(options).then((imageData) => {
      // imageData is either a base64 encoded string or a file URI
      // If it's base64:
      let base64Image = 'data:image/jpeg;base64,' + imageData;
      this.img=base64Image;
    }, (err) => {
      // Handle error
    });
  }


}
