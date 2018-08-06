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
				Materias::eliminarMateriaAula($idmateria);
				Materias::insertarTurnos($idmateria,$turno);	
				Materias::insertarAulaMateria($aulaAsig,$idmateria);
		}
		
	}
	public static function eliminarMateriaAula($idmateria){
		$sql = "DELETE from `materias-aulas` where idmateria=:idmateria";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->bindParam(':idmateria',$idmateria);				
		$consulta->execute();				
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
		$sql = "SELECT  m.idmateria,m.descripcionCorta,m.descripcion,mt.idmateriasturnos,0 'asignado',$idusuario as 'idusuario',$anio as 'anio',$cuatrimestre as 'cuatrimestre' from materias       m
		left join `materias-turnos` mt on mt.idmateria=m.idmateria
		where m.estado=1 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$turno and mt.idmateriasturnos not in (select mt.idmateriasturnos  from `materias-usuarios` mt where mt.idusuario=$idusuario)
		union 
		select m.idmateria,m.descripcionCorta,m.descripcion,mu.idmateriasturnos,mu.asignado,$idusuario as 'idusuario',$anio as 'anio',$cuatrimestre as 'cuatrimestre' from `materias-usuarios` mu
		left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
		left join materias m  on mt.idmateria=m.idmateria
		where m.estado=1 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$turno and mu.idusuario=$idusuario";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);						
		$consulta->execute();				
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function grabarAsignacion($lista,$idusuario){		
		Materias::borrarAsignacion($lista[0]['anio'],$lista[0]['cuatrimestre'],$idusuario);

		foreach ($lista as $key => $value) {			
			if($value['asignado']==1){		
				
				$sql = "INSERT into `materias-usuarios` (idmateriasturnos,idusuario,asignado,anio,cuatrimestre) values (".$value['idmateriasturnos'].",".$idusuario.",".$value['asignado'].",".$value['anio'].",".$value['cuatrimestre'].");";			
				$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);							
				$consulta->execute();				
			}
		}
	}
	public static function borrarAsignacion($anio,$cuatrimestre,$idusuario){
		$sql = "delete from `materias-usuarios` where anio=:anio and cuatrimestre=:cuatrimestre and idusuario=:idusuario";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->bindParam(':anio',$anio);		
		$consulta->bindParam(':cuatrimestre',$cuatrimestre);		
		$consulta->bindParam(':idusuario',$idusuario);		
		$consulta->execute();		
	}
	public static function tomarAsistencia($anio,$cuatrimestre,$turno,$idmateria){
		$sql= " SELECT mu.idmateriasusuarios,0 as 'idasistencia',mu.idusuario,mu.anio,mu.cuatrimestre,mt.idmateria,m.descripcion,m.descripcioncorta,mt.idturno,
		u.nombre,u.apellido,5 as 'asistio',0 'fecha',concat(u.nombre, ' ',u.apellido) as nomap,'1' as idimagen
		from `materias-usuarios` mu
		left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
		left join materias m on m.idmateria=mt.idmateria
		left join usuarios u on u.idusuario=mu.idusuario
		where mu.anio=$anio and mu.cuatrimestre=$cuatrimestre  and m.estado=1 and m.idmateria=$idmateria and u.estado=1 
		and mu.idusuario not in(SELECT a.idusuario from asistencia a
								left join  `materias-usuarios` mu on a.idmateriasusuarios=mu.idmateriasusuarios
								left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
								where a.idestado!=5 and mu.cuatrimestre=$cuatrimestre and mu.anio=$anio and mt.idmateria=$idmateria
								)
		union		
		SELECT a.idmateriasusuarios,a.idasistencia,a.idusuario,mu.anio,mu.cuatrimestre,m.idmateria,m.descripcion,m.descripcioncorta,mt.idturno,
		u.nombre,u.apellido,a.idestado,a.fecha,concat(u.nombre, ' ',u.apellido) as nomap,'1' as idimagen
		from asistencia a
		left join  `materias-usuarios` mu on a.idmateriasusuarios=mu.idmateriasusuarios
		left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
		left join materias m on m.idmateria=mt.idmateria
		left join usuarios u on u.idusuario=mu.idusuario
		where a.idestado!=5 and mu.cuatrimestre=$cuatrimestre and mu.anio=$anio and mt.idmateria=$idmateria ";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);							
		$consulta->execute();				
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function cambiarEstadoAsistencia($idmateriasusuarios,$idusuario,$idestado){
		
		Materias::borrarEstadoAsistencia($idmateriasusuarios,$idusuario);

		$sql = "INSERT into asistencia (idmateriasusuarios,idusuario,idestado,fecha) values (:idmateriasusuarios,:idusuario,:idestado,'".gmdate('d-m-Y')."')";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->bindParam(':idmateriasusuarios',$idmateriasusuarios);		
		$consulta->bindParam(':idestado',$idestado);		
		$consulta->bindParam(':idusuario',$idusuario);		
		$consulta->execute();		
	}
	public static function borrarEstadoAsistencia($idmateriasusuarios,$idusuario){
		$sql = "delete from asistencia where idmateriasusuarios=:idmateriasusuarios and idusuario=:idusuario and fecha='".gmdate('d-m-Y')."'";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->bindParam(':idmateriasusuarios',$idmateriasusuarios);				
		$consulta->bindParam(':idusuario',$idusuario);				
		$consulta->execute();		
	}
	//----------------------------------FIN  - MATERIAS---------------------------------//
	
}