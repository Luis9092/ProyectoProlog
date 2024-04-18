% % suma de dos numeros
% suma(X, Y,Z) :- Z is X + Y.
% % sqrt = Sacar raiz cuadrada, 

% areaCuadradrado(Lado, X) :- X is Lado + Lado, write('Area Cuadrado: '), write(X).
% perimetroCuadrado(Lado, X) :- X is Lado**2, write('Perimetro Cuadrado: '), write(X).

% cuadrado(Valor) :- areaCuadradrado(Valor, X),nl,  perimetroCuadrado(X, Y).

% DETERMINAR SI ES MAYOR DE EDAD O NO A BASE DE LA EDAD
calcular(Edad, X):- Edad >= 18, write('Mayor Edad'), X is 1.
 
edad(Valo) :- calcular(Valo, Z), write(Z).

% SOLO UTILIZAR EL TRUE SOLO SI 


% Base de datos de cursos
curso(algebra, 101).
curso(calculo_i, 102, [algebra]).
curso(calculo_ii, 103, [calculo_i]).
curso(fisica_i, 104, [algebra]).
curso(fisica_ii, 105, [fisica_i, calculo_i]).

% Predicado para verificar si un curso tiene prerequisitos cumplidos
prerequisitos_cumplidos(Curso, Pre):-
  member(Pre, Prerequisitos),
  curso(Pre, _, _).

prerequisitos_cumplidos(Curso, []):-
  true.

% Predicado para inscribirse en un curso
inscribirse(Curso):-
  curso(Curso, Codigo, Prerequisitos),
  prerequisitos_cumplidos(Curso, Prerequisitos),
  write('Alumno inscrito en el curso ', Curso), nl,
  write('Codigo del curso: ', Codigo), nl.

% Ejemplo de uso
% inscribirse(calculo_i).
% inscribirse(calculo_ii).
% inscribirse(fisica_ii).