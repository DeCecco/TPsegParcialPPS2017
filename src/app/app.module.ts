import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';


//------------------------Pages------------------------//
import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { MenuPage } from '../pages/menu/menu';
import { AboutPage } from '../pages/about/about';
import { UsuariosPage } from '../pages/usuarios/usuarios';
import { AulasgPage } from '../pages/aulasg/aulasg';
import { AmaulasPage } from '../pages/amaulas/amaulas';
import { MateriasGPage } from '../pages/materias-g/materias-g';
import { MateriasAmPage } from '../pages/materias-am/materias-am';
import { UsuariosGPage } from '../pages/usuarios-g/usuarios-g';
import { EstadisticasPage } from '../pages/estadisticas/estadisticas';
import { AsignacionMateriasPage } from '../pages/asignacion-materias/asignacion-materias';

//------------------------Local Provider------------------------//
import { ApiProvider } from '../providers/api/api';

//------------------------Providers------------------------//
import { HttpClientModule } from '@angular/common/http';
import { AngularFireModule } from 'angularfire2';
import { AngularFirestoreModule } from 'angularfire2/firestore';
import { AngularFireAuthModule } from 'angularfire2/auth';
import { GlobalFunctionsProvider } from '../providers/global-functions/global-functions';
import { IonicStorageModule } from '@ionic/storage';
import { Vibration } from '@ionic-native/vibration';
import { Toast } from '@ionic-native/toast';
import { ScreenOrientation } from '@ionic-native/screen-orientation';
import { QRScanner, QRScannerStatus } from '@ionic-native/qr-scanner';
import { Camera, CameraOptions } from '@ionic-native/camera';
import { NativeAudio } from '@ionic-native/native-audio';
import { DeviceMotion, DeviceMotionAccelerationData } from '@ionic-native/device-motion';

//import { Push, PushObject, PushOptions } from '@ionic-native/push';

//------------------------Components------------------------//
import { PopoverComponent } from '../components/popover/popover'
import { EstadoAsistenciaComponent } from '../components/estado-asistencia/estado-asistencia'

export const firebaseConfig  = {
  apiKey: "AIzaSyAhU9S_jk3tRU0pxYft15f7wYa-3yuwcSY",
  authDomain: "asistencia-63f29.firebaseapp.com",
  databaseURL: "https://asistencia-63f29.firebaseio.com",
  projectId: "asistencia-63f29",
  storageBucket: "asistencia-63f29.appspot.com",
  messagingSenderId: "1053669090196"
};

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    MenuPage,
    UsuariosPage,
    AulasgPage,
    AmaulasPage,
    PopoverComponent,
    EstadoAsistenciaComponent,
    MateriasGPage,
    MateriasAmPage,
    UsuariosGPage,
    EstadisticasPage,
    AsignacionMateriasPage,
    AboutPage
  ],
  imports: [
    BrowserModule,
    HttpClientModule,    
    IonicStorageModule.forRoot(),
    IonicModule.forRoot(MyApp),
    AngularFireModule.initializeApp(firebaseConfig),
    AngularFirestoreModule,
    AngularFireAuthModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    MenuPage,
    UsuariosPage,
    AmaulasPage,
    EstadisticasPage,
    AulasgPage,
    MateriasGPage,
    PopoverComponent,
    EstadoAsistenciaComponent,
    MateriasAmPage,
    UsuariosGPage,
    AsignacionMateriasPage,
    AboutPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    { provide: ErrorHandler, useClass: IonicErrorHandler, },
    ApiProvider,
    HttpClientModule,
    GlobalFunctionsProvider,
    Vibration,
    Toast,
    ScreenOrientation,
    QRScanner,
    Camera,
    NativeAudio,
    DeviceMotion
    //Push
  ]
})
export class AppModule { }