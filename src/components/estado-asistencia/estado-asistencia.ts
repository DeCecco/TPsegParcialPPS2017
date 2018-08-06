import { Component } from '@angular/core';

/**
 * Generated class for the EstadoAsistenciaComponent component.
 *
 * See https://angular.io/api/core/Component for more info on Angular
 * Components.
 */
@Component({
  selector: 'estado-asistencia',
  templateUrl: 'estado-asistencia.html'
})
export class EstadoAsistenciaComponent {

  text: string;
  itemes:any;

  constructor() {
    console.log('Hello EstadoAsistenciaComponent Component');
    this.text = 'Hello World';
    this.itemes=[
      {item: 'Presente', idestado: 1,icon:'md-list'},
      {item: 'Ausente', idestado: 2,icon:'ios-list-box'},
      {item: 'Justificado', idestado: 1,icon:'ios-stats'},
      {item: 'Media Falta', idestado: 2,icon:'md-log-out'}
    ]
  }


  itemClick(item){    
    console.info(item)    
    //this.viewCtrl.dismiss(item);
  }

}
