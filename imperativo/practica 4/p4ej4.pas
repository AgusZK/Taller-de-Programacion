program p4ej4;
type
prestamo3 = record
	isbn: integer;
	cant: integer;
end;
arbol3=^nodoA3;
	nodoA3= record
	dato: prestamo3;
	hi: arbol3;
	hd: arbol3;
	end;

prestamo = record
	isbn: integer;
	socio: integer;
	dia: integer;
	mes: integer;
	diasP: integer;
end;

arbol=^nodoA;
nodoA = record
	dato: prestamo;
	hi: arbol;
	hd: arbol;
end;

lista=^nodoL;
	nodoL= record
	dato: prestamo;
	sig: lista;
end;

prestamo2 = record
	isbn: integer;
	lista: lista;
end;

arbol2=^nodoA2;
nodoA2 = record
	dato: prestamo2;
	hi:arbol2;
	hd:arbol2;
end;


function devolverEntre (a:arbol ; min: integer ; max: integer):integer;
begin
	if (a= nil) then
		devolverEntre:= 0	
	else 
	if (min> a^.dato.isbn) and (a^.dato.isbn<max) then
		devolverEntre:= 1 + devolverEntre(a^.hi,min,max) + devolverEntre(a^.hd,min,max)
	else
		devolverEntre:= devolverEntre(a^.hi,min,max) + devolverEntre(a^.hd,min,max)
end;


procedure imprimirArbol3(a:arbol3);
	procedure imprimirCampos3 (p: prestamo3);
		begin
			writeln('ISBN: ', p.isbn);
			writeln('CANTIDAD: ', p.cant);		
		end;
begin
	if (a<> nil) then begin
		imprimirArbol3(a^.hi);
		imprimirCampos3(a^.dato);
		imprimirArbol3(a^.hd);
	end;
end;

// SE ME CARGAN SEPARADOS Y NO SE POR QUE
procedure cargarArbol3(var a: arbol3 ; p: prestamo3);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:= p;
		a^.dato.cant:= 1;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else 
	if (p.isbn = a^.dato.isbn) then 
		a^.dato.cant:= a^.dato.cant + 1
	else
	if (p.isbn < a^.dato.isbn) then
		cargarArbol3(a^.hi,p)
	else
		cargarArbol3(a^.hd,p)
end;


procedure recorrerYCargar(a: arbol ; var a3: arbol3);
var
p3: prestamo3;
begin
	if (a<>nil) then begin
		p3.isbn := a^.dato.isbn;
		cargarArbol3(a3,p3);
		recorrerYCargar(a^.hi, a3^.hi);
		recorrerYCargar(a^.hd, a3^.hd);
	end
end;


function devolverSocio2(a:arbol2 ; socio: integer):integer;

	function estaEnLista(l:lista ; socio: integer):boolean;
		begin
			while (l<>nil) do begin
				if (l^.dato.socio = socio) then
				estaEnLista:= true;
				l:= l^.sig;
			end;
		end;
begin
	if (a=nil) then 
		devolverSocio2:= 0
	else
	if (estaEnLista(a^.dato.lista,socio)) then
		devolverSocio2:= 1 + devolverSocio2(a^.hi,socio) + devolverSocio2(a^.hd,socio)
	else
		devolverSocio2:= devolverSocio2(a^.hi,socio) + devolverSocio2(a^.hd,socio)
			
end;


function devolverSocio(a:arbol ; socio: integer):integer;
begin
	if (a=nil) then 
		devolverSocio:= 0
	else
	if (a^.dato.socio = socio) then
		devolverSocio:= 1 + devolverSocio(a^.hi,socio) + devolverSocio(a^.hd,socio)
	else
		devolverSocio:= devolverSocio(a^.hi,socio) + devolverSocio(a^.hd,socio)
			
end;

procedure minISBN (a:arbol2 ; var min: integer);

	procedure actualizarMin(isbn: integer ; var min: integer);
	begin
		if (isbn < min) then
			min:= isbn
	end;
begin
	if (a <> nil) then begin
		actualizarMin(a^.dato.isbn, min);
		minISBN(a^.hi,min);
	end;
end;


