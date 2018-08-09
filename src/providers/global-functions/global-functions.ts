import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AngularFirestore/*, AngularFirestoreDocument */ } from 'angularfire2/firestore';

import { AlertController, LoadingController, ToastController, ActionSheetController } from 'ionic-angular';

/*
  Generated class for the GlobalFunctionsProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class GlobalFunctionsProvider {

  constructor(public http: HttpClient, public loadingCtrl: LoadingController, public toastCtrl: ToastController, public alertCtrl: AlertController, private db: AngularFirestore,
    public actionSheetCtrl: ActionSheetController) {
    console.log('Hello GlobalFunctionsProvider Provider');
  }

  cargando() {
    let loader = this.loadingCtrl.create({
      dismissOnPageChange: true,
      cssClass: 'transparent',
      spinner: 'ios'
    });
    loader.present();
  }

  error(x) {
    switch (x) {
      case 0: x = 'COMUNIQUESE CON SOPORTE';
        break;
      case 1: x = 'Formulario invalido, revise sus datos';
        break;
      case 2: x = 'Credenciales invalidas';
        break;
      case 3: x = 'Token Invalido';
        break;
      case 4: x = 'Los passwords deben ser iguales';
        break;
      case 5: x = 'Error al grabar los datos, intente nuevamente';
        break;
      case 6: x = 'Seleccione un Año valido!';
        break;
      case 7: x = 'Seleccione un Cuatrimestre valido!';
        break;
      case 8: x = 'Seleccione un Turno valido!';
        break;
      case 9: x = 'No se encuentra una lista para grabar!';
        break;
      case 10: x = 'El valor ingresado ya se encuentra en la base!';
        break;
      default: x = x;
        break;
    }
    let toast = this.toastCtrl.create({

      message: 'ERROR: ' + x,
      position: 'middle',
      duration: 3000
    });
    toast.present();
  }
  correcto(x) {
    switch (x) {
      case 1: x = 'Se grabaron correctamente los datos';
        break;
      case 2: x = 'Por favor revise su casilla de correo';
        break;
      case 3: x = 'Token Invalido';
        break;
      case 4: x = 'Los passwords deben ser iguales';
        break;
      default: x = x;
        break;
    }
    let toast = this.toastCtrl.create({

      message: 'EXITO: ' + x,
      position: 'middle',
      duration: 2000
    });
    toast.present();
  }

  alerta(x) {
    var z = '';
    switch (x) {
      case 0:
        z = 'Esta a punto de salir sin grabar. ¿Esta Seguro?';
        break;
      case 1:
        break;
      case 2:
        z = '¿Esta seguro que desea eliminar el item seleccionado?';
        break;
      default:
        z = z;
        break;
    }
    const prompt = this.alertCtrl.create({
      title: 'Atencion',
      message: z,
      buttons: [
        {
          text: 'Si',
          handler: () => {
            prompt.dismiss(true);
            return false;
          }
        },
        {
          text: 'No',
          handler: () => {
            prompt.dismiss(false);
            return false;
          }
        }
      ]
    });
    //prompt.present();

    return prompt;
  }

  guardarFirebaseDB(array, data) {

    for (let key in array[0]) {

      this.db.collection(data).add({
        [key]: array[0][key],

      })
        .then((docRef) => {
          console.log("Document written with ID: ", docRef.id);
        })
        .catch((error) => {
          console.error("Error adding document: ", error);
        });
    }
  }
  opcionesAS() {
    let actionSheet = this.actionSheetCtrl.create({
      title: 'Opciones',
      buttons: [
        {
          text: 'Modificar',
          role: 'modificar',
          icon: "md-create",
          handler: () => {
            actionSheet.dismiss(1);
            return false;
          }
        },
        {
          text: 'Eliminar',
          icon: 'md-trash',
          handler: () => {
            actionSheet.dismiss(2);
            return false;
          }
        },
        {
          text: 'Cancelar',
          role: 'cancelar',
          handler: () => {
            actionSheet.dismiss(3);
            return false;
          }
        }
      ]
    });

    //actionSheet.present();
    return actionSheet;
  }
  opcionesAS2() {
    let actionSheet = this.actionSheetCtrl.create({
      title: 'Opciones',
      buttons: [
        {
          text: 'Modificar',
          role: 'modificar',
          icon: "md-create",
          handler: () => {
            actionSheet.dismiss(1);
            return false;
          }
        },
        {
          text: 'Eliminar',
          icon: 'md-trash',
          handler: () => {
            actionSheet.dismiss(2);
            return false;
          }
        },
        {
          text: 'Asignar Materias',
          role: 'Asign',
          icon: "md-filing",
          handler: () => {
            actionSheet.dismiss(4);
            return false;
          }
        },
        {
          text: 'Cancelar',
          role: 'cancelar',
          handler: () => {
            actionSheet.dismiss(3);
            return false;
          }
        }
      ]
    });

    //actionSheet.present();
    return actionSheet;
  }
  opcionesAsistencia() {
    let actionSheet = this.actionSheetCtrl.create({
      title: 'Estado',
      buttons: [
        {
          text: 'Presente',
          role: 'presente',
          icon: "ios-checkmark-circle",
          cssClass: 'green',
          handler: () => {
            actionSheet.dismiss(1);
            return false;
          }
        },
        {
          text: 'Ausente',
          icon: 'ios-close-circle',
          cssClass: 'ColorRed',
          handler: () => {
            actionSheet.dismiss(2);
            return false;
          }
        },
        {
          text: 'Justificado',
          role: 'justificado',
          icon: "ios-clipboard",
          handler: () => {
            actionSheet.dismiss(3);
            return false;
          }
        },
        {
          text: 'Media Falta',
          role: 'media falta',
          icon: "ios-clock",
          handler: () => {
            actionSheet.dismiss(4);
            return false;
          }
        },
        {
          text: 'Cancelar',
          role: 'cancelar',
          handler: () => {
            actionSheet.dismiss(5);
            return false;
          }
        }
      ]
    });

    //actionSheet.present();
    return actionSheet;
  }
}
