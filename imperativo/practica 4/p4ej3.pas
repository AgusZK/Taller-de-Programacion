program p4ej3;
type

ventas = record
	codigoV: integer;
	codigoP: integer;
	cantU: integer;
	precioU: real;
end;

producto = record
	codigo: integer;
	cantVentas: integer;
	monto: real;
end;

arbol=^nodoA;
	nodoA= record
	dato: producto;
	hi: arbol;
	hd: arbol;
end;

function devolverEntre (a:arbol ; min: integer ; max: integer): integer;
begin
	if (a=nil) then
		devolverEntre:= 0
	else
	if (min>a^.dato.codigo) and (a^.dato.codigo<max) then
		devolverEntre:= 1 + devolverEntre(a^.hi,min,max) + devolverEntre(a^.hd,min,max)
	else
		devolverEntre:= devolverEntre(a^.hi,min,max) + devolverEntre(a^.hd,min,max)
end;



function devolverMenor (a:arbol ; num: integer): integer;
begin
	if (a=nil) then
		devolverMenor:= 0
	else
	if (a^.dato.codigo < num) then
		devolverMenor:= 1 + devolverMenor(a^.hi,num) + devolverMenor(a^.hd,num)
	else
		devolverMenor:= devolverMenor(a^.hi,num)
end;

procedure actualizarMayor (p:producto ; var mayor: producto);
begin
	if (p.cantVentas > mayor.cantVentas) then
		mayor := p
end;

procedure devolverMayor (a: arbol ; var mayor: producto);
begin
	if (a <> nil) then begin
		actualizarMayor(a^.dato , mayor);
		devolverMayor(a^.hi, mayor);
		devolverMayor(a^.hd, mayor);
	end;
end;

procedure imprimirCampos (p: producto);
begin
	writeln('CODIGO DEL PRODUCTO: ' , p.codigo , ' CANTIDAD DE VENTAS: ' , p.cantVentas , ' MONTO TOTAL:' , p.monto:2:2);
end;

procedure imprimirArbol( a: arbol);
begin
	if(a<> nil) then begin
	imprimirArbol(a^.hi);
	imprimirCampos (a^.dato);
	imprimirArbol(a^.hd);
	end;
end;

procedure cargarArbol (var a: arbol; p:producto ; v: ventas);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:= p;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
	if (v.codigoP = a^.dato.codigo) then begin
		a^.dato.cantVentas:= a^.dato.cantVentas + 1;
		a^.dato.monto := a^.dato.monto + (v.cantU * v.precioU);
	end
	else
	if (p.codigo <= a^.dato.codigo) then
		cargarArbol(a^.hi,p,v)
	else
		cargarArbol(a^.hd,p,v);
end;


procedure leerProd (var p: producto ; var v: ventas);
begin
	writeln('Ingrese codigo de venta');
	readln(v.codigoV);
	if (v.codigoV <> -1) then begin
		v.codigoP:= random(50) + 1;
		v.cantU:= random(100) + 1;
		v.precioU:= random(2000) + 1;
		p.codigo:= random(50) + 1;
		p.cantVentas:= random(100) + 1;
		p.monto:= random(1000) + 1;
	end;
end;

procedure cargarDatos (var a: arbol);
var
p: producto;
v: ventas;
begin
	leerProd(p,v);
	while (v.codigoV <> -1) do begin
		cargarArbol(a,p,v);
		leerProd(p,v);	
	end;
end;

var
a: arbol;
mayor: producto;
num,limI,limS: integer;
begin
randomize;
{INCISO A}
cargarDatos(a);
{INCISO B}
imprimirArbol(a);
{INCISO C}
devolverMayor(a,mayor);
writeln('EL CODIGO CON MAYOR CANT DE UNIDADES VENDIDAS ES: ' , mayor.codigo);
{INCISO D}
writeln('INGRESE VALOR PARA BUSCAR DE AHI PARA ABAJO');
readln(num);
writeln('LA CANTIDAD DE CODIGOS MENORES A ' , num , ' SON: ', devolverMenor (a,num));
{INCISO E}
writeln('INGRESE LIMITE INFERIOR');
readln(limI);
writeln('INGRESE LIMITE SUPERIOR');
readln(limS);
writeln('CANT ENTRE ' , limI , ' Y ' , limS ,' ES:' , devolverEntre(a,limI,limS));
end.
