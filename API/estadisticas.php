<?php

require_once "accesoDatos.php";

class Estadisticas
{
    public static function traerAsistenciasCuatrimestrales($anio,$cuatrimestre,$idturno,$idmateria,$idtipo,$idusuario){
        $anio              =(int)$anio; 
        $cuatrimestre      =(int)$cuatrimestre;         
        $idturno           =(int)$idturno; 
        $idmateria         =(int)$idmateria;     
        $idtipo            =(int)$idtipo;     
        $idusuario         =(int)$idusuario;     
        switch ($idtipo) {
            case 1:
            case "1":
                $addSql="";
            break;
            case 2:
            case "2":
                $addSql="";
            break;
            case 3:
            case "3":
                $addSql=" and u.idusuario=$idusuario ";
            break;
            case 4:
            case "4":
                $addSql=" or m.idmateria!=$idmateria and u.idusuario=$idusuario ";
            break;
            default:
                $addSql="";
                break;
        }
        
        $sql = " SELECT count(idestado) totalPresente,concat(u.nombre, ' ',u.apellido) as nomap,0 totalAusente,0 nomap2,0 totalJustificado,0 nomap3,0 totalMediaFalta, 0 nomap4
        from asistencia a
        left join `materias-usuarios` mu on mu.idmateriasusuarios=a.idmateriasusuarios and a.idusuario=mu.idusuario
        left join usuarios u on u.idusuario=mu.idusuario and u.idusuario=a.idusuario 
        left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos 
        left join materias m on m.idmateria=mt.idmateria and mu.anio=m.anio and mu.cuatrimestre=m.cuatrimestre
        left join estados e on e.idestados=a.idestado
        left join turnos t on t.idturno=mt.idturno
        where m.estado=1 and u.estado=1 and a.idestado!=5 and u.idtipo=3 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$idturno and m.idmateria=$idmateria and a.idestado=1 ".$addSql." 
        group by nomap
        
        union
        SELECT 0,0,count(idestado) totalAusente,concat(u.nombre, ' ',u.apellido) as nomap,0,0,0,0
        from asistencia a
        left join `materias-usuarios` mu on mu.idmateriasusuarios=a.idmateriasusuarios and a.idusuario=mu.idusuario
        left join usuarios u on u.idusuario=mu.idusuario and u.idusuario=a.idusuario 
        left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos 
        left join materias m on m.idmateria=mt.idmateria and mu.anio=m.anio and mu.cuatrimestre=m.cuatrimestre
        left join estados e on e.idestados=a.idestado
        left join turnos t on t.idturno=mt.idturno
        where m.estado=1 and u.estado=1 and a.idestado!=5 and u.idtipo=3 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$idturno and m.idmateria=$idmateria and a.idestado=2 ".$addSql." 
        group by nomap
        union
        SELECT 0,0,0,0,count(idestado) totalAusente,concat(u.nombre, ' ',u.apellido) as nomap,0,0
        from asistencia a
        left join `materias-usuarios` mu on mu.idmateriasusuarios=a.idmateriasusuarios and a.idusuario=mu.idusuario
        left join usuarios u on u.idusuario=mu.idusuario and u.idusuario=a.idusuario 
        left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos 
        left join materias m on m.idmateria=mt.idmateria and mu.anio=m.anio and mu.cuatrimestre=m.cuatrimestre
        left join estados e on e.idestados=a.idestado
        left join turnos t on t.idturno=mt.idturno
        where m.estado=1 and u.estado=1 and a.idestado!=5 and u.idtipo=3 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$idturno and m.idmateria=$idmateria and a.idestado=3 ".$addSql." 
        group by nomap
        union
        SELECT 0,0,0,0,0,0,count(idestado) totalAusente,concat(u.nombre, ' ',u.apellido) as nomap
        from asistencia a
        left join `materias-usuarios` mu on mu.idmateriasusuarios=a.idmateriasusuarios and a.idusuario=mu.idusuario
        left join usuarios u on u.idusuario=mu.idusuario and u.idusuario=a.idusuario 
        left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos 
        left join materias m on m.idmateria=mt.idmateria and mu.anio=m.anio and mu.cuatrimestre=m.cuatrimestre
        left join estados e on e.idestados=a.idestado
        left join turnos t on t.idturno=mt.idturno
        where m.estado=1 and u.estado=1 and a.idestado!=5 and u.idtipo=3 and m.cuatrimestre=$cuatrimestre and m.anio=$anio and mt.idturno=$idturno and m.idmateria=$idmateria and a.idestado=4 ".$addSql." 
        group by nomap
        ";
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
        $consulta->execute();
        
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
}