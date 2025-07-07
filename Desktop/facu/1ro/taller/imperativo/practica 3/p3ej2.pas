program ej2;
type

venta = record
	codigo: integer;
	fecha: record
		dia: integer;
		mes: integer;
		anio: integer;
	end;
	cantVentas: integer;
	end;
	
	lista =^nodolista;
	nodoLista = record
		dato: venta;
		sig: lista;
	end;
	
	
prod3= record
		codigo: integer;
		listaProd: lista;
	end;
	
venta2 = record
		codigo: integer;
		cantVentas: integer;
	end;
	
arbol3=^nodo3;
	nodo3= record
	dato: prod3;
	hi:arbol3;
	hd:arbol3
end;

arbol2 = ^nodo2;
	nodo2= record
	dato: venta2;
	hi: arbol2;
	hd: arbol2;
end;

arbol= ^nodo;
	nodo= record
	dato: venta;
	HI: arbol;
	HD: arbol;
end;

function buscarCodigo (a:arbol2; maxV: integer): integer;
begin
	if (a <> nil) then begin
		if (maxV > a^.dato.cantVentas) then
			buscarCodigo:= a^.dato.codigo
		else
			buscarCodigo:= buscarCodigo(a^.hi,maxV);
			buscarCodigo:= buscarCodigo(a^.hd,maxV);
	end
end;



procedure incisoC (a: arbol2);
var
maxCodigo: integer;
maxVentas: integer;
begin
	maxVentas:= 0;
	maxCodigo:= buscarCodigo(a,maxVentas);
	writeln('EL CODIGO CON MAS VENTAS ES EL CODIGO NUMERO:', maxCodigo);
end;


function checkearFecha(a: arbol ; v: venta):boolean;
begin
	if ((a^.dato.fecha.dia = v.fecha.dia) and (a^.dato.fecha.mes = v.fecha.mes) and (a^.dato.fecha.anio = v.fecha.anio)) then
		checkearFecha:= true
	else
		checkearFecha:= false
end;

procedure contarFecha (a: arbol ; v:venta ; var cant: integer);
begin
	if (a <> nil) then begin
		if (checkearFecha(a,v)) then
			cant:= cant + a^.dato.cantVentas
		else
			contarFecha(a^.hi,v,cant);	
			contarFecha(a^.hd,v,cant);			
	end;
end;

procedure incisoB( a: arbol ; v:venta);
var
cant: integer;
begin
	writeln('INGRESE DIA:');
	readln(v.fecha.dia);
	writeln('INGRESE MES:');
	readln(v.fecha.mes);
	writeln('INGRESE ANIO ENTRE 1950 Y 2024:');
	readln(v.fecha.anio);
	cant:= 0;
	contarFecha(a,v,cant);
	if (cant = 0) then writeln ('LA FECHA NO TIENE VENTAS O NO EXISTE') else writeln('LA FECHA TIENE ESTAS VENTAS:', cant)
end;


procedure imprimirCampos3(v:prod3);
var
l: lista;
begin
	l:= v.listaProd;
	while (l <> nil) do begin
		writeln('Codigo: ' , v.codigo);
		writeln('Fecha:', ' Dia:' , l^.dato.fecha.dia , ' Mes:' , l^.dato.fecha.mes , ' Anio:' , l^.dato.fecha.anio);	
		l:= l^.sig;
	end;
end;


procedure imprimirCampos2( v: venta2);
begin
	writeln('Codigo: ', v.codigo);
	writeln('Cantidad de Ventas: ', v.cantVentas);
	writeln;
end;

procedure imprimirCampos( v: venta);
begin
	writeln('Codigo: ', v.codigo);
	writeln('Fecha:', ' Dia:' , v.fecha.dia , ' Mes:' , v.fecha.mes , ' Anio:' , v.fecha.anio);
	writeln('Cantidad de Ventas: ', v.cantVentas);
	writeln;
end;


procedure imprimirArbol3 (a: arbol3);
begin
	if (a<> nil) then begin
		imprimirArbol3(a^.hi);
		imprimirCampos3(a^.dato);
		imprimirArbol3(a^.hd);
	end;
end;


procedure imprimirArbol2( a: arbol2);
begin
	if (a <> nil) then begin
		imprimirArbol2(a^.hi);
		imprimirCampos2(a^.dato);
		imprimirArbol2(a^.hd);
	end;
end;

procedure imprimirArbol1( a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol1(a^.hi);
		imprimirCampos(a^.dato);
		imprimirArbol1(a^.hd);
	end;
end;


procedure cargarVentaRandom(var v: venta);
begin
	v.codigo:= random(100);
	if(v.codigo <> 0) then begin
		v.fecha.dia:= random(31);
		v.fecha.mes:= random(13);
		v.fecha.anio:= 1950 + random(2024 - 1950 + 1);
		v.cantVentas:= random(100);	
	end;
end;

procedure agregarAdelante (v: venta ; var l: lista);
var
nue: lista;
begin
	new(nue);
	nue^.dato:= v;
	nue^.sig:= nil;
	l:= nue;
end;


procedure cargarArbol3 (var a: arbol3; v: venta ; v3: prod3 );
begin
	if (a = nil) then begin
		new (a);
		v3.codigo:= v.codigo;
		v3.listaProd:= nil;
		a^.dato:= v3;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
	if (v.codigo = a^.dato.codigo) then
		agregarAdelante(v,a^.dato.listaProd)
	else
	if (v.codigo < a^.dato.codigo) then
		cargarArbol3(a^.hi,v,v3)
	else
		cargarArbol3(a^.hd,v,v3)
end;


procedure cargarArbol2 (var a: arbol2 ; v: venta2);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= v;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
	if (v.codigo = a^.dato.codigo) then
		a^.dato.cantVentas:= a^.dato.cantVentas + v.cantVentas
	else
	if (v.codigo < a^.dato.codigo) then
		cargarArbol2(a^.hi , v)
	else
		cargarArbol2(a^.hd, v)
end;


procedure cargarArbol(var a: arbol ; v:venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= v;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
	if (v.codigo < a^.dato.codigo) then
		cargarArbol(a^.hi , v)
	else
	if 	(v.codigo >= a^.dato.codigo) then
		cargarArbol(a^.hd , v)		
end;

procedure cargarDatos (var a: arbol ; var v: venta ; var a2: arbol2 ; var v2: venta2 ; var a3: arbol3 ; var l: lista; var v3: prod3);
begin
	cargarVentaRandom(v);
	while (v.codigo <> 0) do begin
		cargarArbol(a,v);
		v2.codigo:= v.codigo;
		v2.cantVentas:= v.cantVentas;
		cargarArbol2(a2,v2);
		v3.codigo:= v.codigo;
		cargarArbol3(a3,v,v3);
		cargarVentaRandom(v);
	end;
end;

var
a:arbol;
a2: arbol2;
a3: arbol3;
v: venta;
v2:venta2;
v3: prod3;
l: lista;

begin
cargarDatos(a,v,a2,v2,a3,l,v3);
writeln('ARBOL 1 IMPRESO:');
imprimirArbol1(a);
writeln;
writeln('ARBOL 2 IMPRESO:');
imprimirArbol2(a2);
writeln;
writeln('ARBOL 3 IMPRESO:');
imprimirArbol3(a3);
writeln;
incisoB(a,v);
incisoC(a2);
end.
