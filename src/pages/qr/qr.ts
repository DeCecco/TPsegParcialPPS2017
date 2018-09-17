import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { BarcodeScanner } from '@ionic-native/barcode-scanner';
import { MenuPage } from '../menu/menu';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { ApiProvider } from '../../providers/api/api';
import { UsuariosGPage } from '../usuarios-g/usuarios-g';
/**
 * Generated class for the QrPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-qr',
  templateUrl: 'qr.html',
})
export class QrPage {  
  qrData = null;
  createdCode = null;
  scannedCode = null;
  listado:any;
  constructor(/*private qrScanner: QRScanner,*/public navCtrl: NavController, public navParams: NavParams,private barcodeScanner:BarcodeScanner,private GlobalF: GlobalFunctionsProvider,
    private ApiProvider: ApiProvider) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad QrPage');
    this.qrScan();  
  }
  qrScan(){
      this.barcodeScanner.scan().then(barcodeData=>{
      this.scannedCode = barcodeData.text;
      if(this.scannedCode){
        console.info(this.scannedCode)
        console.info(typeof this.scannedCode)
        this.listarUsuariosAsignados(this.scannedCode);
      }else{
        this.GlobalF.cargando();
        this.navCtrl.setRoot(MenuPage);
      }
  	})
  }
  goToAssist(x){
    
  }

  listarUsuariosAsignados(x) {        
    var array= JSON.parse(x);    
    this.ApiProvider.abmGralPost(array, 'materias/tomarAsistencia').then(Response => {
      this.listado = Response;
      this.navCtrl.setRoot(UsuariosGPage, { listado: this.listado,desde:'ARapida' });
    }).catch(error => {
      this.GlobalF.error(0);
    })
  }
}
