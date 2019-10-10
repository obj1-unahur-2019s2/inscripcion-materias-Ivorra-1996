import materias.*
import notas.*
import enaprobacion.*
class Alumno {
	var aprobaciones = []
	var property nombre 
	

	/*1. Registrar una materia aprobada por un estudiante indicando la nota obtenida. Si el estudiante ya tiene registrada la aprobación de la materia, se debe lanzar un error.*/
	method registrarAprobacion(materia,nota){
		var aprobacion = new Aprobacion(materiaEnAprobacion = materia,notasEnAprobracion=nota)
		aprobacion.materiaEnAprobacion(materia)
		aprobacion.notasEnAprobracion(nota)
		if(aprobaciones.any({materias => })){aprobaciones.add(aprobacion)}
		else{}
			
	}
}

	/*2. Saber para un estudiante: si tiene o no aprobada una materia, la cantidad de materias aprobadas, el promedio.*/
