<?php

require_once "accesoDatos.php";

class Estadisticas
{
    public static function traerAsistenciasCuatrimestrales(){
        $sql = " SELECT count(idestado) total,a.idestado ,e.descripcion,a.fecha,a.idmateriasusuarios,
                        mt.idturno,t.descripcion,
                        u.idusuario,concat(u.nombre, ' ',u.apellido) as nomap,u.nombre,u.apellido,
                        m.idmateria,m.descripcionCorta,m.cuatrimestre,m.anio
        from asistencia a
        left join `materias-usuarios` mu on mu.idmateriasusuarios=a.idmateriasusuarios and a.idusuario=mu.idusuario
        left join usuarios u on u.idusuario=mu.idusuario and u.idusuario=a.idusuario 
        left join `materias-turnos` mt on mt.idmateriasturnos=mu.idmateriasturnos 
        left join materias m on m.idmateria=mt.idmateria and mu.anio=m.anio and mu.cuatrimestre=m.cuatrimestre
        left join estados e on e.idestados=a.idestado
        left join turnos t on t.idturno=mt.idturno
        where m.estado=1 and u.estado=1 and a.idestado!=5 and u.idtipo=3 and m.cuatrimestre=1 and m.anio=1 and mt.idturno=1 and m.idmateria=15 and a.idestado=1
        group by nomap
        ";
        $consulta = AccesoDatos::ObtenerObjetoAccesoDatos()->ObtenerConsulta($sql);
	    $consulta->execute();
		return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
}