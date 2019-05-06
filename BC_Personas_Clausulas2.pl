mujer(ana).
mujer(maria).
mujer(luisa).
mujer(fabiola).
mujer(esther).
mujer(rocio).
mujer(deysi).
mujer(vanessa).
mujer(martha).
mujer(romina).

hombre(hugo).
hombre(paco).
hombre(luis).
hombre(mario).
hombre(marco).
hombre(juan).
hombre(pedro).
hombre(raul).
hombre(gerardo).
hombre(sergio).

madre(ana, rocio).
madre(ana, maria).
madre(ana, luis).
madre(martha, deysi).
madre(fabiola, romina).
madre(romina, luisa).

padre(raul, rocio).
padre(raul, maria).
padre(raul, luis).
padre(marco, hugo). %marco es abuelo de sergio
padre(pedro, gerardo).
padre(marco, romina).
padre(sergio, paco).
padre(hugo, sergio). %hugo es abuelo de paco


%Regla para identificar ABUELOS
	%Para ser abuelo se necesita SER PADRE
	%Su hijo, debe tener Hijos

abuelo(X, Y) :- padre(X, Z), (padre(Z, Y) ; madre(Z, Y)).

% Consulta: 
% ?- abuelo(X, Y).
% X = marco,
% Y = sergio ;
% X = marco,
% Y = luisa ;
% X = hugo,
% Y = paco ;
% false.

%Regla para identificar ABUELAS
abuela(X, Y) :- madre(X, Z), (madre(Z, Y) ; padre(Z, Y)).

% consulta: 
% ?- abuela(X, Y).
% X = fabiola,
% Y = luisa ;
% false.

%Regla para identificar PERSONAS
persona(X) :- mujer(X) ; hombre(X).

%consulta: 
% ?- persona(X).
% X = ana ;
% X = maria ;
% X = luisa ;
% X = fabiola ;
% X = esther ;
% X = rocio ;
% X = deysi ;
% X = vanessa ;
% X = martha ;
% X = romina ;
% X = hugo ;
% X = paco ;
% X = luis ;
% X = mario ;
% X = marco ;
% X = juan ;
% X = pedro ;
% X = raul ;
% X = gerardo ;
% X = sergio.

%Regla para identificar PAREJAS
pareja(X, Y) :- padre(X, Z), madre(Y, Z).

% consulta: 
% ?- pareja(X, Y).
% X = raul,
% Y = ana ;
% X = marco,
% Y = fabiola ;
% false.

%Regla para identificar NIETOS
nieto(Y, V) :- hombre(Y), (abuelo(V, Y) ; abuela(V, Y)).

% consulta:
% ?- nieto(X, Y).
% X = paco,
% Y = hugo ;
% X = sergio,
% Y = marco.

%Regla para identificar NIETAS
nieta(Y, V) :- mujer(Y), (abuelo(V, Y) ; abuela(V, Y)).

% consulta: 
% ?- nieta(X, Y).
% X = luisa,
% Y = marco ;
% X = luisa,
% Y = fabiola ;
% false.

%Regla para identificar HERMANOS
hermano(X, Y) :- hombre(X), ((padre(Z, X), madre(V, X)) , (padre(Z, Y), madre(V, Y))).

%consulta:
%?- hermano(X, Y).
%X = luis,
%Y = rocio ;
%X = luis,
%Y = maria ;
%X = Y, Y = luis ;
%false.

%Regla para identificar HERMANAS
hermana(X, Y) :- mujer(X), ((padre(Z, X), madre(V, X)) , (padre(Z, Y), madre(V, Y))).

% consulta: 
% ?- hermana(X, Y).
% X = maria,
% Y = rocio ;
% X = Y, Y = maria ;
% X = maria,
% Y = luis ;
% X = Y, Y = rocio ;
% X = rocio,
% Y = maria ;
% X = rocio,
% Y = luis .