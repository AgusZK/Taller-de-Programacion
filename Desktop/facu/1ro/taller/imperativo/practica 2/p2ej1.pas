{1.- Implementar un programa que invoque a los siguientes m�dulos.
a. Un modulo recursivo que retorne un vector de a lo sumo 15 n�meros enteros �random� mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con 
el valor 20.
b. Un modulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un modulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un modulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores pares contenidos en el vector.
e. Un modulo recursivo que reciba el vector generado en a) y devuelva el m�ximo valor del vector.
f. Un modulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario.
g. Un modulo que reciba el vector generado en a) e imprima, para cada n�mero contenido en el vector, sus d�gitos en el orden en que aparecen en el n�mero. 
Debe implementarse un modulo recursivo que reciba el n�mero e imprima lo pedido. Ejemplo si se lee el valor 142, se debe imprimir 1  4  2
}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     
procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
	 write(' EMPEZAR A IMPRIMIR VECTOR NORMAL');
	 writeln;
	 writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; i: integer ; dimL: integer);
begin    
		if (dimL > 0) then begin
			writeln(v[i]);
			ImprimirVectorRecursivo(v,i + 1, dimL - 1);
		end;
end; 
 

 
 function SumarRecursivo (v: vector; dimL: integer): integer;
	begin
		if (dimL > 0) then begin
			if (( v[dimL] MOD 2) = 0 ) then 
				SumarRecursivo:= v[dimL] + SumarRecursivo(v, dimL-1)
			else
			SumarRecursivo:= SumarRecursivo(v,dimL - 1);
		end;
	end;


function  ObtenerMaximo (v: vector ; dimL: integer): integer;
var
aux: integer;
begin
	if (dimL > 0) then begin
		aux:= v[dimL];
		if (aux > v[dimL-1]) then
			ObtenerMaximo:= aux
		else
		ObtenerMaximo(v,dimL - 1)
	end; 
	ObtenerMaximo:= aux;
end;

     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;
begin
	if (dimL > 0) then begin
		if (v[dimL] = valor) then
			BuscarValor:= true
		 else
			BuscarValor:= BuscarValor(v,dimL - 1, valor);
		end
	else
	BuscarValor:= false;
end;

{OTRA FORMA
* function  BuscarValor (v: vector; dimL, valor: integer ; var aux: boolean): boolean;
begin
	if (dimL > 0) then begin
		if (v[dimL] = valor) then
			BuscarValor:= aux
		 else
            BuscarValor(v,dimL - 1, valor,aux);
		 end
	BuscarValor:= aux;
end;}


procedure imprimirIndividual (num:integer);
begin
	if (num>10) then begin
		imprimirIndividual(num DIV 10);		
	end;
	writeln(num MOD 10);
end;

procedure ImprimirDigitos (v: vector; dimL: integer);
begin
	if (dimL > 0) then begin
		if (v[dimL] > 10) then begin
			ImprimirDigitos(v,dimL-1);
            imprimirIndividual(v[dimL]);
        end;
	end;
end;

var 
	dimL, suma, maximo, valor,i: integer;
	v: vector;
    aux: boolean;
Begin 
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
  writeln;
  i:= 1;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                    ImprimirVector (v, dimL);
				    writeln('EMPEZAR A IMPRIMIR VECTOR RECURSIVO:');		   
					ImprimirVectorRecursivo (v, i,dimL);
					writeln;
					suma:= SumarRecursivo(v,dimL);
					writeln('Suma del vector de nros pares da:', suma);
					writeln;
					maximo:= ObtenerMaximo(v,dimL);
					writeln('El maximo del vector es:', maximo);
					writeln;
					writeln('Ingrese valor a buscar');
					readln(valor);
					aux:= false;
					if (BuscarValor(v,dimL,valor)) then 
						writeln('El valor SI esta en el vector')
						else
						writeln('El valor NO esta en el vector')
					end;
					writeln;
					writeln('Digitos impresos del vector:');
					ImprimirDigitos (v, dimL);
end.
