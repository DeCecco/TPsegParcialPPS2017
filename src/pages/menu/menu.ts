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
import { QrPage } from '../qr/qr';
import { EstadisticasPage } from '../estadisticas/estadisticas';
import { ScreenOrientation } from '@ionic-native/screen-orientation';
import { PopoverController } from 'ionic-angular';
import { SelectCountryComponent } from '../../components/select-country/select-country';
//import { QRScanner, QRScannerStatus } from '@ionic-native/qr-scanner';
import { Vibration } from '@ionic-native/vibration';
import { DeviceMotion, DeviceMotionAccelerationData } from '@ionic-native/device-motion';
import { BarcodeScanner } from '@ionic-native/barcode-scanner';
import { TranslateService } from '@ngx-translate/core'
import { Globalization } from '@ionic-native/globalization';

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
  private scanSub;
  nombre: any;
  name: string;
  tipo: any;
  idimagen: any;
  idusuario: any;
  item:any;
  qrData = null;
  createdCode = null;
  scannedCode = null;
  idioms: any[] = [];
  lan:string;
  constructor(/*private push: Push,*/ public popoverCtrl: PopoverController,private globalization: Globalization,private translateService: TranslateService, private deviceMotion: DeviceMotion,private barcodeScanner:BarcodeScanner,private vibration: Vibration/*,private qrScanner: QRScanner*/, private screenOrientation: ScreenOrientation, public navCtrl: NavController, public navParams: NavParams, private storage: Storage, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider) {
    this.nombre = '-Sin Nombre-';
    this.idimagen = 1;
    this.screenOrientation.lock(this.screenOrientation.ORIENTATIONS.PORTRAIT);
    this.returnToken();    
    this.globalization.getPreferredLanguage()
      .then(res => this.choose(res.value.substring(0, 2)))
      .catch(e => console.log(e));
    
    this.idioms = [
      {
        value: 'es',
        label: 'Español'
      },
      {
        value: 'en',
        label: 'Ingles'
      },
      {
        value: 'pt',
        label: 'Portugués'
      }
    ];        

  }
  choose(lang) {
    this.translateService.use(lang);
    this.lan=lang;
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
    //this.motion();
  }
  motion(){
    this.deviceMotion.getCurrentAcceleration().then(
      (acceleration: DeviceMotionAccelerationData) => console.log(acceleration),
      (error: any) => console.log(error)      
    );
    this.getMotion();
  }
  getMotion(){
    var subscription = this.deviceMotion.watchAcceleration({frequency:20000}).subscribe((acceleration: DeviceMotionAccelerationData) => {
      subscription.unsubscribe();
      if(this.tipo==1 || this.tipo==4){
        this.vibration.vibrate(50);      
        this.navCtrl.setRoot(MateriasGPage, { estado: 'Asistencia' });            
      }
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
        this.GlobalF.cargando();
        this.navCtrl.setRoot(QrPage);
        //this.pruebaQR();
        //this.qr2tyest();
        break;
      default:
        break;
    }
  }
  qr2tyest(){
    this.barcodeScanner.scan().then(barcodeData=>{
      this.scannedCode = barcodeData.text;
      if(this.scannedCode){
        console.info('algo');
      }else{
        console.info('nada');
      }
  	})
  }

  optionCountry(evento) {
    console.info(evento)
    const popover = this.popoverCtrl.create(SelectCountryComponent);
    popover.present({
      ev: evento
    });
  }
}
