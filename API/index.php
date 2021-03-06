<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
require_once "usuarios.php";
require_once "materias.php";
require_once "estadisticas.php";
require 'vendor/autoload.php';
require 'AutentificadorJWT.php';

$app = new \Slim\App(['settings' => ['determineRouteBeforeAppMiddleware' => true,'displayErrorDetails' => true,'addContentLengthHeader' => false]]);

$app->add(function (Request $request, Response $response, $next) {
    $response = $next($request, $response);
    return $response
      ->withHeader('Access-Control-Allow-Origin', '*')//servidor
		//	->withHeader('Access-Control-Allow-Origin', 'http://localhost:8100')//local
      ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
      ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
      //->withHeader('Accept', 'application/json')
      //->withHeader('content-type', 'application/json');
});


  
/**
   * @api {any} /Crear/  Crear
   * @apiVersion 0.1.0
   * @apiName Crear 
   * @apiGroup TOKEN
   * @apiDescription  Crea el token a partir de los datos del usuario y variables internas declaradas 
   *
   * @apiParam {array_string} data  Contiene el mail,rol,nombre,apellido,id,cuenta y dni del usuario logueado
   *
   * @apiExample Como usarlo:
   *JS	this.WebserviceService.CrearToken(array).then(data => {
   *PHP 	AutentificadorJWT::CrearToken($datos); 
*/
$app->post('/crearToken', function (Request $request, Response $response) {
	
	$mail = $request->getParam('mail');	
	$idtipo = $request->getParam('idtipo');
	$nombre = $request->getParam('nombre');
  $apellido = $request->getParam('apellido');		
  $idimagen = $request->getParam('idimagen');		
  $idusuario = $request->getParam('idusuario');		
  $estado = 1;		
	
    $datos = array('mail' => $mail,'idtipo' => $idtipo, 'nombre' => $nombre,'apellido' => $apellido,'idimagen' => $idimagen,'idusuario' => $idusuario,'estado' => $estado);    
    
    $token= AutentificadorJWT::CrearToken($datos); 
	//$payload=AutentificadorJWT::ObtenerPayload($token);
    $newResponse = $response->withJson($token, 200); 
    return $newResponse;
});
/**
   * @api {any} /Verificar/  Verificar
   * @apiVersion 0.1.0
   * @apiName Verificar 
   * @apiGroup TOKEN
   * @apiDescription  Verifica que el token ingresado sea valido
   *
   * @apiParam {string} token  Posee el token del usuario
   *
   * @apiExample Como usarlo:
   *JS	this.WebserviceService.VerificarToken(token).then(data => {
   *PHP 	AutentificadorJWT::verificarToken($token);
*/ 
$app->post('/verificarToken', function (Request $request, Response $response) {
		
	$token = $request->getParam('token');		            		
	 $esValido=false;
      try 
      {
        AutentificadorJWT::verificarToken($token);
        $esValido=true;      
      }
      catch (Exception $e) {      
        //guardar en un log
				$esValido=false;
        //echo $e;
      }  
	  $esValido =$response->withJson($esValido, 200); 
      return $esValido;
});  


/**
   * @api {any} /PayLoad/  PayLoad
   * @apiVersion 0.1.0
   * @apiName PayLoad 
   * @apiGroup TOKEN
   * @apiDescription  Decodifica el token y devuelve los datos del mismo
   *
   * @apiParam {string} token  Posee el token del usuario
   *
   * @apiExample Como usarlo:
   *JS	this.WebserviceService.PayLoad(token).then(data => {
   *PHP 	AutentificadorJWT::ObtenerPayload($token);
*/ 
$app->post('/payLoad', function (Request $request, Response $response) {
	
	$token = $request->getParam('token');		          
	$payload=AutentificadorJWT::ObtenerPayload($token);
  $newResponse = $response->withJson($payload, 200); 
  return $newResponse;
});


//----------------------------------INICIO - AULAS---------------------------------//
$app->get('/materias/traerAulas', function (Request $request, Response $response){
  return $response->withJson(Materias::traerAulas());
});

