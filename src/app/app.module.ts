import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { IonicStorageModule } from '@ionic/storage';
import { Camera } from '@ionic-native/camera';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { Asistencia } from '../pages/asistencia/asistencia';
import { PrincipalPage } from '../pages/principal/principal';
import { PersonasService } from './personas.service';
import { PersonasPage } from '../pages/personas/personas';
import { PersonasamPage } from '../pages/personasam/personasam';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    Asistencia,
    PrincipalPage,
    PersonasPage,
    PersonasamPage
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp),
    FormsModule,
    HttpModule,
    ReactiveFormsModule,
    IonicStorageModule.forRoot()
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    Asistencia,
    PrincipalPage,
    PersonasPage,
    PersonasamPage
  ],
  providers: [
    PersonasService,
    StatusBar,    
    Camera,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
