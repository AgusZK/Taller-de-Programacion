program ej3;

type
listaEnteros = ^nodo;
	
nodo = record
dato: integer;
sig: listaEnteros;
end;

procedure agregarAlFinal(var L: listaEnteros; ale:integer);
	var
	nuevo,aux: listaEnteros;
	begin
		new(nuevo);
		nuevo^.dato := ale;
		nuevo^.sig := nil;
		if (L = nil) then l:= nuevo
		else begin
			aux:= L;
			while (aux^.sig <> nil) do begin
				aux:= aux^.sig;
			end;
			aux^.sig := nuevo;
		end;
	end;

procedure cargarLista(var l: listaEnteros);
	var
	ale: integer;
	begin
	Randomize;
	ale := random (150 - 100) + 1;
	ale := ale + 100;
	while ( ale <> 120) do begin
		agregarAlFinal(L, ale);
		ale := random (150 - 100) + 1;
		ale := ale + 100;
		end;
	end;
	
procedure imprimirLista(l:listaEnteros);
	begin
		while (l^.sig <> nil) do begin
			writeln('El entero guardado es :' , l^.dato);
			l:= l^.sig
			end;
		end;

procedure buscarElemento (l:listaEnteros ; X: integer);
	var
	check: boolean;
	begin
		check:= false;
	while (l<> nil) do begin
			if (l^.dato = X) then begin
				check:= true;
			end;
			l:= l^.sig;
		end;
			if (check = false) then begin
				writeln('El numero ingresado NO se encuentra en la lista');
			else begin
				writeln('El numero ingresado SI se encuentra en la lista');
			end;
		end;
	end;
	
// programa principal
var
l: listaEnteros;
X: integer;
begin
cargarLista(L);
imprimirLista(L);
writeln('ingrese un numero entre 100 y 150 para buscarlo, que no sea el 120');
readln(X);
buscarElemento(L,X);
end.
