<?php

require_once "accesoDatos.php";

class Usuarios
{
	/*
	public $idUsuario;
	public $idRol;
	public $email;
 	public $password;
	

	//CONSTRUCTOR
	public function __construct($idRol, $idUsuario, $email, $password, $dni,$legajo){
		$this->idRol = $idRol;
		$this->idUsuario = $idUsuario;
		$this->email = $email;
		$this->password = $password;
	
	}*/
	public static function VerificarUsuario($mail){
		$sql = "SELECT *,count(*)  existe FROM usuarios WHERE mail = :mail ";
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':mail', $mail);
	    $consulta->execute();
	    return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function altaUsuario($mail,$idtipo,$nombre,$apellido,$idimagen){
		$sql = " INSERT INTO asistencia.usuarios (idtipo,idimagen,nombre,apellido,mail) 
		values (:idtipo,:idimagen,:nombre,:apellido,:mail); ";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':mail',$mail);
		$consulta->bindParam(':idtipo',$idtipo);
		$consulta->bindParam(':nombre',$nombre);
		$consulta->bindParam(':apellido',$apellido);
		$consulta->bindParam(':idimagen',$idimagen);		
	    $consulta->execute();
	}
	public static function modificarUsuario($idusuario,$mail,$idtipo,$nombre,$apellido,$idimagen,$estado){
		$sql = "UPDATE usuarios set mail=:mail, idtipo=:idtipo,nombre=:nombre,apellido=:apellido,idimagen=:idimagen,estado=:estado 
		where idusuario=:idusuario";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':mail',$mail);
		$consulta->bindParam(':idtipo',$idtipo);
		$consulta->bindParam(':nombre',$nombre);
		$consulta->bindParam(':apellido',$apellido);
		$consulta->bindParam(':idimagen',$idimagen);		
		$consulta->bindParam(':idusuario',$idusuario);		
		$consulta->bindParam(':estado',$estado);		
	    $consulta->execute();
	}
	public static function traerDatosUser($mail){
		$sql = " SELECT u.idusuario,u.idtipo,u.nombre,u.apellido,u.mail,i.imagen 
		FROM `usuarios` u 
		left join imagenesu i ON u.idimagen=i.idimagenesU 
		where u.mail=:mail ";
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':mail', $mail);
	    $consulta->execute();
	    return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}

	public static function listarUsuarios(){
		$sql = "SELECT *,concat(nombre, ' ',apellido) as nomap  from usuarios where estado=1 order by apellido ";
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
	    $consulta->execute();
	    return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
}