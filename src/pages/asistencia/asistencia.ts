import { Component } from '@angular/core';
import { NavController, AlertController } from 'ionic-angular';
import { NgModule } from '@angular/core';
import { FormGroup, Validators, FormControl } from '@angular/forms';//FORMBUILDER CREA FORMS, FORMGROUP DEFINE UN FORMULARIO Y VALIDATORS CONTIENE VALIDACIONES PREDISEÑADAS

import { PersonasService } from '../../app/personas.service';

@Component({
  selector: 'page-asistencia',
  templateUrl: 'asistencia.html'
})
export class Asistencia {
  offset = new Date().getTimezoneOffset() * 60000; //TRANSFORMACIÓN DEL OFFSET EN MILISEGUNDOS
  fecha = new Date(Date.now() - this.offset).toISOString().substring(0, 10);
  fechaPartes : any;

  alumnoElegido = "";
  aulaElegida = "";
  diaElegido : number;
  materiaElegidaNombre = "";
  materiaElegidaIdMateria = "";
  profesorElegido = "";
  
  datosTraidos : any;
  asistencia: Array<any>;

  constructor(public navCtrl: NavController,
    public alertCtrl: AlertController,
    private PersonaService : PersonasService) {
      this.ActualizarDia();
      this.asistencia = [];
  }

  ActualizarDia(){
    this.fechaPartes = this.fecha.split('-');    
    this.diaElegido = new Date(this.fechaPartes[0], this.fechaPartes[1]-1, this.fechaPartes[2]).getDay();
  }

  GuardarAsistencia(asistencia){
    if (asistencia.valid) {
      asistencia._submitted = false;
      console.log("fecha" + this.fecha + "idMateria" + this.materiaElegidaIdMateria + "asistencia" + JSON.stringify(asistencia.value));
      this.PersonaService.GuardarAsistencia(this.fecha, this.materiaElegidaIdMateria, asistencia.value)
        .then(data => {console.log(data);})
        .catch(error => {
          console.log(error);
        });
    }
    else{
      console.log('invalido');
    }
  }

  ResetearElegidos(){
    this.alumnoElegido = "";
    this.aulaElegida = "";
    this.materiaElegidaNombre = "";
    this.materiaElegidaIdMateria = "";
    this.profesorElegido = "";
    this.datosTraidos = false;
    this.asistencia = [];
  }

  ElegirMateria() {
    let alert = this.alertCtrl.create();
    alert.setTitle('Materias activas hoy');
    
    this.PersonaService.TraerMateriasSegunDia(this.diaElegido)
      .then(data => {
        if(this.diaElegido == 0){
          alert = this.alertCtrl.create({
            title: 'Error',
            subTitle: 'Error, se eligió un día domingo. Los domingos no hay clases',
            buttons: ['OK']
          });
          alert.present();
          return;
        }
        for (var index = 0; index < data.length; index++) {
          alert.addInput({
            type: 'radio',
            label: data[index].nombre,
            value: data[index].idMateria
          });
        }
        alert.addButton('CANCELAR');
        alert.addButton({
          text: 'OK',
          handler: materiaElegida => {
            this.PersonaService.TraerMateriaSegunIdMateria(materiaElegida)
              .then(data => {
                this.materiaElegidaNombre = data[0].nombre;
                this.materiaElegidaIdMateria = data[0].idMateria;
              });
            this.PersonaService.TraerAlumnosAsistenciaSegunFechaMateria(this.fecha, materiaElegida)
              .then(data => {
                if (data.length == 0) {
                  this.PersonaService.TraerAlumnosSegunMateria(materiaElegida)
                    .then(data => {
                      for (var index = 0; index < data.length; index++) {
                        data[index].seleccionado = false;                        
                      }
                      console.log(data);
                      this.datosTraidos = data;
                    });
                }
                else{
                  console.log(data);
                  this.datosTraidos = data;
                }
              });
          }
        });
        alert.present();
      })
      .catch(error => {
        console.log(error);
      });
  }
}