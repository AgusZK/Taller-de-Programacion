program practica0;

procedure imprimir (F,A,B: integer);
	var
	ale:integer;
	begin
		ale:= 0;
		while (ale <> F) do begin
			ale:= random (B - A) + 1;
			ale:= ale + A;
			writeln('El numero rolleado es:', ale);
		end;
	end;
	
procedure checkear (A,B:integer; var F: integer);
	begin
		randomize;
		if(B< A) then begin
			F:= random (A-B) + 1;
			F:= F + B;
			imprimir (F,B,A);
		end;
		else begin
			F:= random (A-B) + 1;
			F:= F + B;
			imprimir (F,A,B)
		end;
	end;



var
ale,i: integer;


begin
writeln('Ingrese limite inferior');
readln(A);
writeln('Ingrese limite superior');
readln(B);
checkear(A,B,F);
end.
