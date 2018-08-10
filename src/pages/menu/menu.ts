import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiProvider } from '../../providers/api/api';
import { Storage } from '@ionic/storage';
import { AulasgPage } from '../aulasg/aulasg';
import { MateriasGPage } from '../materias-g/materias-g';
import { UsuariosGPage } from '../usuarios-g/usuarios-g';
import { AboutPage } from '../about/about';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { HomePage } from '../home/home';
import { UsuariosPage } from '../usuarios/usuarios';
import { EstadisticasPage } from '../estadisticas/estadisticas';
import { ScreenOrientation } from '@ionic-native/screen-orientation';
import { QRScanner, QRScannerStatus } from '@ionic-native/qr-scanner';
import { Vibration } from '@ionic-native/vibration';
import { DeviceMotion, DeviceMotionAccelerationData } from '@ionic-native/device-motion';

//import { Push, PushObject, PushOptions } from '@ionic-native/push';

/**
 * Generated class for the MenuPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-menu',
  templateUrl: 'menu.html',
})
export class MenuPage {
  nombre: any;
  name: string;
  tipo: any;
  idimagen: any;
  idusuario: any;
  item:any;
  constructor(/*private push: Push,*/ private deviceMotion: DeviceMotion,private vibration: Vibration,private qrScanner: QRScanner, private screenOrientation: ScreenOrientation, public navCtrl: NavController, public navParams: NavParams, private storage: Storage, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider) {
    this.nombre = '-Sin Nombre-';
    this.idimagen = 1;
    this.screenOrientation.lock(this.screenOrientation.ORIENTATIONS.PORTRAIT);
    this.returnToken();    
    this.motion();
  }
  returnToken() {
    this.GlobalF.cargando3Seg();
    this.ApiProvider.returnToken().then(response => {
      console.info(response);
      this.item=response;
      this.nombre = response.nombre + ' ' + response.apellido;
      this.tipo = response.idtipo;
      this.idimagen = response.idimagen;
      this.idusuario = response.idusuario;
    }).catch(error => {
      this.GlobalF.cargando3Seg();
      this.storage.clear();
      this.navCtrl.setRoot(HomePage);
    })
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad MenuPage');
    
  }
  motion(){
    this.deviceMotion.getCurrentAcceleration().then(
      (acceleration: DeviceMotionAccelerationData) => console.log(acceleration),
      (error: any) => console.log(error)      
    );
    this.getMotion();
  }
  getMotion(){
    var subscription = this.deviceMotion.watchAcceleration().subscribe((acceleration: DeviceMotionAccelerationData) => {
      subscription.unsubscribe();
      this.vibration.vibrate(50);      
      this.navCtrl.setRoot(MateriasGPage, { estado: 'Asistencia' });            
    });
    
  }
  goTo(where) {
    console.info(where);
    this.vibration.vibrate(50);
    switch (where) {
      case 1:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(UsuariosPage, { where: 'Modificar', arreglo: this.item });
        break;
      case 2:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(MateriasGPage, { estado: 'Asistencia' });
        break;
      case 3:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(MateriasGPage);
        break;
      case 4:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(AulasgPage);
        break;
      case 5:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(UsuariosGPage);
        break;
      case 6:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(EstadisticasPage);
        break;
      case 7:
        this.GlobalF.cargando();
        this.navCtrl.setRoot(AboutPage);
        break;
      case 8:
        this.GlobalF.cargando();
        this.storage.clear();
        this.navCtrl.setRoot(HomePage);
        break;
      case 1234:
        //this.pruebaPush();
        break;
      default:
        break;
    }
  }
  /*pruebaPush() {
    this.push.hasPermission()
      .then((res: any) => {

        if (res.isEnabled) {
          this.push.createChannel({
            id: "testchannel1",
            description: "My first test channel",
            // The importance property goes from 1 = Lowest, 2 = Low, 3 = Normal, 4 = High and 5 = Highest.
            importance: 3
          }).then(() => console.log('Channel created'));

          const options: PushOptions = {
            android: {},
            ios: {
              alert: 'true',
              badge: true,
              sound: 'false'
            },
            windows: {},
            browser: {
              pushServiceURL: 'http://push.api.phonegap.com/v1/push'
            }
          };
          const pushObject: PushObject = this.push.init(options);


          pushObject.on('notification').subscribe((notification: any) => console.log('Received a notification', notification));

          pushObject.on('registration').subscribe((registration: any) => console.log('Device registered', registration));

          pushObject.on('error').subscribe(error => console.error('Error with Push plugin', error));
        } else {

        }

      });
  }*/
  pruebaQR() {
    this.qrScanner.prepare()
      .then((status: QRScannerStatus) => {
        if (status.authorized) {
          // camera permission was granted


          // start scanning
          let scanSub = this.qrScanner.scan().subscribe((text: string) => {
            console.log('Scanned something', text);

            this.qrScanner.hide(); // hide camera preview
            scanSub.unsubscribe(); // stop scanning
          });

        } else if (status.denied) {
          // camera permission was permanently denied
          // you must use QRScanner.openSettings() method to guide the user to the settings page
          // then they can grant the permission from there
        } else {
          // permission was denied, but not permanently. You can ask for permission again at a later time.
        }
      })
      .catch((e: any) => console.log('Error is', e));
  }
}
