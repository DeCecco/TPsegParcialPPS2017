<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
require_once "materia.php";
require_once "persona.php";
require 'vendor/autoload.php';
$app = new \Slim\App(['settings' => ['displayErrorDetails' => true]]);
$app->add(function (Request $request, Response $response, $next) {
    $response = $next($request, $response);
    return $response
            ->withHeader('Access-Control-Allow-Origin', 'http://localhost:8100')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});
$app->get('/materia/TraerAlumnoAsistenciaSegunFechaMateriaAlumno', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerAlumnoAsistenciaSegunFechaMateriaAlumno($request->getParam('fecha'), $request->getParam('idMateria'), $request->getParam('idAlumno')));
});
$app->get('/materia/TraerMateriasSegunDiaYAlumno', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerMateriasSegunDiaYAlumno($request->getParam('idDia'), $request->getParam('idAlumno')));
});
$app->get('/materia/TraerAlumnoSegunId', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerAlumnoSegunId($request->getParam('idAlumno')));
});
$app->get('/materia/TraerAlumnosSegunDia', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerAlumnosSegunDia($request->getParam('idDia')));
});
$app->get('/materia/TraerMateriasSegunDiaYAula', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerMateriasSegunDiaYAula($request->getParam('idDia'), $request->getParam('idAula')));
});
$app->get('/materia/TraerAulaSegunId', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerAulaSegunId($request->getParam('idAula')));
});
$app->get('/materia/TraerAulasSegunDia', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerAulasSegunDia($request->getParam('idDia')));
});
$app->get('/materia/TraerMateriasSegunDiaYProfesor', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerMateriasSegunDiaYProfesor($request->getParam('idDia'), $request->getParam('idProfesor')));
});
$app->get('/materia/TraerProfesorSegunId', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerProfesorSegunId($request->getParam('idProfesor')));
});
$app->get('/materia/TraerMateriasSegunIdProfesor', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerMateriasSegunIdProfesor($request->getParam('idProfesor')));
});
$app->get('/materia/TraerProfesoresSegunDia', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerProfesoresSegunDia($request->getParam('idDia'), $request->getParam('idMateria')));
});
$app->get('/materia/TraerAlumnosAsistenciaSegunFechaMateria', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerAlumnosAsistenciaSegunFechaMateria($request->getParam('fecha'), $request->getParam('idMateria')));
});
$app->get('/materia/TraerMateriaSegunIdMateria', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerMateriaSegunIdMateria($request->getParam('idMateria')));
});
$app->get('/materia/TraerMateriasSegunDia', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerMateriasSegunDia($request->getParam('idDia')));
});
$app->get('/alumno/TraerAlumnosSegunMateria', function (Request $request, Response $response){
    return $response->withJson(Materia::TraerAlumnosSegunMateria($request->getParam('idMateria')));
});
$app->post('/materia/GuardarAsistencia', function (Request $request, Response $response) {
    $fecha = $request->getParam('fecha');
	$idMateria = $request->getParam('idMateria');
	$datos = $request->getParam('datos');
	foreach ($datos as $idAlumno => $asistencia) {
		Materia::GuardarAsistencia($fecha, $idMateria, $idAlumno, $asistencia);
	}
	return $response->withJson("Exito");
});	

$app->post('/persona/borrarpersona', function (Request $request, Response $response) {
	return $response->withJson(Persona::BorrarPersona($request->getParam('id'),$request->getParam('rol')));
    
});
$app->get('/persona/obtenerTodas', function (Request $request, Response $response){
    return $response->withJson(Persona::TraerTodasLasPersonas());
});
$app->post('/persona/vermail', function (Request $request, Response $response){
	$email = $request->getParam('email');
    return $response->withJson(Persona::VerificarMail($email));
});
$app->post('/persona/verdni', function (Request $request, Response $response){
	$dni = $request->getParam('dni');
    return $response->withJson(Persona::VerificarDni($dni));
});
$app->post('/persona/verlegajo', function (Request $request, Response $response){
	$legajo = $request->getParam('legajo');
    return $response->withJson(Persona::VerificarLegajo($legajo));
});
$app->post('/persona/traerusuarios', function (Request $request, Response $response){
	$id = $request->getParam('id');
    return $response->withJson(Persona::TraerUsuarios($id));
});
$app->post('/persona/traerusuariosmasdatos', function (Request $request, Response $response){
	$id = $request->getParam('id');
    return $response->withJson(Persona::TraerUsuariosMasDatos($id));
});
$app->post('/persona/agregar', function (Request $request, Response $response) {    
	$email = $request->getParam('email');
	$password = $request->getParam('password');
	$rol = $request->getParam('rol');
	$nombre = $request->getParam('nombre');
	$apellido = $request->getParam('apellido');
	$dni = $request->getParam('dni');
	$legajo = $request->getParam('legajo');
	return $response->withJson(Persona::InsertarPersona($email,$password,$rol,$nombre,$apellido,$dni,$legajo));     
});	
$app->post('/persona/modificar', function (Request $request, Response $response) {    
	$email = $request->getParam('email');
	$password = $request->getParam('password');
	$rol = $request->getParam('rol');
	$nombre = $request->getParam('nombre');
	$apellido = $request->getParam('apellido');
	$dni = $request->getParam('dni');
	$legajo = $request->getParam('legajo');
	$id = $request->getParam('id');
	return $response->withJson(Persona::ModificarPersona($email,$password,$rol,$nombre,$apellido,$dni,$legajo,$id));     
});	
$app->run();


