<?php

require_once "accesoDatos.php";

class Materias
{
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
}