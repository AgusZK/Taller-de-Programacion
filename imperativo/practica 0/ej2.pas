program ej2;

type
vector = array [1..50] of integer;

procedure cargarVector(var v: vector; a,b: integer; var dimL: integer);
	var
	ale: integer;
	begin
	randomize;
	dimL:= 0;
	ale := random(B-A) + 1;
	ale := ale + B;
	while (ale <> 0) or (dimL <> 50) do begin
			dimL:= dimL + 1;
			v[dimL]:= ale;
			ale := random(B-A) + 1;
			ale := ale + B;
		end;
		writeln('se termino de cargar el vector');
	end;

procedure imprimirVector (v: vector; dimL:integer);
	var
	i: integer;
	begin
		for i:= 1 to dimL do begin
		writeln(v[i]);
		end;
	end;



var
v: vector;
diml,a,b: integer;
begin
writeln('ingrese lim inferior para generar numeros');
readln(a);
writeln('ingrese lim superior para generar numeros');
readln(b);
cargarVector(v,a,b,dimL);
imprimirVector(v,dimL);
end.
