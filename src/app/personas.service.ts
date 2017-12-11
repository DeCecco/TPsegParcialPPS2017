import { Injectable } from '@angular/core';
import { Http, RequestOptions, Headers} from '@angular/http';
import 'rxjs/add/operator/toPromise';

@Injectable()
export class PersonasService{
  route : string = "http://localhost/UTN/TPsegParcialPPS2017/API/index.php/";  
  //route : string = "http://localhost:8080/index.php/";
  /*route : string="http://nggroup.esy.es/api/index.php/";*/                
  constructor(private http : Http) { }

  TraerAlumnosAsistenciaSegunFechaMateria(fecha, idMateria){
    let requestOptions = new RequestOptions({
      params : {
        "fecha" : fecha,
        "idMateria" : idMateria
      }
    });
    return this.http.get(this.route + "materia/TraerAlumnosAsistenciaSegunFechaMateria", requestOptions).toPromise().then(data => data.json());
  }

  TraerMateriaSegunIdMateria(idMateria){
    let requestOptions = new RequestOptions({
      params : {"idMateria" : idMateria}
    });
    return this.http.get(this.route + "materia/TraerMateriaSegunIdMateria", requestOptions).toPromise().then(data => data.json());
  }

  TraerMateriasSegunDia(idDia){
    let requestOptions = new RequestOptions({
      params : {"idDia" : idDia}
    });
    return this.http.get(this.route + "materia/TraerMateriasSegunDia", requestOptions).toPromise().then(data => data.json());
  }

  TraerAlumnosSegunMateria(idMateria){
    let requestOptions = new RequestOptions({
      params : {"idMateria" : idMateria}
    });
    return this.http.get(this.route + "alumno/TraerAlumnosSegunMateria", requestOptions).toPromise().then(data => data.json());
  }
  
  GuardarAsistencia(fecha, idMateria, datos){    
    var body = {"fecha" : fecha,
                "idMateria" : idMateria,
                "datos" : datos};
    console.log("en el servicio..." + fecha + "..." + idMateria + "..." + datos);
    return this.http.post(this.route + "materia/GuardarAsistencia", body).toPromise().then(data => data.json());
    
  }






  TraerPersonas(){
    return this.http.get(this.route + "persona/obtenerTodas").toPromise().then(data => data.json());
  }
  VerificarEmail(email){
    //REQUESTOPTIONS SIRVE PARA PASAR PARAMETROS CON HTTP      
    var data = {"email":email}
    return this.http.post(this.route + "persona/vermail", data).toPromise();
  }
  VerificarDni(dni){
    //REQUESTOPTIONS SIRVE PARA PASAR PARAMETROS CON HTTP      
    var data = {"dni":dni}
    return this.http.post(this.route + "persona/verdni", data).toPromise();
  }
  VerificarLegajo(legajo){
    //REQUESTOPTIONS SIRVE PARA PASAR PARAMETROS CON HTTP      
    var data = {"legajo":legajo}
    return this.http.post(this.route + "persona/verlegajo", data).toPromise();
  }
  TraerUsuarios(id){
    //REQUESTOPTIONS SIRVE PARA PASAR PARAMETROS CON HTTP      
    var data = {"id":id}
    return this.http.post(this.route + "persona/traerusuarios", data).toPromise().then(data => data.json());
  }
  TraerUsuariosMasDatos(id){
    //REQUESTOPTIONS SIRVE PARA PASAR PARAMETROS CON HTTP      
    var data = {"id":id}
    return this.http.post(this.route + "persona/traerusuariosmasdatos", data).toPromise().then(data => data.json());
  }
  BorrarPersona(id,rol){
    //REQUESTOPTIONS SIRVE PARA PASAR PARAMETROS CON HTTP      
    var data = {"id":id,"rol":rol}
    return this.http.post(this.route + "persona/borrarpersona", data).toPromise();
  }
  ModificarPersona(formData){         
      var body = {"email" : formData[0].email,
                  "rol" : formData[0].rol,
                  "password" : formData[0].password,
                  "nombre" : formData[0].nombre,
                  "apellido" : formData[0].apellido,
                  "dni" : formData[0].dni,
                  "legajo" : formData[0].legajo,
                  "id" : formData[0].id,
                  }    
    return this.http.post(this.route + "persona/modificar", body).toPromise();
  }
  AgregarPersona(formData){         
      var body = {"email" : formData[0].email,
                  "rol" : formData[0].rol,
                  "password" : formData[0].password,
                  "nombre" : formData[0].nombre,
                  "apellido" : formData[0].apellido,
                  "dni" : formData[0].dni,
                  "legajo" : formData[0].legajo,
                  }    
    return this.http.post(this.route + "persona/agregar", body).toPromise();
  }
}
