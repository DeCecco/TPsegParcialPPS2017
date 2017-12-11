import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';//FORMBUILDER CREA FORMS, FORMGROUP DEFINE UN FORMULARIO Y VALIDATORS CONTIENE VALIDACIONES PREDISEÑADAS
import { NavController } from 'ionic-angular';
import { NgModule } from '@angular/core';

import { Asistencia } from '../asistencia/asistencia';
import { PrincipalPage } from '../principal/principal';
import { Storage } from '@ionic/storage';//STORAGE FOR IONIC

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  nombre: string='';
  password:any='';
  formLogin : FormGroup;
  mensajeError: string = '';
  errorFormLogin: boolean;
  constructor(public navCtrl: NavController, public formBuilder: FormBuilder,private storage: Storage) {
    this.errorFormLogin=false;
    //UTILIZACIÓN DE CONSTRUCTOR DE FORMULARIOS
    this.formLogin = formBuilder.group({
      //VALIDACIONES
      nombre: [this.nombre, Validators.compose([Validators.required, Validators.maxLength(30), Validators.pattern('^[a-zA-Z]+$')])],
      password: [this.password, Validators.compose([Validators.required, Validators.maxLength(30)])]
    });
  }
  
  Rellenar(x){    
    //SI EL FORM ES VALIDO
     switch(x){
            case 1: 
            console.info('HELLO')            
              this.nombre = 'usuario';
              this.password='unUsuario';                
              this.formLogin.value.nombre=this.nombre;
              this.formLogin.value.password=this.password;
                        
            break;
            case 2:
              this.nombre = 'invitado';
              this.password='unInvitado';
              
            break;
            case 3:
            this.nombre = 'administrador';
            this.password='unAdministrador';
            
            break;
          }
          
  
  }


  loguear()
  { 
    
    console.info(this.formLogin.valid)
    this.storage.ready().then(() => {
        this.storage.set('nombre', this.formLogin.value.nombre);          
        this.storage.set('idusuario', 1);
    });
     if (this.formLogin.valid) {               
          this.navCtrl.setRoot(PrincipalPage);              
         
      }      
      else {
        console.info('else')
        this.errorFormLogin = true;
      }
    }

}