$app->post('/materias/altaAula', function (Request $request, Response $response) {
		
  $aula= $request->getParam('aula');  
  Materias::altaAula($aula);
  return $response->withJson("Exito");
});
$app->post('/materias/modificarAula', function (Request $request, Response $response) {
		
  $aula= $request->getParam('descripcion');
  $idaula= $request->getParam('idaula');
  $estado= $request->getParam('estado');
  Materias::modificarAula($aula,$idaula,$estado);
  return $response->withJson("Exito");
});
$app->post('/materias/turnosXMateria', function (Request $request, Response $response) {
		
  $idmateria= $request->getParam('idmateria');
  
  return $response->withJson(Materias::turnosXMateria($idmateria));  
});
//----------------------------------FIN  - AULAS---------------------------------//
//----------------------------------INICIO - MATERIAS---------------------------------//
$app->post('/materias/listarMateria', function (Request $request, Response $response){
  return $response->withJson(Materias::listarMaterias());
});
$app->post('/materias/altaMateria', function (Request $request, Response $response) {
		
  $descripcion= $request->getParam('descripcion');
  $descripcionCorta= $request->getParam('descripcionCorta');
  $turno= $request->getParam('turno');
  $aulaAsig= $request->getParam('aulaAsig');
  $anio= $request->getParam('anio');
  $cuatrimestre= $request->getParam('cuatrimestre');
  
  return $response->withJson(Materias::altaMateriaTurno($descripcion,$descripcionCorta,$turno,$aulaAsig,$anio,$cuatrimestre));
});
$app->post('/materias/modificarMateria', function (Request $request, Response $response) {
	$idmateria= $request->getParam('idmateria');	
  $descripcion= $request->getParam('descripcion');
  $descripcionCorta= $request->getParam('descripcionCorta');
  $estado= $request->getParam('estado');
  $turno= $request->getParam('turno');
  $aulaAsig= $request->getParam('aulaAsig');
  $anio= $request->getParam('anio');
  $cuatrimestre= $request->getParam('cuatrimestre');
  
  return $response->withJson(Materias::modificarMateriaTurno($idmateria,$descripcion,$descripcionCorta,$estado,$turno,$aulaAsig,$anio,$cuatrimestre));
});
$app->post('/materias/buscarTurnos', function (Request $request, Response $response) {
		
  $idmateria= $request->getParam('idmateria');    
  return $response->withJson(Materias::buscarTurnos($idmateria));
});
$app->post('/materias/buscarAulaMateria', function (Request $request, Response $response) {
		
  $idmateria= $request->getParam('idmateria');    
  return $response->withJson(Materias::buscarAulaMateria($idmateria));
});
$app->post('/materias/listarMateriaAsignada', function (Request $request, Response $response) {
		
  $anio= $request->getParam('anio');    
  $cuatrimestre= $request->getParam('cuatrimestre'); 
  $turno= $request->getParam('turno'); 
  $idusuario=   $request->getParam('idusuario');   
  return $response->withJson(Materias::listarMateriaAsignada($anio,$cuatrimestre,$turno,$idusuario));
});
$app->post('/materias/grabarAsignacion', function (Request $request, Response $response) {
		
  $lista= $request->getParam('lista');      
  $idusuario = $lista[0]['idusuario'];  
  return $response->withJson(Materias::grabarAsignacion($lista,$idusuario));
});
$app->post('/materias/tomarAsistencia', function (Request $request, Response $response) {
		
  $anio= $request->getParam('anio');    
  $cuatrimestre= $request->getParam('cuatrimestre'); 
  $turno= $request->getParam('turno'); 
  $idmateria=   $request->getParam('idmateria');   
  return $response->withJson(Materias::tomarAsistencia($anio,$cuatrimestre,$turno,$idmateria));
});
$app->post('/materias/cambiarEstadoAsistencia', function (Request $request, Response $response) {
		
  $idmateriasusuarios= $request->getParam('idmateriasusuarios');    
  $idusuario= $request->getParam('idusuario'); 
  $idestado= $request->getParam('idestado');   
  return $response->withJson(Materias::cambiarEstadoAsistencia($idmateriasusuarios,$idusuario,$idestado));
});
$app->post('/materias/verificarAulaCreada', function (Request $request, Response $response){  
	return $response->withJson(materias::verificarAulaCreada($request->getParam('descripcion'),$request->getParam('idaula')));
});
$app->post('/materias/verificarAulaOcupada', function (Request $request, Response $response) {
		
  $idturno= $request->getParam('idturno');    
  $anio= $request->getParam('anio'); 
  $cuatrimestre= $request->getParam('cuatrimestre');   
  $idaula= $request->getParam('idaula');   
  $idmateria= $request->getParam('idmateria');   
  return $response->withJson(Materias::verificarAulaOcupada($idturno,$anio,$cuatrimestre,$idaula,$idmateria));
});
$app->post('/materias/comboMaterias', function (Request $request, Response $response) {
		
  $idturno= $request->getParam('idturno');    
  $anio= $request->getParam('anio'); 
  $cuatrimestre= $request->getParam('cuatrimestre');     
  $idusuario= $request->getParam('idusuario');     
  $idtipo= $request->getParam('idtipo');     
  return $response->withJson(Materias::comboMaterias($idturno,$anio,$cuatrimestre,$idusuario,$idtipo));
});
//----------------------------------FIN  - MATERIAS---------------------------------//
//----------------------------------INICIO - USUARIOS---------------------------------//
/**
   * @api {any} /Verificar/  Verificar
   * @apiVersion 0.1.0
   * @apiName Verificar 
   * @apiGroup TOKEN
   * @apiDescription  Verifica que el token ingresado sea valido
   *
   * @apiParam {string} token  Posee el token del usuario
   *
   * @apiExample Como usarlo:
   *JS	this.WebserviceService.VerificarToken(token).then(data => {
   *PHP 	AutentificadorJWT::verificarToken($token);
*/  

