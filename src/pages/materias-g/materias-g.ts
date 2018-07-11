import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { PopoverController } from 'ionic-angular';
import { PopoverComponent } from '../../components/popover/popover';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { MateriasAmPage } from '../materias-am/materias-am';
import { UsuariosGPage } from '../usuarios-g/usuarios-g';
/**
 * Generated class for the MateriasGPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-materias-g',
  templateUrl: 'materias-g.html',
})
export class MateriasGPage {
  listado: any;
  estado: string;
  arreglo: any;
  anio:any;
  cuatrimestre:any;
  turno:any;
  constructor(public navCtrl: NavController, public navParams: NavParams, public popoverCtrl: PopoverController, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider) {
    this.estado = this.navParams.get("estado");
    this.arreglo = this.navParams.get("arreglo");
    this.anio='0';
    this.cuatrimestre='0';
    this.turno='0';
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad MateriasGPage');
    if(this.estado!='Usuarios'){
      this.listar();
    }
  }

  listar() {
    var array = [{ "traer": '1' }];
    this.ApiProvider.abmGralPost(array, 'materias/listarMateria').then(Response => {
      this.listado = Response;
    }).catch(error => {
      this.GlobalF.error(0);
    })
  }
  listarAsignacion() {
    if(this.anio=='0'){
      this.GlobalF.error(6);
    }else if(this.cuatrimestre=='0'){
      this.GlobalF.error(7);
    }else if(this.turno=='0'){
      this.GlobalF.error(8);
    }else{
      var array = [{ "anio": this.anio,"cuatrimestre":this.cuatrimestre,"turno":this.turno,"idusuario":this.arreglo.idusuario.toString()}];
      this.ApiProvider.abmGralPost(array, 'materias/listarMateriaAsignada').then(Response => {
        this.listado = Response;
      }).catch(error => {
        this.GlobalF.error(0);
      })
    }
  }
  back() {
    if(this.estado=='Usuarios'){
      this.navCtrl.setRoot(UsuariosGPage);
    }else{
      this.navCtrl.setRoot(MenuPage);
    }    
  }
  menu(evento) {
    const popover = this.popoverCtrl.create(PopoverComponent);
    popover.present({
      ev: evento
    });
  }

  add() {

    this.estado = 'Alta';
    this.navCtrl.push(MateriasAmPage, { estado: this.estado });
  }

  modificar(item) {

    this.estado = 'Modificar';
    this.navCtrl.push(MateriasAmPage, { estado: this.estado, arreglo: item });
  }

  eliminar(item) {
    let promt = this.GlobalF.alerta(2);
    promt.present();
    promt.onDidDismiss((data) => {
      if (data) {
        var array2 = [{ "idmateria": item[1].idmateria, "descripcion": item[1].descripcion, "descripcionCorta": item[1].descripcionCorta, "estado": item[1].estado }];
        this.ApiProvider.abmGralPost(array2, 'materias/modificarMateria').then(Response => {
          this.GlobalF.correcto(1);
          this.listar()
        }).catch(error => {
          this.GlobalF.error(5);
        })
      }
    })
  }
  buscarTurnos(item, x) {
    let array = [];
    array.push(item);
    this.ApiProvider.abmGralPost(array, 'materias/buscarTurnos').then(Response => {
      this.ApiProvider.abmGralPost(array, 'materias/buscarAulaMateria').then(Response2 => {
        console.info(Response2)
        let array2 = [];
        array2.push(Response);
        array2.push(item);
        array2.push(Response2);
        if (x == 0) {
          this.modificar(array2);
        } else {
          this.eliminar(array2);
        }
      }).catch(error => {
        this.GlobalF.error(5);
      })
    }).catch(error => {
      this.GlobalF.error(5);
    })
  }
  opciones(x) {
    if (this.estado == 'Usuarios') {

    } else {
      const as = this.GlobalF.opcionesAS();
      as.present({
        ev: event
      })
      as.onDidDismiss(response => {
        switch (response) {
          case 1:
            this.buscarTurnos(x, 0);
            break;
          case 2:
            x.estado = 0;
            this.buscarTurnos(x, 1);
            break;
          default:
            break;
        }
      })
    }
  }

  guardar(){

    if(this.listado!=null){
        if(this.listado.length!=0){
          var array = [{ "lista": this.listado}];
          this.ApiProvider.abmGralPost(array, 'materias/grabarAsignacion').then(Response => {
            this.GlobalF.correcto(1);            
          }).catch(error => {
            this.GlobalF.error(5);
          })
        }else{
          this.GlobalF.error(9);
        }
    }else{
      this.GlobalF.error(9);
    }
  }

  limpiarLista(){
    
    this.listado=[];
  }

}
