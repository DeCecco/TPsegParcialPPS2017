import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { MenuPage } from '../menu/menu';
import { PopoverController } from 'ionic-angular';
import { PopoverComponent } from '../../components/popover/popover';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { MateriasAmPage } from '../materias-am/materias-am';
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
  constructor(public navCtrl: NavController, public navParams: NavParams,public popoverCtrl: PopoverController, private ApiProvider: ApiProvider, private GlobalF: GlobalFunctionsProvider) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad MateriasGPage');
    this.listar();
  }

  listar(){
    var array = [{"traer": '1' }];      
    this.ApiProvider.abmGralPost(array,'materias/listarMateria').then(Response=>{          
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
        var array2 = [{"idmateria":item[1].idmateria,"descripcion": item[1].descripcion,"descripcionCorta": item[1].descripcionCorta,"estado": item[1].estado }];      
        this.ApiProvider.abmGralPost(array2,'materias/modificarMateria').then(Response=>{          
          this.GlobalF.correcto(1);         
          this.listar()
        }).catch(error=>{
          this.GlobalF.error(5);
        })
      }
    })
  }
  buscarTurnos(item,x){    
      let array=[];
      array.push(item);        
      this.ApiProvider.abmGralPost(array,'materias/buscarTurnos').then(Response=>{          
        this.ApiProvider.abmGralPost(array,'materias/buscarAulaMateria').then(Response2=>{
          console.info(Response2)
          let array2=[];      
          array2.push(Response);          
          array2.push(item);    
          array2.push(Response2);      
          if(x==0){    
            this.modificar(array2);
          }else{
            this.eliminar(array2);
          }
        }).catch(error=>{
          this.GlobalF.error(5);
        })    
      }).catch(error=>{
        this.GlobalF.error(5);
      })    
  }
  opciones(x) {    
    const as = this.GlobalF.opcionesAS();
    as.present({
      ev: event
    })
    as.onDidDismiss(response => {
      switch (response) {
        case 1:
          this.buscarTurnos(x,0);
          break;
        case 2:          
          x.estado=0;          
          this.buscarTurnos(x,1);
          break;
        default:
          break;
      }
    })
  }

}
