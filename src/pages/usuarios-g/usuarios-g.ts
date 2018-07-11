import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { PopoverController } from 'ionic-angular';
import { PopoverComponent } from '../../components/popover/popover';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { UsuariosPage } from '../usuarios/usuarios';
import { MateriasGPage } from '../materias-g/materias-g';
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
  estado: string;
  constructor(public navCtrl: NavController, public navParams: NavParams,public popoverCtrl: PopoverController, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad UsuariosGPage');
    this.listar();
  }


  listar(){
    var array = [{"traer": '1' }];      
    this.ApiProvider.abmGralPost(array,'usuarios/listarUsuarios').then(Response=>{          
      this.listado = Response;
    }).catch(error=>{
      this.GlobalF.error(0);
    })
  }
  back() {
    this.navCtrl.setRoot(MenuPage);
  }
  menu(evento) {
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
        "idusuario":item.idusuario,"nombre": item.nombre, "apellido": item.apellido, "mail": item.mail,"idtipo": item.idtipo, "idimagen": item.idimagen,"estado":item.estado
      }];      
        this.ApiProvider.abmGralPost(array2,'usuarios/modificarUsuario').then(Response=>{          
          this.GlobalF.correcto(1);         
          this.listar()
        }).catch(error=>{
          this.GlobalF.error(5);
        })
      }
    })
  }
  opciones(x) {    
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
          x.estado=0;          
          this.eliminar(x);
          break;
        case 4:          
        this.navCtrl.setRoot(MateriasGPage, { arreglo: x,estado:'Usuarios' });        
          break;
        default:
          break;
      }
    })
  }

  getItems(ev: any) {
    // Reset items back to all of the items
    this.listar();

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
}
