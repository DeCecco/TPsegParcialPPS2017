<?php
require_once "accesoDatos.php";
class Materia
{
	public $idMateria;
	public $idDia;
	public $idAula;
 	public $nombre;
  	public $cuatrimestre;
	public $division;
	public function __construct($idMateria, $idDia, $idAula, $nombre, $cuatrimestre, $division){
		$this->idMateria = $idMateria;
		$this->idDia = $idDia;
		$this->idAula = $idAula;
		$this->nombre = $nombre;
		$this->cuatrimestre = $cuatrimestre;
		$this->division = $division;
	}
	public static function TraerAlumnosSegunMateria($idMateria){
		$sql =
			'SELECT a.*
			FROM alumnos AS a, alumnos_materias AS am
			WHERE am.idAlumno = a.idAlumno
				AND am.idMateria = :idMateria
			ORDER BY a.apellido, a.nombre';
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idMateria', $idMateria, PDO::PARAM_INT);	
	    $consulta->execute();			
		return $consulta->fetchAll(PDO::FETCH_ASSOC);	
	}
	public static function TraerAlumnoAsistenciaSegunFechaMateriaAlumno($fecha, $idMateria, $idAlumno){	
		$sql =
			'SELECT a.*, asi.asistencia
			FROM alumnos AS a, asistencias AS asi
			WHERE a.idAlumno = asi.idAlumno
				AND asi.fecha = :fecha
				AND asi.idMateria = :idMateria
				AND asi.idAlumno = :idAlumno
			ORDER BY a.apellido, a.nombre';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':fecha', $fecha, PDO::PARAM_STR);
		$consulta->bindValue(':idMateria', $idMateria, PDO::PARAM_INT);
		$consulta->bindValue(':idAlumno', $idAlumno, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerMateriasSegunDiaYAlumno($idDia, $idAlumno){	
		$sql = 'SELECT m.*
				FROM materias AS m, alumnos_materias AS am
				WHERE m.idDia = :idDia
					AND am.idMateria = m.idMateria
					AND am.idAlumno = :idAlumno
				ORDER BY nombre';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idDia', $idDia, PDO::PARAM_INT);
		$consulta->bindValue(':idAlumno', $idAlumno, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerAlumnoSegunId($idAlumno){	
		$sql = 'SELECT *
				FROM alumnos
				WHERE idAlumno = :idAlumno';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idAlumno', $idAlumno, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerAlumnosSegunDia($idDia){	
		$sql = 'SELECT DISTINCT a.*
				FROM alumnos AS a, materias AS m, alumnos_materias AS am
				WHERE a.idAlumno = am.idAlumno
					AND m.idMateria = am.idMateria
					AND idDia = :idDia
				ORDER BY a.apellido, a.nombre';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idDia', $idDia, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerMateriasSegunDiaYAula($idDia, $idAula){	
		$sql = 'SELECT *
				FROM materias
				WHERE idDia = :idDia
					AND idAula = :idAula
				ORDER BY nombre';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idDia', $idDia, PDO::PARAM_INT);
		$consulta->bindValue(':idAula', $idAula, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerAulaSegunId($idAula){	
		$sql = 'SELECT *
				FROM aulas
				WHERE idAula = :idAula';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idAula', $idAula, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerAulasSegunDia($idDia){	
		$sql = 'SELECT DISTINCT a.*
				FROM aulas AS a, materias AS m
				WHERE m.idDia = :idDia
					AND a.idAula = m.idAula
				ORDER BY a.numero';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idDia', $idDia, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerMateriasSegunDiaYProfesor($idDia, $idProfesor){	
		$sql = 'SELECT m.*
				FROM materias AS m, profesores_materias AS pm
				WHERE pm.idProfesor = :idProfesor
					AND pm.idMateria = m.idMateria
					AND m.idDia = :idDia
				ORDER BY m.nombre';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idDia', $idDia, PDO::PARAM_INT);
		$consulta->bindValue(':idProfesor', $idProfesor, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerProfesorSegunId($idProfesor){	
		$sql = 'SELECT *
				FROM profesores
				WHERE idProfesor = :idProfesor';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idProfesor', $idProfesor, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerMateriasSegunIdProfesor($idProfesor){	
		$sql = 'SELECT m.*
				FROM materias AS m, profesores_materias AS pm
				WHERE pm.idProfesor = :idProfesor
					AND m.idMateria = pm.idMateria
				ORDER BY m.nombre';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idProfesor', $idProfesor, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerProfesoresSegunDia($idDia){	
		$sql = 'SELECT DISTINCT p.*
				FROM profesores AS p, materias AS m, profesores_materias AS pm
				WHERE m.idDia = :idDia
					AND p.idProfesor = pm.idProfesor
					AND m.idMateria = pm.idMateria
				ORDER BY p.apellido, p.nombre';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idDia', $idDia, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerAsistencia($fecha, $idMateria, $idAlumno){
		$sql = 'SELECT *
				FROM asistencias
				WHERE fecha = :fecha
					AND idMateria = :idMateria
					AND idAlumno = :idAlumno';
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':fecha', $fecha, PDO::PARAM_STR);
		$consulta->bindValue(':idMateria', $idMateria, PDO::PARAM_INT);
		$consulta->bindValue(':idAlumno', $idAlumno, PDO::PARAM_INT);
	    $consulta->execute();
	    return $consulta->fetch(PDO::FETCH_ASSOC);
	}
	public static function GuardarAsistencia($fecha, $idMateria, $idAlumno, $asistencia){	
		if (Materia::TraerAsistencia($fecha, $idMateria, $idAlumno) == NULL) {
			$sql = 'INSERT INTO asistencias (fecha, idMateria, idAlumno, asistencia)
					VALUES (:fecha, :idMateria, :idAlumno, :asistencia)';
			$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
			$consulta->bindValue(':fecha', $fecha, PDO::PARAM_STR);
			$consulta->bindValue(':idMateria', $idMateria, PDO::PARAM_INT);
			$consulta->bindValue(':idAlumno', $idAlumno, PDO::PARAM_INT);
			$consulta->bindValue(':asistencia', $asistencia, PDO::PARAM_INT);
			$consulta->execute();
		}
		else{
			$sql = 'UPDATE asistencias
					SET asistencia = :asistencia
					WHERE fecha = :fecha
						AND idMateria = :idMateria
						AND idAlumno = :idAlumno';
			$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
			$consulta->bindValue(':fecha', $fecha, PDO::PARAM_STR);
			$consulta->bindValue(':idMateria', $idMateria, PDO::PARAM_INT);
			$consulta->bindValue(':idAlumno', $idAlumno, PDO::PARAM_INT);
			$consulta->bindValue(':asistencia', $asistencia, PDO::PARAM_INT);
			$consulta->execute();
		}
	}
	public static function TraerAlumnosAsistenciaSegunFechaMateria($fecha, $idMateria){	
		$sql =
			'SELECT a.*, asi.asistencia
			FROM alumnos AS a, asistencias AS asi
			WHERE a.idAlumno = asi.idAlumno
				AND asi.fecha = :fecha
				AND asi.idMateria = :idMateria
			ORDER BY a.apellido, a.nombre';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':fecha', $fecha, PDO::PARAM_STR);
		$consulta->bindValue(':idMateria', $idMateria, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerMateriaSegunIdMateria($idMateria){	
		$sql = 'SELECT * FROM materias WHERE idMateria = :idMateria';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idMateria', $idMateria, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function TraerMateriasSegunDia($idDia){	
		$sql = 'SELECT * FROM materias WHERE idDia = :idDia';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':idDia', $idDia, PDO::PARAM_INT);
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	//OBTENCION DE TODOS LAS PERSONAS DE LA BASE DE DATOS
	public static function TraerTodasLasPersonas(){
		$sql = 'SELECT * FROM personas';
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
	    $consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);	
	}
	//ELIMINACION DE UNA PERSONA DE LA BASE DE DATOS
	public static function BorrarPersona($id){
		$sql = 'DELETE FROM personas WHERE id = :id';
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindValue(':id', $id, PDO::PARAM_INT);
		$consulta->execute();
	}
	//CREACION DEL PERSONA EN LA BASE DE DATOS
	public static function InsertarPersona($persona){
		//VERIFICACION DE EXISTENCIA DEL USUARIO
		if (Persona::ObtenerPersona($persona) != NULL) {
			return false;//EL USUARIO YA EXISTIA PREVIAMENTE EN LA BASE DE DATOS
		}
		else{
			//CREACION DEL USUARIO EN LA BASE DE DATOS
			$sql = 'INSERT INTO personas (nombre, apellido, dni, sexo, password) VALUES (:nombre, :apellido, :dni, :sexo, :password)';
			$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
			$consulta->bindValue(':nombre', $persona->nombre, PDO::PARAM_STR);
			$consulta->bindValue(':apellido', $persona->apellido, PDO::PARAM_STR);
			$consulta->bindValue(':dni', $persona->dni, PDO::PARAM_STR);
			$consulta->bindValue(':sexo', $persona->sexo, PDO::PARAM_STR);
			$consulta->bindValue(':password', $persona->password, PDO::PARAM_STR);
			$consulta->execute();
			return true;//ALTA EXITOSA
		}
	}
	//OBTENCION DE UN USUARIO
	public static function ObtenerPersona($persona){
		$sql = 'SELECT * FROM personas WHERE dni = :dni';
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':dni', $persona->dni, PDO::PARAM_STR);
	    $consulta->execute();
	    return $consulta->fetch(PDO::FETCH_ASSOC);
	}
}