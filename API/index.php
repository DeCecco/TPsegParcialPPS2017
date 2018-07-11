<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
require_once "usuarios.php";
require_once "materias.php";
require 'vendor/autoload.php';
require 'AutentificadorJWT.php';

$app = new \Slim\App(['settings' => ['determineRouteBeforeAppMiddleware' => true,'displayErrorDetails' => true,'addContentLengthHeader' => false]]);

$app->add(function (Request $request, Response $response, $next) {
    $response = $next($request, $response);
    return $response
            //->withHeader('Access-Control-Allow-Origin', '*')//servidor
			->withHeader('Access-Control-Allow-Origin', '*')//local
      ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
      ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
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
	
	$email = $request->getParam('email');	
	$tipo = $request->getParam('tipo');
	$nombre = $request->getParam('nombre');
	$apellido = $request->getParam('apellido');		
	
    $datos = array('email' => $email,'tipo' => $tipo, 'nombre' => $nombre,'apellido' => $apellido);    
    
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
  Materias::altaMateriaTurno($descripcion,$descripcionCorta,$turno,$aulaAsig,$anio,$cuatrimestre);
  return $response->withJson("Exito");
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
  Materias::modificarMateriaTurno($idmateria,$descripcion,$descripcionCorta,$estado,$turno,$aulaAsig,$anio,$cuatrimestre);
  return $response->withJson("Exito");
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
  return $response->withJson(Usuarios::listarUsuarios());
});

//----------------------------------FIN  - USUARIOS---------------------------------//
$app->run();
?>
