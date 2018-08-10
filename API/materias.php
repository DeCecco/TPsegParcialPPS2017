<?php

require_once "accesoDatos.php";

class Materias
{
	//----------------------------------INICIO - AULAS---------------------------------//
    public static function traerAulas(){
		$sql = 'SELECT * FROM aulas where estado=1 order by descripcion ';
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
		$sql = 'SELECT * FROM materias where estado=1 order by anio,cuatrimestre,descripcion';
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
	    $consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function altaMateriaTurno($descripcion,$descripcionCorta,$turno,$aulaAsig,$anio,$cuatrimestre){

		for ($i=0; $i < count($aulaAsig); $i++) { 
			if($aulaAsig[$i]){
				$respuesta=Materias::verificarAulaOcupada($turno,$anio,$cuatrimestre,$aulaAsig[$i],0,$i);
				
				
				if($respuesta[0]['existe']!=0){
					return "La materia " .$respuesta[0]['descripcion'] . " ocupa el aula " . $respuesta[0]['aula'] . " en el turno " . $respuesta[0]['turno'];
					die();
				}
			}
		}		
		Materias::altaMateria($descripcion,$descripcionCorta,$anio,$cuatrimestre);		
		$id=Materias::ultimoIdMateria();
		Materias::insertarTurnos($id,$turno);		
		Materias::insertarAulaMateria($aulaAsig,$id);	
		return 1;	
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
		
		for ($i=0; $i < count($aulaAsig); $i++) { 
			if($aulaAsig[$i]){
				$respuesta=Materias::verificarAulaOcupada($turno,$anio,$cuatrimestre,$aulaAsig[$i],$idmateria,$i);
				
				if($respuesta[0]['existe']!=0){
					return "La materia " .$respuesta[0]['descripcion'] . " ocupa el aula " . $respuesta[0]['aula'] . " en el turno " . $respuesta[0]['turno'];
					die();
				}
			}
		}

		Materias::modificarMateria($idmateria,$descripcion,$descripcionCorta,$estado,$anio,$cuatrimestre);	
		if($estado!=0){			

				$sql = "DELETE from `materias-turnos` where idmateria=:idmateria";
				$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
				$consulta->bindParam(':idmateria',$idmateria);					
				$consulta->execute();
				Materias::eliminarMateriaAula($idmateria);
				Materias::insertarTurnos($idmateria,$turno);	
				Materias::insertarAulaMateria($aulaAsig,$idmateria);
				return 1;
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
		$sql = "SELECT  m.idmateria,m.descripcionCorta,m.descripcion,mt.idmateriasturnos,0 'asignado',$idusuario as 'idusuario',$anio as 'anio',$cuatrimestre as 'cuatrimestre',u.idtipo
		from materias       m
		left join usuarios u on u.idusuario=$idusuario
		left join `materias-turnos` mt on mt.idmateria=m.idmateria
		where m.estado=1 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$turno and mt.idmateriasturnos not in (select mt.idmateriasturnos  from `materias-usuarios` mt where mt.idusuario=$idusuario)
		union 
		select m.idmateria,m.descripcionCorta,m.descripcion,mu.idmateriasturnos,mu.asignado,$idusuario as 'idusuario',$anio as 'anio',$cuatrimestre as 'cuatrimestre',u.idtipo from `materias-usuarios` mu
		left join usuarios u on u.idusuario=$idusuario
		left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
		left join materias m  on mt.idmateria=m.idmateria
		where m.estado=1 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$turno and mu.idusuario=$idusuario";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);						
		$consulta->execute();				
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function verificarMateriasInscriptas($idusuario,$cuatrimestre,$anio,$idmateria){
		
		$sql="SELECT  count(*) existe,m.descripcion,case mt.idturno when 1 then 'Mañana'
			when 2 then 'Tarde'
			when 3 then 'Noche' end as turno from `materias-usuarios` mu
			left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
			left join materias m on m.idmateria=mt.idmateria and mu.anio=m.anio and mu.cuatrimestre=m.cuatrimestre 
			where mu.idusuario=:idusuario and m.estado=1 and m.cuatrimestre=:cuatrimestre and m.anio=:anio and m.idmateria=:idmateria;";
			$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);			
			$consulta->bindParam(':anio',$anio);		
			$consulta->bindParam(':cuatrimestre',$cuatrimestre);		
			$consulta->bindParam(':idusuario',$idusuario);						
			$consulta->bindParam(':idmateria',$idmateria);						
			$consulta->execute();		
			return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function grabarAsignacion($lista,$idusuario){		

		foreach ($lista as $key => $value) {			
			Materias::borrarAsignacion($lista[0]['anio'],$lista[0]['cuatrimestre'],$idusuario,$value['idmateriasturnos']);					
			if($value['asignado']==1 || $value['asignado']==true ){						

				if($value['idtipo']!=2 || $value['idtipo']!='2')
					$respuesta=Materias::verificarMateriasInscriptas($value['idusuario'],$value['cuatrimestre'],$value['anio'],$value['idmateria']);
				
				if($respuesta[0]['existe']!=0){
					return "No se grabaron los datos porque la materia " . $respuesta[0]['descripcion'] . " ya se encuentra asignada al turno " . $respuesta[0]['turno'];
				}else{			
					$sql = "INSERT into `materias-usuarios` (idmateriasturnos,idusuario,asignado,anio,cuatrimestre) values (".$value['idmateriasturnos'].",".$idusuario.",1,".$value['anio'].",".$value['cuatrimestre'].");";			
					$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);							
					$consulta->execute();				
					
				}	
			}
		}
		return 1;
	}


	public static function borrarAsignacion($anio,$cuatrimestre,$idusuario,$idmateriasturnos){
		
		$sql = "delete from `materias-usuarios` where anio=:anio and cuatrimestre=:cuatrimestre and idusuario=:idusuario and idmateriasturnos=:idmateriasturnos";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);		
		$consulta->bindParam(':anio',$anio);		
		$consulta->bindParam(':cuatrimestre',$cuatrimestre);		
		$consulta->bindParam(':idusuario',$idusuario);		
		$consulta->bindParam(':idmateriasturnos',$idmateriasturnos);		
		$consulta->execute();		
	}
	public static function tomarAsistencia($anio,$cuatrimestre,$turno,$idmateria){
		$sql= " SELECT mu.idmateriasusuarios,0 as 'idasistencia',mu.idusuario,mu.anio,mu.cuatrimestre,mt.idmateria,m.descripcion,m.descripcioncorta,mt.idturno,
		u.nombre,u.apellido,5 as 'asistio',0 'fecha',concat(u.nombre, ' ',u.apellido) as nomap,'1' as idimagen
		from `materias-usuarios` mu
		left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
		left join materias m on m.idmateria=mt.idmateria
		left join usuarios u on u.idusuario=mu.idusuario
		where mu.anio=".(int)$anio." and mu.cuatrimestre=".(int)$cuatrimestre."  and m.estado=1 and mt.idmateria=".(int)$idmateria." and u.estado=1 and mt.idturno=".(int)$turno."
		and mu.idusuario not in(SELECT a.idusuario from asistencia a
								left join  `materias-usuarios` mu on a.idmateriasusuarios=mu.idmateriasusuarios
								left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
								where a.idestado!=5 and mu.cuatrimestre=".(int)$cuatrimestre." and mu.anio=".(int)$anio." and mt.idmateria=".(int)$idmateria." and mt.idturno=".(int)$turno." and fecha='".gmdate('d-m-Y')."'
								)
		union		
		SELECT a.idmateriasusuarios,a.idasistencia,a.idusuario,mu.anio,mu.cuatrimestre,m.idmateria,m.descripcion,m.descripcioncorta,mt.idturno,
		u.nombre,u.apellido,a.idestado,a.fecha,concat(u.nombre, ' ',u.apellido) as nomap,'1' as idimagen
		from asistencia a
		left join  `materias-usuarios` mu on a.idmateriasusuarios=mu.idmateriasusuarios
		left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos
		left join materias m on m.idmateria=mt.idmateria
		left join usuarios u on u.idusuario=mu.idusuario
		where a.idestado!=5 and mu.cuatrimestre=".(int)$cuatrimestre." and mu.anio=".(int)$anio." and mt.idmateria=".(int)$idmateria." and mt.idturno=".(int)$turno ." and fecha='".gmdate('d-m-Y')."'";
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

	public static function verificarAulaCreada($descripcion,$idaula){
		$sql = "SELECT count(descripcion) existe from aulas where descripcion like '%$descripcion%' and estado=1 and idaula!=$idaula";
		$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);						
		$consulta->execute();				
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
	}
	public static function verificarAulaOcupada($idturno,$anio,$cuatrimestre,$idaula,$idmateria,$pos){
		
				
					if(array_search($pos,$idturno) || array_search($pos,$idturno)==0 ){
						$sql = " SELECT count(m.idmateria) existe, m.descripcion,mt.idturno,m.cuatrimestre,m.anio,a.descripcion aula,
						case mt.idturno when 1 then 'Mañana'
										when 2 then 'Tarde'
										when 3 then 'Noche' end as turno
						from materias m
						left join  `materias-turnos` mt on mt.idmateria=m.idmateria
						left join `materias-aulas` ma on ma.idmateria=m.idmateria and mt.idturno=ma.idturno
						left join aulas a on a.idaula=ma.idaula
						where mt.idturno=:idturno and m.anio=:anio and m.cuatrimestre=:cuatrimestre and ma.idaula=:idaula and m.estado=1 and m.idmateria!=:idmateria";				
						$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);							
						$consulta->bindParam(':idturno',$pos);		
						$consulta->bindParam(':anio',$anio);		
						$consulta->bindParam(':cuatrimestre',$cuatrimestre);						
						$consulta->bindParam(':idaula',$idaula);		
						$consulta->bindParam(':idmateria',$idmateria);		
						 
						$consulta->execute();							
						return $consulta->fetchAll(PDO::FETCH_ASSOC); 
					}else{
						return 0;
					}				

	}
	public static function comboMaterias($idturno,$anio,$cuatrimestre,$idusuario,$idtipo){
			
			if($idtipo==2 || $idtipo=="2" ){
				$addSql=" left join `materias-usuarios` mu on mu.idmateriasturnos=mt.idmateriasturnos and mu.anio=m.anio and mu.cuatrimestre=m.cuatrimestre ";
				$addSql2=" and mu.idusuario=$idusuario ";
			}else{
				$addSql="";
				$addSql2="";
			}
		 
			$sql = " SELECT m.idmateria,m.descripcion from materias m
			left join `materias-turnos` mt on mt.idmateria=m.idmateria
			" . $addSql ."
			where mt.idturno=:idturno and m.anio=:anio and m.cuatrimestre=:cuatrimestre and m.estado=1 " . $addSql2;				
			$consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);							
			

			$consulta->bindParam(':idturno',$idturno);		
			$consulta->bindParam(':anio',$anio);		
			$consulta->bindParam(':cuatrimestre',$cuatrimestre);		 
			$consulta->execute();							
			return $consulta->fetchAll(PDO::FETCH_ASSOC); 
	 
	}
	//----------------------------------FIN  - MATERIAS---------------------------------//
	
}