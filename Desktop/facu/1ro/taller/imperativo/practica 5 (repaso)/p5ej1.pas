program p5ej2;
{a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos: 
* i. Una estructura eficiente para la búsqueda por patente. 
* ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben almacenar todos juntos los autos pertenecientes a ella.
*  b) Invoque aunmóduloquereciba la estructura generado en a) i y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. 
* c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. 
* d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con la información de los autos agrupados por año de fabricación. 
* e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el modelo del auto con dicha patente.
*  f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el modelo del auto con dicha patente.}
type
rangoAnio = 2010..2018;
auto = record
	patente: integer;
	anio: rangoAnio;
	marca: string;
	modelo: string;
end;

listaM= ^nodoL;
	nodoL = record
		dato: auto;
		sig: listaM;
	end;

marca = record
	nombre: string;
	lista: listaM;
end;

arbol=^nodoA;
	nodoA = record
		dato: auto;
		hi: arbol;
		hd: arbol;
	end;

arbol2=^nodoA2;
	nodoA2 = record
		dato: marca;
		hi: arbol2;
		hd: arbol2;
	end;

procedure devolverModelo ( a: arbol ; p: integer);
begin
	if (a= nil) then
		writeln('EL AUTO CON DICHA PATENTE NO EXISTE')
	else
	if (p = a^.dato.patente) then
		writeln('EL MODELO QUE TIENE ESA PATENTE ES: ' , a^.dato.modelo)	
	else
	if (p < a^.dato.patente) then
		devolverModelo(a^.hi,p)
	else
		devolverModelo(a^.hd,p)
end;


function devolverCant2(a:arbol2 ; m: string):integer;

			function contarEnLista(l: listaM): integer;
				var
				cant: integer;
				begin
						cant:= 0;
						while (l<> nil) do begin
							cant:= cant + 1;
							l:= l^.sig;	
						end;
						contarEnLista:= cant;
				end;
begin
		if (a=nil) then
			devolverCant2:= 0
		else
		if (m = a^.dato.nombre) then
			devolverCant2:= 1 + contarEnLista(a^.dato.lista)
		else
			devolverCant2:= devolverCant2(a^.hi,m) + devolverCant2(a^.hd,m)
end;


function devolverCant(a:arbol ; m: string):integer;
begin
		if (a=nil) then
			devolverCant:= 0
		else
		if (m = a^.dato.marca) then
			devolverCant:= 1 + devolverCant(a^.hi,m) + devolverCant(a^.hd,m)
		else
			devolverCant:= devolverCant(a^.hi,m) + devolverCant(a^.hd,m)
end;

procedure agregarAdelante(var l: listaM ; au: auto);
var
nue: listaM;
begin
		new(nue);
		nue^.dato:= au;
		nue^.sig:= l;
		l:= nue;
end;

procedure cargarArbol2(var a: arbol2 ; m: marca ; au: auto);
begin
		if (a=nil) then begin
			new(a);
			a^.dato.nombre:= m.nombre;
			a^.dato.lista:= nil;
			agregarAdelante(a^.dato.lista,au);
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else
		if (m.nombre = a^.dato.nombre) then
			agregarAdelante(a^.dato.lista,au)
		else
		if (m.nombre < a^.dato.nombre) then
			cargarArbol2(a^.hi,m,au)
		else
			cargarArbol2(a^.hd,m,au)
end;


procedure cargarArbol(var a: arbol ; au: auto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= au;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
	if (au.patente < a^.dato.patente) then
			cargarArbol(a^.hi,au)
	else
			cargarArbol(a^.hd,au)
end;
	
procedure leerAuto(var a: auto);
begin
	writeln('INGRESE MARCA');
	readln (a.marca);
	if (a.marca <> 'MMM') then begin
		a.patente := random(1000) + 1;
		a.anio := random (2018 - 2010) + 2010;
		writeln('INGRESE MODELO');
		readln (a.modelo);
	end;		
end;

procedure cargarDatos (var a: arbol ; var a2: arbol2);
var
au: auto;
m: marca;
begin
	leerAuto(au);
	while (au.marca <> 'MMM') do begin
			cargarArbol(a,au);
			m.nombre:= au.marca;
			cargarArbol2(a2,m,au);
			leerAuto(au);
		end;
end;


var
a: arbol;
a2: arbol2;
mar: string;
pat: integer;

begin
randomize;
{INCISO A}
cargarDatos(a,a2);
{INCISO B}
writeln('INGRESE MARCA A BUSCAR');
readln(mar);
writeln('CANT DE AUTOS EN ARBOL 1 DE MARCA INGRESADA ES: ', devolverCant(a,mar) );
{INCISO C}
writeln;
writeln('INGRESE MARCA A BUSCAR');
readln(mar);
writeln('CANT DE AUTOS EN ARBOL 2 DE MARCA INGRESADA ES: ', devolverCant2(a2,mar) );
{INCISO D NO}
writeln;
{INCISO E}
writeln('INGRESE PATENTE A BUSCAR');
readln(pat);
devolverModelo(a,pat);
{INCISO F ES IGUAL AL E}
end.
