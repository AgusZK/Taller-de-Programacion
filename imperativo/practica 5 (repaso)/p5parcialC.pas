program parcialC;
type
videojuego = record
	codigoJ : integer;
	codigoC: integer;
	dia: integer;
	mes: integer;
end;

arbol=^nodoA;
	nodoA = record
		dato: videojuego;
		hi: arbol;
		hd: arbol;
end;

vector = array [1..12] of integer;


procedure imprimirVector(v: vector ; dimL: integer);
var
i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('CANT:' , v[i]);
	end;
end;

procedure ordenarVectorSel (var v: vector ; dimL: integer);
var
i,j,pos: integer;
item: integer;
begin
	for i:= 1 to diml - 1 do begin
		pos:= i;
		for j:= i + 1 to dimL do begin
			if (v[j] > v[pos]) then
				pos:= j;
				item:= v[pos];
				v[pos]:= v[i];
				v[i]:= item;
		end;
	end;
end;

{procedure ordenarVectorIns (var v: vector ; dimL: integer);
var
i,j: integer;
act: integer;
begin
	for i:= 2 to dimL do begin
		act:= v[i];
		j:= i - 1;
		while (j>0) and (v[j] < act) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= act;
	end;
end;}

procedure imprimirCampos ( v : videojuego);
begin
	writeln('CODIGO DE JUEGO : ' , v.codigoJ);
	writeln('DIA: ' , v.dia);
	writeln('MES: ' , v.mes);		
end;

procedure devolverCompras( a: arbol ; c: integer);
begin
	if (a <> nil) then
		if (c = a^.dato.codigoC) then begin
			writeln('COMPRA DEL CLIENTE GENERADO: ');		
			imprimirCampos(a^.dato);
			devolverCompras(a^.hi,c);
			devolverCompras(a^.hd,c);
		end
		else
		if (c < a^.dato.codigoC) then
			devolverCompras(a^.hi,c)
		else
			devolverCompras(a^.hd,c)
end;

function estaEnArbol(a: arbol ; c: integer):boolean;
begin
	if (a = nil) then
		estaEnArbol:= false
	else
	if ( c = a^.dato.codigoC) then
		estaEnArbol:= true
	else
	if (c < a^.dato.codigoC) then
		estaEnArbol:= estaEnArbol(a^.hi,c)
	else
		estaEnArbol:= estaEnArbol(a^.hd,c)
end;

procedure imprimir(a: arbol ; c : integer);
begin
	if (estaEnArbol(a,c)) then
		devolverCompras(a,c)
	else
		writeln('CLIENTE GENRADO NO ENCONTRADO');
end;


procedure cargarArbol ( var a: arbol ; v: videojuego);
begin
	if (a = nil) then begin
		new (a);
		a^.dato:= v;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
	if (v.codigoC < a^.dato.codigoC) then
		cargarArbol(a^.hi,v)
	else
		cargarArbol(a^.hd,v)
end;


procedure leerJuego ( var v: videojuego);
begin
	v.codigoC:= random(100);
	if (v.codigoC <> 0 ) then begin
		v.codigoJ:= random(1000) + 1;
		v.dia:= random(30) + 1;
		v.mes:= random(12) + 1;
	end;
end;


procedure inicializarVector( var v: vector);
var
i: integer;
begin
	for i:= 1 to 12 do begin
		v[i]:= 0;
	end;
end;

procedure cargarDatos (var a: arbol ; var vc: vector);
var
v: videojuego;
begin
	inicializarVector(vc);
	leerJuego(v);
	while (v.codigoC <> 0) do begin
		vc[v.mes] := vc[v.mes] + 1;
		cargarArbol(a,v);
		leerJuego(v);
	end;
end;

var
a: arbol;
v: vector;
cli: integer;
dimL: integer;
begin
randomize;
{INCISO A}
cargarDatos(a,v);
{INCISO B}
cli:= random(100) + 1;
imprimir(a,cli);
{INCISO C}
writeln;
dimL:= 12;
ordenarVectorSel(v,dimL);
imprimirVector(v,dimL);
{writeln;
ordenarVectorIns(v,dimL);
imprimirVector(v,dimL);}
end.
