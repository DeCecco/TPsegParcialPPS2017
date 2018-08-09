import { Component, ViewChild } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiProvider } from '../../providers/api/api';
import { Storage } from '@ionic/storage';
import { GlobalFunctionsProvider } from '../../providers/global-functions/global-functions';
import { ScreenOrientation } from '@ionic-native/screen-orientation';
import { Chart } from 'chart.js';
import { HomePage } from '../home/home';
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
  @ViewChild('lineCanvas') lineCanvas;
  doughnutChart: any;
  lineChart: any;
  habilitar: boolean;
  barChart: any;
  nombre: any;
  tipo: any;
  idimagen: any;
  idusuario: any;
  item:any;
  informe:number;
  anio:any;
  cuatrimestre:any;
  turno:any;
  listado:any;
  constructor(private screenOrientation: ScreenOrientation, public navCtrl: NavController, public navParams: NavParams, private storage: Storage, private ApiProvider: ApiProvider,
    private GlobalF: GlobalFunctionsProvider) {
    this.habilitar = true;
    this.informe=0;
    //this.screenOrientation.lock(this.screenOrientation.ORIENTATIONS.LANDSCAPE);
    this.returnToken();
  }
  returnToken() {
    //this.GlobalF.cargando();
    this.ApiProvider.returnToken().then(response => {
      console.info(response);
      this.item=response;
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
  test(){
    var array = [{ "traer": '1' }];
    this.ApiProvider.abmGralPost(array, '/estadisticas/traerAsistenciasCuatrimestrales').then(Response => {
      console.info(Response)
      this.listado = Response;
      var Dlabels=[];
      var Ddata=[];
      for (let index = 0; index < this.listado.length; index++) {
        Ddata.push(this.listado[index].total); 
        Dlabels.push(this.listado[index].apellido); 
      }
      
        this.doughnutChart = new Chart(this.doughnutCanvas.nativeElement, {

          type: 'doughnut',
          data: {
            labels: Dlabels,
            datasets: [{
              label: '# of Votes',
              data: Ddata,
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
      
    }).catch(error => {
      this.GlobalF.error(0);
    })
  }
  ionViewDidLoad() {
    this.test();
    this.barChart = new Chart(this.barCanvas.nativeElement, {

      type: 'bar',
      data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
          label: '# of Votes',
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



    this.lineChart = new Chart(this.lineCanvas.nativeElement, {

      type: 'line',
      data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
          {
            label: "My First dataset",
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
            data: [65, 59, 80, 81, 56, 55, 40],
            spanGaps: false,
          }
        ]
      }

    });

  }

}
