program ej4;
type
rangoRubro = 1..8;
producto = record
	codigo: integer;
	rubro: rangoRubro;
	precio: real;
end;

	lista = ^nodo;
	nodo = record
	dato: producto;
	sig: lista;
	end;

vector = array [rangoRubro] of lista;

vectorRubro = array [1..30] of producto;

procedure cargarRubro (var dimL: integer ; var vr: vectorRubro ; p: producto);
	begin
		vr[dimL] := p;
	end;
	

procedure ordenarVectorRubro ( var v: vectorRubro);
	var
	i,j: integer;
	act: producto;
	dimL: integer;
	begin
		dimL:= 30;
		for i:= 2 to dimL do begin
			act:= v[i];
			j:= 1 - 1;
			while (j>0) and (v[j].precio > act.precio) do begin
				v[j + 1] := v[j];
				j:= j - 1;
			end;
			v[j + 1] := act;
		end;
	end;

procedure imprimirPrecios( v: vectorRubro);
	var
	i: integer;
	begin
		for i:= 1 to 30 do begin
			writeln('precio de prod de rubro 3:' , v[i].precio);
		end;
	end;
	
procedure calcularPromedio (v: vectorRubro);
	var
	i: integer;
	prom: real;
	total: integer;
	begin
		prom:= 0;
		total:= 0;
		for i:= 1 to 30 do begin
			prom:= prom + v[i].precio;
			total:= total + 1
		end;
	writeln('El promedio de los precios de los prod de rubro 3 es:' , prom/total) 
	end;
	
//
procedure leerProducto (var prod: producto);
	begin
		writeln('inserte codigo de producto');
		readln(prod.codigo);
		writeln('inserte rubro (1 a 8)');
		readln(prod.rubro);
		writeln('inserte precio');
		readln(prod.precio);
	end;

procedure insertarOrdenado (var l: lista ; p : producto);
	var
	ant,act,nue: lista;
	begin
		new(nue);
		nue^.dato := p;
		act:= l;
		ant:= act;
		while ( act <> nil) and (nue^.dato.rubro > act^.dato.rubro) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (ant = act) then begin
			l:= nue;
		end;
		if (ant <> act) then begin
			ant^.sig := nue;
			nue^.sig:= act;
		end;
	end;

procedure inicializar (var v: vector);
	var
	i: integer;
	begin
		for i:= 1 to 8 do begin
			v[i] := nil;
		end;
	end;	

//PREGUNTAR PARA ACCEDER A VECTOR QUE TIENE LISTAS
procedure cargarDatos(var l:lista ; var v: vector ; var vr: vectorRubro);
	var
	p: producto;
	dimL: integer;
	begin
		dimL:= 0;
		inicializar(v);
		leerProducto(p);
		while (p.precio <> 0) do begin
			insertarOrdenado(v[p.rubro], p);
			dimL:= dimL + 1;
			if( p.codigo = 3) and (dimL < 31) then begin
				cargarRubro(dimL,vr,p);
			end;
			leerProducto(p);
		end;
	end;

var
l: lista;
v: vector;
vr: vectorRubro;
begin
cargarDatos(l,v,vr);
ordenarVectorRubro(vr);
imprimirPrecios(vr);
calcularPromedio(vr);
end.
