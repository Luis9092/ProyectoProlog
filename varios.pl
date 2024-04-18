% Definir los cursos
curso(informatica, basico).
curso(bases_datos, informatica).
curso(sistemas_operativos, bases_datos).
curso(inteligencia_artificial, sistemas_operativos).
curso(redes_computacionales, sistemas_operativos).

% Predicado para verificar si un curso tiene un prerequisito
prerequisito(Curso, Prerequisito) :-
  curso(Curso, Prerequisito).

% Predicado para verificar si se han completado los prerequisitos para un curso
prerequisitos_completos(Curso) :-
  prerequisito(Curso, Prerequisito),
  not(curso_completado(Prerequisito)).

% Predicado para marcar un curso como completado
curso_completado(Curso) :-
  assert(completado(Curso)).

% Ejemplo de uso
aspirante(juan).

puede_tomar(Curso) :-
  aspirante(Persona),
  curso(Curso, _),
  not(prerequisitos_completos(Curso)),
  once(curso_completado(Curso)).
% LUIS FERNANDO PAXEL COJOLON 0910-20-388
