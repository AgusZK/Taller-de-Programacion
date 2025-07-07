program ej4;

type
listaEnteros = ^nodo;
	
nodo = record
dato: integer;
sig: listaEnteros;
end;


procedure insertarOrdenado(var l: listaEnteros ; ale:integer);
	var
	ant,act,nuevo: listaEnteros;
begin
	new(nuevo);
	nuevo^.dato:= ale;
	ant:= l;
	act:= l;
	while( act <> nil) and (nuevo^.dato > act^.dato) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant=act) then begin
		l:= nuevo;
	end;
	if (ant<>act) then begin
		ant^.sig := nuevo;
		nuevo^.sig := act;
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
		insertarOrdenado(L, ale);
		ale := random (150 - 100) + 1;
		ale := ale + 100;
		end;
	end;
	
procedure imprimirLista(l:listaEnteros);
	begin
		while (l <> nil) do begin
			writeln('El entero guardado es :' , l^.dato);
			l:= l^.sig
			end;
		end;

procedure buscarElementoOrdenado (l:listaEnteros ; X: integer);
	var
	check: boolean;
	begin
		check:= false;
	while (l<> nil) and (l^.dato < X) do begin
			if (l^.dato = X) then begin
				check:= true;
			end;
			l:= l^.sig;
		end;
			if (check = false) then begin
				writeln('El numero ingresado NO se encuentra en la lista');
			end;
			if (check = true) then begin
				writeln('El numero ingresado SI se encuentra en la lista');
			end;
	end;


// programa principal
var
l: listaEnteros;
X: integer;
begin
cargarLista(L);
imprimirLista(L);
writeln('ingrese un numero entre 100 y 150 para buscarlo, que no sea el 120 porque no va a estar');
readln(X);
buscarElementoOrdenado(L,X);
end.
