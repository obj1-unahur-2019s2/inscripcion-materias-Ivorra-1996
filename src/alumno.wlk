import enaprobacion.*
import carreras.*
class Alumno {
	var aprobaciones = []
	var carreras =[]
	var materias = []
	

	/*1. Registrar una materia aprobada por un estudiante indicando la nota obtenida. Si el estudiante ya tiene registrada la aprobación de la materia, se debe lanzar un error.*/
	method registrarAprobacion(ma,nota){
		var aprobacion = new Aprobacion()
		aprobacion.materiaEnAprobacion(ma)
		aprobacion.notasEnAprobracion(nota)
		
		if(aprobaciones.any({materia => materia.materiaEnAprobacion() == ma })){self.error("Ya esta aprobada ")}
		else {aprobaciones.add(aprobacion)}
			
	}
	/*2. Saber para un estudiante: si tiene o no aprobada una materia, la cantidad de materias aprobadas, el promedio.*/
	method materiasAprobadas(){return aprobaciones.filter({notas => notas.notasEnAprobracion() >= 4})}
	
	method cantidadDeMateriasAp(){
		return self.materiasAprobadas().size()
	}
	/*3. Saber para un estudiante: la colección de materias de todas las carreras a las que está inscripto. P.ej. para Roque debe incluir todas las de programación y también todas las de medicina.
	Sugerencia: mirar el método flatten, p.ej. probar [[3,4],[6,8,2]].flatten().*/
	method materiasDeLasCarrerasInscripto(){
		return carreras.flatMap({car => car.materias()})
		//return carreras.map({car => car.materias()}).flatten()
	}
	method inscripcionAMaterias(materia){materias.add(materia)}
	method inscripcionACarreras(carrera){carreras.add(carrera)}
	method cursandoCarrera(){
		return materias.count({materia=> self.materiasDeLasCarrerasInscripto() == materias})
	}
}
/*

Determinar si un estudiante puede inscribirse a una materia. Para esto se deben cumplir cuatro condiciones:

    la materia debe corresponder a alguna de las carreras que esté cursando el estudiante,
    el estudiante no puede haber aprobado la materia previamente,
    el estudiante no debe estar estar ya inscripto en esa materia,
    el estudiante debe tener aprobadas todas las materias que se declaran como requisitos de la materia a la que se quiere inscribir.
    P.ej., para que un estudiante pueda inscribirse a Objetos 2, es necesario tener aprobadas Objetos 1 y Matemática 1.

*/
 
 