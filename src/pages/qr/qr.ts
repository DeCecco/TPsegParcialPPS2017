import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { QRScanner, QRScannerStatus } from '@ionic-native/qr-scanner';
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
  private scanSub;
  constructor(private qrScanner: QRScanner,public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad QrPage');
    this.qr();
  }

  qr(){
    this.qrScanner.prepare()
    .then((status: QRScannerStatus) => {
      if (status.authorized) {
        // camera permission was granted
        console.info('ok')
        //alert('authorized');
        // start scanning
        this.scanSub = this.qrScanner.scan().subscribe((text: string) => {
          //console.log('Scanned something', text);
          
          //this.Modal('QR code:', text);
          console.info(text);// <----- DECIDE QUE HACER
          
          this.qrScanner.hide(); // hide camera preview
          this.scanSub.unsubscribe(); // stop scanning
          console.log('Escaneo QR finalizado');
          //this.closeModal();
          //this.showElements();
          this.navCtrl.pop();
        });
        this.qrScanner.resumePreview();
        // show camera preview
        this.qrScanner.show()
        .then((data : QRScannerStatus)=> { 
          console.log('datashowing', data.showing);
          //alert(data.showing);
        },err => {
          //this.spin(false);
          console.info('error')
          //this.Modal('Error: ', 'Detalles: '+ err);
        });

        // wait for user to scan something, then the observable callback will be called

      } else if (status.denied) {
        //this.spin(false);
        console.info('Permisos', 'Permisos a la cámara denegados.');
        // camera permission was permanently denied
        // you must use QRScanner.openSettings() method to guide the user to the settings page
        // then they can grant the permission from there
      } else {
        // permission was denied, but not permanently. You can ask for permission again at a later time.
        //this.spin(false);
        console.info('Permisos', 'Permisos a la cámara denegados. Elija Aceptar la próxima vez.');
      }
    })
    .catch((e: any) => {
      //this.spin(false);
      console.info('Error: ', 'Detalles: '+ e);
    });
  }

}
