program ej3;
type

finales = record
	codigo: integer;
	nota: integer;
end;

lista=^nodoL;
	nodoL = record
	dato: finales;
	sig: lista;
	end;


alumno = record
	legajo: integer;
	codigo: integer;
	fecha: integer;
	nota: integer;
end;

nodoArbol = record
	alu: alumno;
	materias: lista;
	end;

arbol=^nodoA;
	nodoA = record
	dato: nodoArbol;
	hi: arbol;
	hd: arbol;
end;


procedure imprimirListaAprobados(l:lista ; leg: integer);
var
cant: integer;
begin
	cant:= 0;
	while (l<> nil) do begin
		if(l^.dato.nota > 3) then
			cant:= cant + 1;
			l:= l^.sig;
		end;
	if (cant>0) then begin
		writeln('LEGAJO DE ALUMNO APROBADO: ' , leg);
		writeln('CANT DE FINALES APROBADOS: ' , cant);
	end;
end;


procedure imprimirAprobados (a:arbol);
begin
	if (a<>nil) then begin
		imprimirListaAprobados(a^.dato.materias, a^.dato.alu.legajo);
		imprimirAprobados(a^.hi);
		imprimirAprobados(a^.hd);
	end;
end;


function devolverImpar(a:arbol): integer;
begin
	if (a= nil) then begin
		devolverImpar:= 0
	end
	else
	if ((a^.dato.alu.legajo MOD 2 <> 0)) then
		devolverImpar:= 1 + devolverImpar(a^.hi) + devolverImpar(a^.hd)
	else
		devolverImpar:= devolverImpar(a^.hi) + devolverImpar(a^.hd)
end;



procedure imprimirFinales(l: lista);
begin
	while (l<> nil) do begin
		writeln('CODIGO DE MATERIA:' , l^.dato.codigo);
		writeln('NOTA OBTENIDA: ', l^.dato.nota);
		l:= l^.sig;
	end;

end;

procedure imprimirCampos(a: nodoArbol);
begin
	writeln('LEGAJO DE ALUMNO: ', a.alu.legajo);
	writeln('FINALES DEL ALUMNO:');
	imprimirFinales(a.materias);
end;


procedure imprimirArbol(a: arbol);
begin
	if (a<>nil) then begin
		imprimirArbol(a^.hi);
		imprimirCampos(a^.dato);
		imprimirArbol(a^.hd);
	end;
	writeln;
end;


procedure agregarAdelante(var l: lista ; alu: alumno);
var
nue: lista;
begin
	new(nue);
	nue^.dato.codigo:= alu.codigo;
	nue^.dato.nota:= alu.nota;
	nue^.sig:= l;
	l:= nue;
end;


procedure cargarArbol (var a: arbol ; alu: alumno);
begin
	if (a=nil) then begin
		new(a);
		a^.dato.alu:= alu;
		a^.dato.materias:= nil;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if (alu.legajo = a^.dato.alu.legajo) then
			agregarAdelante(a^.dato.materias,alu)
		else	
		if (alu.legajo <= a^.dato.alu.legajo) then
			cargarArbol(a^.hi, alu)
		else
			cargarArbol(a^.hd, alu)			
end;


procedure leerAlumno(var alu: alumno);
begin
	alu.legajo:= random(500);
	alu.codigo:= random(100) + 1;
	alu.fecha:= random(2024 - 2000) + 2000;
	alu.nota:= random(10) + 1;
end;

procedure cargarDatos (var a: arbol);
var
alu: alumno;
begin
	leerAlumno(alu);
	while (alu.legajo <> 0) do begin
		cargarArbol(a,alu);
		leerAlumno(alu);
	end;
end;



var
a: arbol;
begin
cargarDatos(a);
writeln('ARBOL IMPRESO:');
imprimirArbol(a);
writeln;
writeln('CANTIDAD DE ALUMNOS CON LEGAJO IMPAR: ', devolverImpar(a));
writeln;
imprimirAprobados(a);
end.
