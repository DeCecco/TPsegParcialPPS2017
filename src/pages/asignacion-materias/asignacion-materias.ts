import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiProvider } from '../../providers/api/api';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { UsuariosGPage } from '../usuarios-g/usuarios-g';
import { Storage } from '@ionic/storage';
import { HomePage } from '../home/home';

/**
 * Generated class for the AsignacionMateriasPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-asignacion-materias',
  templateUrl: 'asignacion-materias.html',
})
export class AsignacionMateriasPage {
  listadoMaterias:any;
  listadoTurnos:any;
  materia:any;
  idmateriasturnos:any;
  arreglo:any;
  nomap:string;
  nombre:string;
  tipo:any;
  constructor(public navCtrl: NavController, public navParams: NavParams, private ApiProvider: ApiProvider, private storage: Storage, private GlobalF: GlobalFunctionsProvider) {
    this.arreglo = this.navParams.get("arreglo");
    this.nomap=this.arreglo.nomap;
    console.info(this.arreglo)
    this.returnToken();
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad AsignacionMateriasPage');
    this.listarMaterias()
  }
  returnToken() {    
    this.ApiProvider.returnToken().then(response=> {     
      console.info(response)  
      this.nombre = response.nombre + ' ' + response.apellido;    
      this.tipo = response.tipo;
    }).catch(error=>{
      this.GlobalF.cargando();
      this.storage.clear();
      this.navCtrl.setRoot(HomePage);
    })    
  }
  listarMaterias(){
    var array = [{"traer": '1' }];      
    this.ApiProvider.abmGralPost(array,'materias/listarMateria').then(Response=>{          
      this.listadoMaterias = Response;
      console.info(this.listadoMaterias)
    }).catch(error=>{
      this.GlobalF.error(0);
    })
  }
  buscarTurno(materia){
    var array = [{"idmateria": materia }];      
    this.ApiProvider.abmGralPost(array,'materias/turnosXMateria').then(Response=>{          
      this.listadoTurnos = Response;
      console.info(this.listadoTurnos)
    }).catch(error=>{
      this.GlobalF.error(0);
    })
  }
  seleccionCompleta(){    
    if(this.arreglo.idmateria!=null && this.idmateriasturnos!=null)
      console.info(this.idmateriasturnos)
    else
      console.info('falla')
  }


  back(){        
    
    let promt = this.GlobalF.alerta(0);
    promt.present();
    promt.onDidDismiss((data)=>{      
      if(data){
        this.GlobalF.cargando();
        this.navCtrl.setRoot(UsuariosGPage); 
      }
    })
  }
  
  guardar(){
        /*  
      if(this.estado!='Modificar'){
        var array = [{"aula": this.aula }];      
        this.ApiProvider.altaAula(array).then(Response=>{
          this.GlobalF.guardarFirebaseDB(array,'aulas');
          this.GlobalF.correcto(1);
          this.navCtrl.setRoot(AulasgPage); 
        }).catch(error=>{
          this.GlobalF.error(5);
        })
      }else{
        var array2 = [{"descripcion": this.aula,"idaula":this.aulaM.idaula,"estado":this.aulaM.estado }];      
        this.ApiProvider.abmGralPost(array2,'materias/modificarAula').then(Response=>{
          this.GlobalF.correcto(1);
          this.navCtrl.setRoot(AulasgPage); 
        }).catch(error=>{
          this.GlobalF.error(5);
        })
      }   */ 
  }
   
}
