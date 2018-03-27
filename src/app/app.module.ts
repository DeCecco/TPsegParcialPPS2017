import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';


//------------------------Pages------------------------//
import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { MenuPage } from '../pages/menu/menu';
import { UsuariosPage } from '../pages/usuarios/usuarios';

//------------------------Local Provider------------------------//
import { ApiProvider } from '../providers/api/api';

//------------------------Providers------------------------//
import { HttpClientModule } from '@angular/common/http';
import { AngularFireModule } from 'angularfire2';
import { AngularFirestoreModule } from 'angularfire2/firestore';
import { AngularFireAuthModule } from 'angularfire2/auth';
import { GlobalFunctionsProvider } from '../providers/global-functions/global-functions';

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
    UsuariosPage
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
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
    UsuariosPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    { provide: ErrorHandler, useClass: IonicErrorHandler, },
    ApiProvider,
    HttpClientModule,
    GlobalFunctionsProvider
  ]
})
export class AppModule { }
