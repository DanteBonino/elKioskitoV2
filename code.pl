%Punto 1:
atiende(dodain, lunes, horario(9,15)).
atiende(dodain, miercoles, horario(9,15)).
atiende(dodain, viernes, horario(9,15)).
atiende(lucas, martes, horario(10,20)).
atiende(juanC, sabado, horario(18,22)).
atiende(juanC, domingo, horario(18,22)).
atiende(juanFds, jueves, horario(10,20)).
atiende(juanFds, viernes, horario(12,20)).
atiende(leoC, lunes, horario(14,18)).
atiende(leoC, miercoles, horario(14,18)).
atiende(martu, domingo, horario(23,24)).

atiende(vale,Dia, Horario):-
    esJuanCODodain(Persona),
    atiende(Persona, Dia, Horario).
    

esJuanCODodain(dodain).
esJuanCODodain(juanC).

%Punto 2:
quienAtiende(Persona, Dia, Hora):-
    atiende(Persona, Dia, horario(HoraInicial, HoraFinal)),
    between(HoraInicial, HoraFinal, Hora).

%Punto 3:
foreverAlone(Persona, Dia, Hora):-
    quienAtiende(Persona, Dia, Hora),
    not(compartenTurno(Persona, _, Dia, Hora)).

compartenTurno(Persona, OtraPersona, Dia, Hora):-
    quienAtiende(OtraPersona, Dia, Hora),
    Persona \= OtraPersona.

%Punto 5:
vendio(dodain,fecha(10,agosto),[golosinas(1200),cigarrillos([jockey]),golosinas(50)]).
vendio(dodain,fecha(12,agosto),[bebidas(8,noAlcoholicas),bebidas(1, noAlcoholicas),golosinas(10)]).
vendio(martu,fecha(12,agosto),[golosinas(1000),cigarrillos([chesterfield,colorado,parisienn])]).
vendio(lucas,fecha(11,agosto),[golosinas(600)]).
vendio(lucas,fecha(18,agosto),[bebidas(2,noAlcoholicas),cigarrillos([derby])]).

vendedoraSuertuda(Persona):-
    vendio(Persona,_,_),
    forall(vendio(Persona,_,Ventas), primerVentaImportante(Ventas)).

primerVentaImportante(Ventas):-
    nth0(0,Ventas, PrimerVenta),
    importante(PrimerVenta).

importante(golosinas(Ganancia)):-
    Ganancia > 100.
importante(cigarrillos(Marcas)):-
    length(Marcas, Cantidad),
    Cantidad > 2.
importante(bebidas(Cantidad,_)):-
    Cantidad > 5.
importante(bebidas(_,alcoholicas)).

