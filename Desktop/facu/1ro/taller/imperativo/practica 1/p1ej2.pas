program EJ2;
const
dimF = 300;
type
oficina = record
	codigo: integer;
	dni: integer;
	expensa: integer;
end;

vector = array [1..dimF] of oficina;

procedure leerVenta(var ofi: oficina);
	begin
		writeln('ingrese codigo de identificacion');
		readln(ofi.codigo);
		writeln('ingrese su DNI');
		readln(ofi.dni);
		writeln('ingrese el valor de expensa');
		readln(ofi.expensa);
		end;

procedure cargarVector(var v: vector ; var dimL: integer ; var ofi: oficina);
	begin
	dimL:= 0;
	leerVenta(ofi);
	while (ofi.codigo <> -1) do begin
		dimL:= dimL + 1;
		v[dimL]:= ofi;
		leerVenta(ofi);
	end;
end;
		
procedure imprimirOficina (o:oficina);
	begin
		writeln('Codigo:', o.codigo);
		writeln('DNI:', o.dni);
		writeln('Expensas:', o.expensa);
	end;

procedure imprimirVector (v: vector; dimL: integer);
	var
	i: integer;
	begin
		for i:= 1 to dimL do begin
			imprimirOficina(v[i]);
		end;
	end;

procedure ordenarInsercion (var v: vector ; dimL: integer);
	var
	i,j: integer;
	act: oficina;
	begin
		for i:= 2 to dimL do begin
			act:= v[i];
			j:= i - 1;
			while (j>0) and (v[j].codigo > act.codigo) do begin
					v[j+1] := v[j];
					j:= j - 1;
				end;
			v[j+1]:= act;
		end;
	end;

procedure ordenarSeleccion (var v:vector ; dimL: integer);
	var
	i,j,pos: integer;
	item: oficina;
	begin
		for i:= 1 to dimL - 1 do begin
			pos:= i;
			for j:= i + 1 to dimL do begin
				if (v[j].codigo < v[pos].codigo) then begin
					pos:= j;
					item:= v[pos];
					v[pos]:= v[i];
					v[i]:= item;
				end;
			end;			
		end;
	end;


var
v: vector;
dimL: integer;
ofi: oficina;
begin
cargarVector(v,dimL,ofi);
writeln('Vector cargado:');
imprimirVector(v,dimL);
ordenarInsercion(v,dimL);
writeln('Vector ordenado por insercion:');
imprimirVector(v,dimL);
ordenarSeleccion (v,dimL);
writeln('Vector ordenado por seleccion:');
imprimirVector(v,dimL);
end.
