% Se deberá plasmar el esquema de la carrera de ingeniería en sistemas, incluyendo:
% 1.Un estudiante puede estar inscrito en una carrera, así mismo estar asignado a cursos.
% 2.Los cursos pertenecen a distintos ciclos y cuentan con un horario y prerrequisitos(otros cursos).
% 3. El estudiante puede estar solvente a nivel de cursos (que cursos ya ha pagado).
% 4. El estudiante puede estar inscrito en algunos cursos, así como haber aprobado otros cursos.
% LUIS FERNANDO PAXEL COJOLON 0910-20-388

% --------------------------   CARRERAS     --------------------------
carreras(ingenieria).
carreras(arquitectura).
carreras(derecho).
carreras(administracion).
 
% --------------------------    HORARIOS    --------------------------
horarios(7:30).
horarios(8:30).
horarios(6:30).

% --------------------------    CICLOS     --------------------------
ciclos(primero).
ciclos(segundo).
ciclos(tercero).

% --------------------------    LISTADO CURSOS    --------------------------
listadoCursos(algebra1).
listadoCursos(algebra2).
listadoCursos(calculo1).
listadoCursos(derecho1).
listadoCursos(derecho2).
listadoCursos(logica1).

% --------------------------  CURSOSXCARRERA     --------------------------
% ¿Qué cursos existen en la carrera de ingeniería en sistemas? 

cursosCarrera(ingenieria, algebra1):-carreras(ingenieria), listadoCursos(algebra1).
cursosCarrera(ingenieria, algebra2):-carreras(ingenieria), listadoCursos(algebra2).
cursosCarrera(ingenieria, calculo1):-carreras(ingenieria), listadoCursos(calculo1).
cursosCarrera(ingenieria, logica1):-carreras(ingenieria), listadoCursos(logica1).
cursosCarrera(derecho, derecho1):-carreras(derecho), listadoCursos(derecho1).
cursosCarrera(derecho, derecho2):-carreras(derecho), listadoCursos(derecho2).


% --------------------------  PREREQUISITOS     --------------------------
prere(algebra2, ['aprobado algrebra1', '+1250 xp']).
prere(derecho2, ['aprobado derecho1', '+1250 xp']).


% --------------------------    CURSOS    ADJUNTAR CON  CURSOSPORCARRRERA       --------
cursos(algebra1, 7:30, primero):-cursosCarrera(X,algebra1), carreras(X),ciclos(primero).
cursos(algebra2, 7:30, segundo):-cursosCarrera(X,algebra2), carreras(X),ciclos(segundo), prere(algebra2,_).
cursos(derecho1, 6:30, segundo):-cursosCarrera(X,derecho1), carreras(X),ciclos(primero).
cursos(derecho2, 6:30, segundo):-cursosCarrera(X,derecho2), carreras(X),ciclos(primero), prere(derecho2, _).
cursos(calculo1, 6:30, tercero):-cursosCarrera(X,calculo1), carreras(X),ciclos(tercero).


% --------------------------  ESTUDIANTES    --------------------------
estudiante(luis).
estudiante(lucia).
estudiante(maria).
estudiante(carlos).

% --------------------------   INSCRIPCIONES   --------------------------
inscripciones(luis, ingenieria).
inscripciones(lucia, ingenieria).
inscripciones(maria, derecho).

% CURSOS APROBADOS POR LUIS
cursosAprobados(luis,logica1):- cursosCarrera(logica1, _).

%-------------------------- VER CURSOS       --------------------------
% ¿Cuáles son los prerrequisitos del curso Y? 
verPrerequisitoCurso(Curso):-cursos(Curso,_,B), prere(Curso, C),
write('Curso: '), write(Curso),  nl, write('Ciclo: '), write(B), nl, write('Prerequisitos: '),  write(C).
 
% PAGO CURSOS ESTUDIANTE
pagoCurso(luis,algebra1, 200):- estudiante(luis), inscripciones(luis,_), cursos(algebra1, _, _), not(cursosAprobados(luis, algebra1)) .


% --------------------------  ESTUDIANTES INSCRITO, CURSO   --------------------------
% ASIGNACION DE CURSOS PARA LUIS
asignandoCurso(luis,algebra1):-estudiante(luis), inscripciones(luis,Z), cursosCarrera(Z, algebra1), cursos(algebra1,_,_), pagoCurso(luis, algebra1,_).
asignandoCurso(luis,calculo1):-estudiante(luis), inscripciones(luis,Z), cursosCarrera(Z, calculo1), cursos(calculo1, _, _), pagoCurso(luis, calculo1,_).
 
% ASIGNACION DE CURSOS PARA LUCIA
asignandoCurso(lucia,algebra1):-estudiante(lucia), inscripciones(lucia,Z), cursosCarrera(Z, algebra1),cursos(algebra1,_,_), pagoCurso(lucia, algebra1,_).
asignandoCurso(lucia,calculo1):-estudiante(lucia), inscripciones(lucia,Z),cursosCarrera(Z, calculo1), cursos(calculo1, _, _), pagoCurso(lucia, calculo1,_).

% ASIGNACION DE CURSOS PARA MARIA
asignandoCurso(maria,derecho1):-estudiante(maria), inscripciones(maria,Z), cursosCarrera(Z, derecho1),cursos(derecho1,_,_), pagoCurso(maria,derecho1,_).
asignandoCurso(maria,calculo1):-estudiante(maria), inscripciones(maria,Z),cursosCarrera(Z, calculo1), cursos(calculo1,_, _), pagoCurso(maria, calculo1,_).

% --------------------------     ¿En que ciclos esta llevando cursos el estudiante X?      --------------------------
verCursosAsignados(X):-asignandoCurso(X,Curso),cursos(Curso, Hora, Ciclo), write(X), nl, write(Ciclo). 

%--------------------  Listar los estudiantes que tienen asignados cursos en el mismo horario --------------------------
verEstudianteHora(Hora):- horarios(Hora), cursos(Curso, Hora, Ciclo), asignandoCurso(Estudiante, Curso), write(Estudiante).