$app->post('/usuarios/altaUsuario', function (Request $request, Response $response) {
		
  $mail= $request->getParam('mail');
  $idtipo= $request->getParam('idtipo');
  $nombre= $request->getParam('nombre');
  $apellido= $request->getParam('apellido');
  $idimagen= $request->getParam('idimagen');  
  Usuarios::altaUsuario($mail,$idtipo,$nombre,$apellido,$idimagen);  
  return $response->withJson("Exito");
});
$app->post('/usuarios/modificarUsuario', function (Request $request, Response $response) {
	$idusuario= $request->getParam('idusuario');	
  $mail= $request->getParam('mail');
  $idtipo= $request->getParam('idtipo');
  $nombre= $request->getParam('nombre');
  $apellido= $request->getParam('apellido');
  $idimagen= $request->getParam('idimagen');  
  $estado= $request->getParam('estado');  
  Usuarios::modificarUsuario($idusuario,$mail,$idtipo,$nombre,$apellido,$idimagen,$estado);  
  return $response->withJson("Exito");
});
$app->post('/usuarios/verificarUsuario', function (Request $request, Response $response){  
	return $response->withJson(usuarios::VerificarUsuario($request->getParam('mail')));
});

$app->post('/usuarios/traerDatosUser', function (Request $request, Response $response){  
	return $response->withJson(usuarios::traerDatosUser($request->getParam('mail')));
});

$app->post('/usuarios/listarUsuarios', function (Request $request, Response $response){
  $traer= $request->getParam('traer');	
  return $response->withJson(Usuarios::listarUsuarios($traer));
});


//----------------------------------FIN  - USUARIOS---------------------------------//
//----------------------------------INICIO  - ESTADISTICAS---------------------------------//
$app->post('/estadisticas/traerAsistenciasCuatrimestrales', function (Request $request, Response $response) {
	
  $idturno= $request->getParam('idturno');    
  $anio= $request->getParam('anio'); 
  $cuatrimestre= $request->getParam('cuatrimestre');     
  $idmateria= $request->getParam('idmateria');   
  $idtipo= $request->getParam('idtipo');   
  $idusuario= $request->getParam('idusuario');   
  return $response->withJson(Estadisticas::traerAsistenciasCuatrimestrales($anio,$cuatrimestre,$idturno,$idmateria,$idtipo,$idusuario));
});

//----------------------------------FIN  - ESTADISTICAS---------------------------------//

$app->run();
?>
