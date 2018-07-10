<?php

require_once "accesoDatos.php";

class Materias
{
	//----------------------------------INICIO - AULAS---------------------------------//
    public static function traerAulas(){
		$sql = 'SELECT * FROM aulas where estado=1';
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
	    $consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    public static function altaAula($aula){
		$sql = " INSERT INTO aulas (descripcion) 
		values (:aula); ";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':aula',$aula);		
	    $consulta->execute();
	}
	public static function modificarAula($aula,$idaula,$estado){				
		$sql = " UPDATE aulas set descripcion=:aula,estado=:estado where idaula=:idaula";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':aula',$aula);		
		$consulta->bindParam(':idaula',$idaula);		
		$consulta->bindParam(':estado',$estado);		
	    $consulta->execute();
	}	

	//----------------------------------FIN  - AULAS---------------------------------//
	//----------------------------------INICIO - MATERIAS---------------------------------//

	public static function listarMaterias(){
		$sql = 'SELECT * FROM materias where estado=1';
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
	    $consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function altaMateriaTurno($descripcion,$descripcionCorta,$turno,$aulaAsig){
		
		Materias::altaMateria($descripcion,$descripcionCorta);		
		$id=Materias::ultimoIdMateria();
		Materias::insertarTurnos($id,$turno);		
		Materias::insertarAulaMateria($aulaAsig,$id);
	}
	public static function insertarTurnos($idmateria,$turno){
		foreach ($turno as $key => $value) {
			
			$sql = " INSERT INTO `materias-turnos` (idmateria,idturno) 
				values (:idmateria,$value); ";
			$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
			$consulta->bindParam(':idmateria',$idmateria);					
			$consulta->execute();
		}
	}
	public static function insertarAulaMateria($aulaAsig,$idmateria){
		foreach ($aulaAsig as $key => $value) {
			if($value!=null){
				$sql = " INSERT INTO `materias-aulas` (idmateria,idaula,idturno) 
					values (:idmateria,$value,$key); ";
				$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
				$consulta->bindParam(':idmateria',$idmateria);					
				$consulta->execute();
			}
		}
	}
	
	public static function altaMateria($descripcion,$descripcionCorta){
		$sql = " INSERT INTO materias (descripcion,descripcionCorta) 
		values (:descripcion,:descripcionCorta); ";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':descripcion',$descripcion);		
		$consulta->bindParam(':descripcionCorta',$descripcionCorta);				
		$consulta->execute();		
	}
	public static function ultimoIdMateria(){
		$sql = "select idmateria from materias order by idmateria desc limit 1 ";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->execute();		
		return $consulta->fetchColumn();	
	}
	public static function buscarTurnos($idmateria){
		$sql = "select idturno from `materias-turnos` where idmateria=:idmateria	";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->bindParam(':idmateria',$idmateria);				
		$consulta->execute();				
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function buscarAulaMateria($idmateria){
		$sql = "select idaula,idturno from `materias-aulas` where idmateria=:idmateria	";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->bindParam(':idmateria',$idmateria);				
		$consulta->execute();				
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}

	public static function modificarMateriaTurno($idmateria,$descripcion,$descripcionCorta,$estado,$turno,$aulaAsig){
		
		Materias::modificarMateria($idmateria,$descripcion,$descripcionCorta,$estado);	
		if($estado!=0){			

				$sql = "DELETE from `materias-turnos` where idmateria=:idmateria";
				$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
				$consulta->bindParam(':idmateria',$idmateria);					
				$consulta->execute();
				$sql = "DELETE from `materias-aulas` where idmateria=:idmateria";
				$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
				$consulta->bindParam(':idmateria',$idmateria);					
				$consulta->execute();		
				Materias::insertarTurnos($idmateria,$turno);	
				Materias::insertarAulaMateria($aulaAsig,$idmateria);
		}
		
	}
	public static function modificarMateria($idmateria,$descripcion,$descripcionCorta,$estado){
		$sql = "UPDATE materias set descripcion=:descripcion,descripcionCorta=:descripcionCorta,estado=:estado 
		where idmateria=:idmateria";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':descripcion',$descripcion);		
		$consulta->bindParam(':descripcionCorta',$descripcionCorta);				
		$consulta->bindParam(':estado',$estado);		
		$consulta->bindParam(':idmateria',$idmateria);		
		$consulta->execute();		
	}
	//----------------------------------FIN  - MATERIAS---------------------------------//
}