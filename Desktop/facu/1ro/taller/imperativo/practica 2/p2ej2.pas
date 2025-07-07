program ej2;
type
lista= ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
end;

function buscarValor(l: lista ; valor: integer): boolean;
begin
	if (l<> nil) then begin
		if (l^.dato = valor) then
			buscarValor:= true
		 else
			buscarValor:= buscarValor(l^.sig, valor);
		end
	else
	buscarValor:= false;
end;

{NO ANDA EL BUSCAR MINIMO}
function buscarMinimo(l:lista ; var min: integer):integer;
begin
	if (l <> nil) then begin
		if (l^.dato < min) then begin
			min:= l^.dato;
			buscarMinimo(l^.sig,min);
		end
		else
			buscarMinimo(l^.sig,min)
		end
	else
	buscarMinimo:= min;
end;

procedure imprimirInverso(l: lista);
begin
	if (l <> nil) then 
		imprimirInverso(l^.sig);
		writeln(l^.dato);
end;


procedure imprimirOrdenado(l: lista);
begin
	if (l <> nil) then 
		writeln(l^.dato);
		imprimirOrdenado(l^.sig);
end;


{procedure agregarAdelante( var l: lista ; num: integer);
var
nue: lista;
begin
	new(nue);
	nue^.dato := num;
	nue^.sig:= L;
	L:= nue;
end;}

procedure agregarAtras( var l,ult: lista ; num: integer);
var
nue: lista;
begin
	new(nue);
	nue^.dato:= num;
	nue^.sig:= nil;
	if( l = nil) then  begin
		l:= nue;
		ult:= nue;
	end
	else
		ult^.sig:= nue;
		ult:= nue;
end;


procedure cargarDatos( var l: lista) ;
var
num: integer;
ult: lista;
begin
	num:= 100 + random(200 - 100 + 1);
	if (num <> 100) then begin
		agregarAtras(l,ult,num);
		cargarDatos(l^.sig);
	end; 
end;


var
l:lista;
minimo,valor: integer;
begin
minimo:= 999;
cargarDatos(l);
writeln('Impresion Ordenada:');
imprimirOrdenado(l);
writeln;
writeln('Impresion Inversa:');
imprimirInverso(l);
minimo:= buscarMinimo(l,minimo);
writeln('El minimo valor de la lista es:', minimo);
writeln;
writeln('Ingrese valor a buscar en la lista');
readln(valor);
if (buscarValor(l,valor)) then 
	writeln('El valor SI esta en la lista')
	else
	writeln('El valor NO esta en la lista')
end.
