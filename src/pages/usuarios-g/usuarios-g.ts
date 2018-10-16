import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { PopoverController } from 'ionic-angular';
import { PopoverComponent } from '../../components/popover/popover';
// import { EstadoAsistenciaComponent } from '../../components/estado-asistencia/estado-asistencia';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { UsuariosPage } from '../usuarios/usuarios';
import { MateriasGPage } from '../materias-g/materias-g';
import { HomePage } from '../home/home';
import { Storage } from '@ionic/storage';


/**
 * Generated class for the UsuariosGPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-usuarios-g',
  templateUrl: 'usuarios-g.html',
})
export class UsuariosGPage {
  listado: any;
  listado2: any;
  estado: string;
  status: string;
  arreglo: any;
  nombre: string;
  tipo: any;
  titulo: string;
  doing: string;
  constructor(public navCtrl: NavController, public navParams: NavParams, public popoverCtrl: PopoverController, private storage: Storage, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider) {
    this.arreglo = this.navParams.get("listado");
    console.log(this.arreglo);

    this.returnToken();
  }
  returnToken() {
    this.ApiProvider.returnToken().then(response => {

      this.nombre = response.nombre + ' ' + response.apellido;
      this.tipo = response.idtipo;
      
      if (this.arreglo != null) {
        this.listado = this.arreglo;
        this.listado2 = this.arreglo;
        this.status = 'Asistencia';
        this.Ttitulo();
         
      } else {
        this.listar(this.tipo);
        this.status = 'Usuarios';
        this.titulo='Usuarios';
      }


    }).catch(error => {
      this.GlobalF.cargando();
      this.storage.clear();
      this.navCtrl.setRoot(HomePage);
    })

  }
  Ttitulo(){
    let turno;
    switch (this.arreglo[0].idturno) {
      case 1: turno = 'Mañana';
        break;
      case 2: turno = 'Tarde';
        break;
      case 3: turno = 'Noche';
        break;
    }
    console.info('0')
    this.titulo='Usuarios';
    this.doing = "Materia: " + this.arreglo[0].descripcioncorta + " - Turno: " + turno + " - Año: " + this.arreglo[0].anio + '°';

  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad UsuariosGPage');
  }


  listar(x) {
    if (this.tipo == 3) {
      this.back();
    } else {
      var array = [{ "traer": x }];
      this.GlobalF.cargando3Seg();
      this.ApiProvider.abmGralPost(array, 'usuarios/listarUsuarios').then(Response => {
        this.listado = Response;
        this.listado2 = Response;
      }).catch(error => {
        this.GlobalF.error(0);
      })
    }
  }
  back() {
    if (this.status == 'Asistencia') {
      this.navCtrl.setRoot(MateriasGPage, { estado: 'Asistencia' });
    } else {
      this.navCtrl.setRoot(MenuPage);
    }
  }
  menu(evento) {
    console.info(evento);
    const popover = this.popoverCtrl.create(PopoverComponent);
    popover.present({
      ev: evento
    });
  }

  add() {

    this.estado = 'Alta';
    this.navCtrl.setRoot(UsuariosPage, { where: this.estado });
  }

  modificar(item) {

    this.estado = 'Modificar';
    this.navCtrl.setRoot(UsuariosPage, { where: this.estado, arreglo: item });
  }

  eliminar(item) {

    let promt = this.GlobalF.alerta(2);
    promt.present();
    promt.onDidDismiss((data) => {
      if (data) {
        console.info(item);
        var array2 = [{
          "idusuario": item.idusuario, "nombre": item.nombre, "apellido": item.apellido, "mail": item.mail, "idtipo": item.idtipo, "idimagen": item.idimagen, "estado": item.estado
        }];
        this.ApiProvider.abmGralPost(array2, 'usuarios/modificarUsuario').then(Response => {
          this.GlobalF.correcto(1);
          this.listar(this.tipo)
        }).catch(error => {
          this.GlobalF.error(5);
        })
      }
    })
  }
  opciones(x) {
    if (this.status == 'Usuarios') {
      const as = this.GlobalF.opcionesAS2();
      as.present({
        ev: event
      })
      as.onDidDismiss(response => {
        switch (response) {
          case 1:
            this.modificar(x);
            break;
          case 2:
            x.estado = 0;
            this.eliminar(x);
            break;
          case 4:
            this.navCtrl.setRoot(MateriasGPage, { arreglo: x, estado: 'Usuarios' });
            break;
          default:
            break;
        }
      })
    } else if (this.status == 'Asistencia') {
      const as = this.GlobalF.opcionesAsistencia();
      as.present({
        ev: event
      })
      as.onDidDismiss(response => {

        switch (response) {
          case 1:
            this.updateAsistencia(x, response);
            break;
          case 2:
            this.updateAsistencia(x, response);
            break;
          case 3:
            this.updateAsistencia(x, response);
            break;
          case 4:
            this.updateAsistencia(x, response);
            break;
          case 5:

            break;
          default:
            break;
        }
      })
    }
  }

  updateAsistencia(item, estado) {
    let arreglo = [{ "idmateriasusuarios": item.idmateriasusuarios, "idusuario": item.idusuario, "idestado": estado }];
    this.ApiProvider.abmGralPost(arreglo, 'materias/cambiarEstadoAsistencia').then(Response => {
      this.listarUsuariosAsignados(item);
    }).catch(error => {
      this.GlobalF.error(0);
    })
  }
  listarUsuariosAsignados(item) {
    let array = [{ "anio": item.anio, "cuatrimestre": item.cuatrimestre, "turno": item.idturno, "idmateria": item.idmateria }];
    this.ApiProvider.abmGralPost(array, 'materias/tomarAsistencia').then(Response => {
      this.GlobalF.correcto(1);
      this.listado = Response;
      this.listado2 = Response;
    }).catch(error => {
      this.GlobalF.error(0);
    })
  }

  getItemsOld(ev: any) {
    // Reset items back to all of the items
    this.listar(this.tipo);

    // set val to the value of the searchbar
    const val = ev.target.value;
    // if the value is an empty string don't filter the items
    if (val && val.trim() != '') {
      this.listado = this.listado.filter((item) => {
        console.info(item['nomap']);
        return (item['nomap'].toLowerCase().indexOf(val.toLowerCase()) > -1);
      })
    }
  }
  getItems(ev) {
    let val = ev.target.value;    
    if (!val || !val.trim()) {
      this.listado = this.query();      
      return;
    }
    this.listado = this.query({
      nomap: val
    });
  }
  query(params?: any) {    
    if (!params) {
      this.listado=this.listado2;      
      return this.listado;
    }

    return this.listado.filter((item) => {      
      for (let key in params) {
        let field = item[key];        
        if (typeof field == 'string' && field.toLowerCase().indexOf(params[key].toLowerCase()) >= 0) {
          return item;
        } else if (field == params[key]) {
          return item;
        }
      }
      return null;
    });
  }
}