procedure maxISBN (a:arbol ; var max: integer);

	procedure actualizarMax(p: prestamo ; var max: integer);
	begin
		if (p.isbn > max) then
			max:= p.isbn
	end;

begin
	if (a <> nil) then begin
		actualizarMax(a^.dato, max);
		maxISBN(a^.hd,max);
	end;
end;

	
procedure imprimirCampos (p: prestamo);
begin
	writeln('ISBN: ', p.isbn);
	writeln('SOCIO: ', p.socio);
	writeln('DIA: ', p.dia);
	writeln('MES: ', p.mes);
	writeln('DIAS PRESTADOS: ', p.diasP);	
end;


procedure imprimirArbol(a:arbol);
begin
	if (a<> nil) then begin
		imprimirArbol(a^.hi);
		imprimirCampos(a^.dato);
		imprimirArbol(a^.hd);
	end;
end;


procedure agregarAdelante (var l: lista ; p: prestamo);
var
nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l:= nue;
end;


procedure cargarArbol2(var a: arbol2 ; p: prestamo);
begin
	if (a=nil) then begin
		new(a);
		a^.dato.isbn:= p.isbn;
		agregarAdelante(a^.dato.lista, p);
		a^.hi:= nil;
		a^.hi:= nil;
	end
	else
	if (a^.dato.isbn = p.isbn) then
		agregarAdelante(a^.dato.lista, p)
	else
	if	(p.isbn < a^.dato.isbn) then
		cargarArbol2(a^.hi,p)
	else
		cargarArbol2(a^.hd,p)
end;


procedure cargarArbol(var a: arbol ; p:prestamo);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:= p;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else 
	if (p.isbn < a^.dato.isbn) then
		cargarArbol(a^.hi,p)
	else
		cargarArbol(a^.hd,p)
end;

procedure leerPrestamo ( var p: prestamo);
begin
	p.isbn:= random(100);
	p.socio:= random (1000) + 1;
	p.dia:= random (31) + 1;
	p.mes:= random(13) + 1;
	p.diasP:= random(100) + 1;
end;


procedure cargarDatos( var a:arbol ; var a2: arbol2);
var
p: prestamo;
begin
	leerPrestamo(p);
	while (p.isbn <> 0) do begin
		cargarArbol(a,p);
		cargarArbol2(a2,p);
		leerPrestamo(p);
	end
end;
		
var
a:arbol;
a2:arbol2;
a3: arbol3;
max,min,socio,isbn1,isbn2: integer;
begin
randomize;
{INCISO A i e ii}
cargarDatos(a,a2);
writeln('ARBOL 1: ');
imprimirArbol(a);
writeln;
{INCISO B y C}
max:= -1;
maxISBN(a,max);
min:= 9999;
minISBN(a2,min);
writeln('EL MAYOR ISBN DEL ARBOL 1 ES: ' , max , ' Y EL MENOR ISBN DEL ARBOL 2 ES: ' , min);
writeln;
{INCISO D}
writeln('INGRESE SOCIO A BUSCAR EN ARBOL 1');
readln(socio);
writeln('LA CANTIDAD DE PRESTAMOS REALIZADOS AL SOCIO ES: ', devolverSocio(a,socio));
writeln;
{INCISO E}
writeln('INGRESE SOCIO A BUSCAR EN ARBOL 2');
readln(socio);
writeln('LA CANTIDAD DE PRESTAMOS REALIZADOS AL SOCIO ES: ', devolverSocio2(a2,socio));
writeln;
{INCISO F y H (EL G ES IGUAL AL F PERO CON EL ARBOL 2)}
recorrerYCargar(a,a3);
writeln('ARBOL 3: ');
imprimirArbol3(a3);
writeln;
{INCISO I (EL J ES IGUAL AL I PERO CON EL ARBOL 2)}
writeln('INGRESE ISBN 1');
readln(isbn1);
writeln('INGRESE ISBN 2');
readln(isbn2);
writeln('LA CANTIDAD DE PRESTAMOS REALIZADOS ENTRE LOS 2 ISBN INLUIDOS SON: ', devolverEntre(a,isbn1-1,isbn2+1));
end.
