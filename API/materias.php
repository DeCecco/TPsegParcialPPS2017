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
	public static function turnosXMateria($idmateria){				
		$sql = "SELECT mt.*,t.descripcion from `materias-turnos` mt
			left join turnos t on t.idturno=mt.idturno
			where mt.idmateria=:idmateria";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':idmateria',$idmateria);		
		$consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}	
	//----------------------------------FIN  - AULAS---------------------------------//
	//----------------------------------INICIO - MATERIAS---------------------------------//

	public static function listarMaterias(){
		$sql = 'SELECT * FROM materias where estado=1';
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
	    $consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function altaMateriaTurno($descripcion,$descripcionCorta,$turno,$aulaAsig,$anio,$cuatrimestre){
		
		Materias::altaMateria($descripcion,$descripcionCorta,$anio,$cuatrimestre);		
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
	
	public static function altaMateria($descripcion,$descripcionCorta,$anio,$cuatrimestre){
		$sql = " INSERT INTO materias (descripcion,descripcionCorta,anio,cuatrimestre) 
		values (:descripcion,:descripcionCorta,:anio,:cuatrimestre); ";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':descripcion',$descripcion);		
		$consulta->bindParam(':descripcionCorta',$descripcionCorta);				
		$consulta->bindParam(':anio',$anio);	
		$consulta->bindParam(':cuatrimestre',$cuatrimestre);	
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

	public static function modificarMateriaTurno($idmateria,$descripcion,$descripcionCorta,$estado,$turno,$aulaAsig,$anio,$cuatrimestre){
		
		Materias::modificarMateria($idmateria,$descripcion,$descripcionCorta,$estado,$anio,$cuatrimestre);	
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
	public static function modificarMateria($idmateria,$descripcion,$descripcionCorta,$estado,$anio,$cuatrimestre){
		$sql = "UPDATE materias set descripcion=:descripcion,descripcionCorta=:descripcionCorta,estado=:estado,anio=:anio,cuatrimestre=:cuatrimestre 
		where idmateria=:idmateria";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
		$consulta->bindParam(':descripcion',$descripcion);		
		$consulta->bindParam(':descripcionCorta',$descripcionCorta);				
		$consulta->bindParam(':estado',$estado);		
		$consulta->bindParam(':idmateria',$idmateria);		
		$consulta->bindParam(':anio',$anio);		
		$consulta->bindParam(':cuatrimestre',$cuatrimestre);		
		$consulta->execute();		
	}

	public static function listarMateriaAsignada($anio,$cuatrimestre,$turno,$idusuario){
		$sql = "SELECT  m.idmateria,m.descripcionCorta,m.descripcion,mt.idmateriasturnos,0 'asignado',$idusuario as 'idusuario' from materias       m
		left join `materias-turnos` mt on mt.idmateria=m.idmateria
		where m.estado=1 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$turno and mt.idmateriasturnos not in (select mt.idmateriasturnos  from `materias-usuarios` mt where mt.idusuario=$idusuario)
		union 
		select m.idmateria,m.descripcionCorta,m.descripcion,mu.idmateriasturnos,mu.asignado,$idusuario as 'idusuario' from `materias-usuarios` mu
		left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
		left join materias m  on mt.idmateria=m.idmateria
		where m.estado=1 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$turno and mu.idusuario=$idusuario";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);						
		$consulta->execute();				
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function grabarAsignacion($lista,$idusuario){
		
		

		foreach ($lista as $key => $value) {
			Materias::borrarAsignacion($value['idmateriasturnos']);
			if($value['asignado']==1){		
				
				$sql = "INSERT into `materias-usuarios` (idmateriasturnos,idusuario,asignado) values (".$value['idmateriasturnos'].",".$idusuario.",".$value['asignado'].");";
			
				$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);						
				$consulta->execute();				
			}
		}
	}
	public static function borrarAsignacion($idmateriasturnos){
		$sql = "delete from `materias-usuarios` where idmateriasturnos=:idmateriasturnos";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->bindParam(':idmateriasturnos',$idmateriasturnos);		
		$consulta->execute();		
	}
	//----------------------------------FIN  - MATERIAS---------------------------------//
}