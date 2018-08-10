import { Component, ViewChild } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiProvider } from '../../providers/api/api';
import { Storage } from '@ionic/storage';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { ScreenOrientation } from '@ionic-native/screen-orientation';
import { Chart } from 'chart.js';
import { HomePage } from '../home/home';
import { MenuPage } from '../menu/menu';
/**
 * Generated class for the EstadisticasPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-estadisticas',
  templateUrl: 'estadisticas.html',
})
export class EstadisticasPage {

  @ViewChild('barCanvas') barCanvas;
  @ViewChild('doughnutCanvas') doughnutCanvas;
  @ViewChild('pieCanvas') pieCanvas;
  @ViewChild('polarCanvas') polarCanvas;
  doughnutChart: any;
  pieChart: any;
  polarChart: any;
  habilitar: boolean;
  barChart: any;
  nombre: any;
  tipo: any;
  idimagen: any;
  idusuario: any;
  item: any;
  informe: number;
  anio: any;
  cuatrimestre: any;
  turno: any;
  idmateria: any;
  listado: any;
  selectMaterias: any;
  titulo: string;
  reporte: Number;
  DPresente: any;
  Lnomap1: any;
  Lnomap2: any;
  DAusente: any;
  Lnomap3: any;
  DJustificado: any;
  Lnomap4: any;
  DMediaFalta: any;
  vueltas: any;

  constructor(private screenOrientation: ScreenOrientation, public navCtrl: NavController, public navParams: NavParams, private storage: Storage, private ApiProvider: ApiProvider,
    private GlobalF: GlobalFunctionsProvider) {
    this.habilitar = true;
    this.informe = 0;
    this.titulo = "Asistencias por Materias";
    this.reporte = 0;
    this.anio = 0;
    this.cuatrimestre = 0;
    this.turno = 0;
    this.idmateria = 0;
    this.screenOrientation.lock(this.screenOrientation.ORIENTATIONS.LANDSCAPE);
    this.returnToken();
  }
  returnToken() {
    //this.GlobalF.cargando();
    this.ApiProvider.returnToken().then(response => {
      console.info(response);
      this.item = response;
      this.nombre = response.nombre + ' ' + response.apellido;
      this.tipo = response.idtipo;
      this.idimagen = response.idimagen;
      this.idusuario = response.idusuario;
    }).catch(error => {
      //this.GlobalF.cargando();
      this.storage.clear();
      this.navCtrl.setRoot(HomePage);
    })
  }
  changeIdMateria(id) {
    console.info(id)
  }
  comboMaterias() {
    
    this.vueltas = 0;
    if (this.anio != 0 && this.cuatrimestre != 0 && this.turno != 0) {
      this.GlobalF.cargando3Seg();
      var array = [{ "anio": this.anio, 'cuatrimestre': this.cuatrimestre, 'idturno': this.turno,"idusuario":this.idusuario,"idtipo":this.tipo }];
      
      this.ApiProvider.abmGralPost(array, '/materias/comboMaterias').then(Response => {
        this.selectMaterias = Response;
      }).catch(error => {
        this.GlobalF.error(0);
      })
    }
  }
  buscar() {
    if (this.anio != 0 && this.cuatrimestre != 0 && this.turno != 0 && this.idmateria!=0) {
      var array = [{ "anio": this.anio, 'cuatrimestre': this.cuatrimestre, 'idturno': this.turno, 'idmateria': this.idmateria, 'idtipo': this.tipo, 'idusuario': this.idusuario }];
      this.GlobalF.cargando3Seg();
      this.ApiProvider.abmGralPost(array, '/estadisticas/traerAsistenciasCuatrimestrales').then(Response => {

        this.listado = Response;
        var DPresente = [];
        var Lnomap1 = [];
        var DAusente = [];
        var Lnomap2 = [];
        var DJustificado = [];
        var Lnomap3 = [];
        var DMediaFalta = [];
        var Lnomap4 = [];
        var vuelta = 0;

        for (let index = 0; index < this.listado.length; index++) {
          if (this.listado[index].totalPresente != 0 && this.listado[index].totalPresente != '0') {
            DPresente.push(this.listado[index].totalPresente);
            Lnomap1.push(this.listado[index].nomap);
          }

          if (this.listado[index].totalAusente != 0 && this.listado[index].totalAusente != '0') {
            DAusente.push(this.listado[index].totalAusente);
            Lnomap2.push(this.listado[index].nomap2);
          }
          if (this.listado[index].totalJustificado != 0 && this.listado[index].totalJustificado != '0') {
            DJustificado.push(this.listado[index].totalJustificado);
            Lnomap3.push(this.listado[index].nomap3);
          }
          if (this.listado[index].totalMediaFalta != 0 && this.listado[index].totalMediaFalta != '0') {
            DMediaFalta.push(this.listado[index].totalMediaFalta);
            Lnomap4.push(this.listado[index].nomap4);
          }
          vuelta++;

        }

        if (vuelta == this.listado.length) {
          this.DPresente = DPresente;
          console.info(DPresente)
          console.info(this.DPresente)
          this.Lnomap1 = Lnomap1;
          this.DAusente = DAusente;
          this.Lnomap2 = Lnomap2;
          this.DJustificado = DJustificado;
          this.Lnomap3 = Lnomap3;
          this.DMediaFalta = DMediaFalta;
          this.Lnomap4 = Lnomap4;
          this.graficos();
          this.vueltas = vuelta;
        }
      }).catch(error => {
        this.GlobalF.error(0);
      })
    }else{
      this.GlobalF.error('Seleccione los filtros para una busqueda');
    }
  }
  ionViewDidLoad() { }
  graficos() {
   /* console.info(this.reporte)
    switch (this.reporte) {
      case 1:*/
      
        this.barChart = new Chart(this.barCanvas.nativeElement, {

          type: 'bar',
          data: {
            labels: this.Lnomap1,
            datasets: [{
              label: this.DPresente,
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true
                }
              }]
            }
          }

        });
       /* break;
      case 2:*/

        this.doughnutChart = new Chart(this.doughnutCanvas.nativeElement, {

          type: 'doughnut',
          data: {
            labels: this.Lnomap2,
            datasets: [{
              label: 'Ausencias',
              data: this.DAusente,
              backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
              ],
              hoverBackgroundColor: [
                "#FF6384",
                "#36A2EB",
                "#FFCE56",
                "#FF6384",
                "#36A2EB",
                "#FFCE56"
              ]
            }]
          }

        });
      /*  break;
      case 3:*/

        this.pieChart = new Chart(this.pieCanvas.nativeElement, {

          type: 'pie',
          data: {
            labels: this.Lnomap3,
            datasets: [
              {
                label: "Justificadas",
                fill: false,
                lineTension: 0.1,
                backgroundColor: "rgba(75,192,192,0.4)",
                borderColor: "rgba(75,192,192,1)",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgba(75,192,192,1)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: this.DJustificado,
                spanGaps: false,
              }
            ]
          }

        });
      /*  break;
      case 4:*/

        this.polarChart = new Chart(this.polarCanvas.nativeElement, {

          type: 'polarArea',
          data: {
            labels: this.Lnomap4,
            datasets: [
              {
                label: "Medias Faltas",
                fill: false,
                lineTension: 0.1,
                backgroundColor: "rgba(75,192,192,0.4)",
                borderColor: "rgba(75,192,192,1)",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgba(75,192,192,1)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: this.DMediaFalta,
                spanGaps: false,
              }
            ]
          }

        });
       /* break;
      default:
        this.GlobalF.error('Seleccione un Tipo de Asistencia');
        break;
    }*/
  }
  back() {
    this.GlobalF.cargando();    
    this.navCtrl.setRoot(MenuPage)
  }
  goTo(x) {
    this.reporte = x;
    this.graficos();
  }
}
