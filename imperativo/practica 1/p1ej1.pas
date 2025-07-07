program Clase1MI;
const dimF = 50;
type dias = 0..31;
     rango1 = 0..15;
     rango2 = 1..99;
     rango3 = 0..dimF;
     venta = record
        dia: dias;
		codigo: rango1;
		cantidad: rango2;
			 end;
	 vector = array [1..dimF] of venta;
	 elemento = record
	              codigoP: rango1;
	              cantTotal: integer;
	            end;
	 lista = ^nodo;
	 nodo = record
	          dato: elemento;
	          sig: lista;
	        end;
	        
	        
procedure Ordenar (var v: vector; dimL: rango3);
	var
	i: rango3;
	j: rango3;
	act: venta;
	begin
		for i:= 2 to dimL - 1 do begin
			act:= v[i];
			j:= i - 1;
			while(j>0) and( v[j.codigo] > act.codigo) do begin
					v[j+1] := v[j.codigo];
					j:= i - 1;
					end;
				v[j+ 1] := act;
		end;
	end;

  procedure LeerVenta (var v: venta);
  begin
    Randomize;
    write ('Dia: ');
    v.dia:= random(32);
    writeln (v.dia);
    if (v.dia <> 0)
    then begin
           write ('Codigo de producto: ');
           v.codigoP:= random(16) + 1;
           writeln (v.codigoP);
           write ('Ingrese cantidad (entre 1 y 99): ');
           readln (v.cantidad);           
         end;
  end;


procedure AlmacenarInformacion (var v: vector; var dimL: rango3; var venta: venta);
	begin
			dimL:= 0;
			LeerVenta(venta);
			while (venta.dia <> 0 ) do begin
				dimL:= dimL + 1;
				v[dimL]:= venta;		
				LeerVenta(venta);
			end;
	end;
  
procedure ImprimirVector (v: vector; dimL: rango3);
var
   i: integer;
begin
    for i:= 1 to dimL do begin
    writeln('Dia:', v[i.dia]);
    writeln('Codigo', v[i.codigo]);
    writeln('Cantidad', v[i.cantidad]);
end;

procedure Eliminar (var v: vector; var dimL: rango3; valorInferior, valorSuperior: rango1);
				var
				i: integer;
				ant: venta;
				act: venta;
				begin
							ant:=
							for i := 1 to dimL do begin
											if( valorInferior < v[i.codigo]) and (valorSuperior > v[i.codigo]) then begin
														
											end;
							end;
				end;

function BuscarPosicion (v: vector; dimL: rango3; elemABuscar: rango1): rango3;
  var pos: rango3;
  begin
    pos:= 1;
    while (pos <= dimL) and (elemABuscar > v[pos].codigoP) do
       pos:= pos + 1;
    if (pos > dimL) then BuscarPosicion:= 0
                    else BuscarPosicion:= pos;
  end;
  
  function BuscarPosicionDesde (v: vector; dimL, pos : integer; elemABuscar: rango1): rango3;
  begin
    while (pos <= dimL) and (elemABuscar >= v[pos].codigoP) do
       pos:= pos + 1;
    if (pos > dimL) then BuscarPosicionDesde:= dimL
                    else BuscarPosicionDesde:= pos - 1;
  end;

var posInferior, posSuperior, salto, i: rango3; 
Begin
  posInferior:= BuscarPosicion (v, dimL, valorInferior);
  if (posInferior <> 0)
  then begin
         posSuperior:= BuscarPosicionDesde (v, dimL, posInferior, valorSuperior);
         
         {Escribir el código correspondiente para hacer el corrimiento y disminuir la dimensión lógica}
         
       end;
end;

procedure GenerarLista (v: vector; dimL: rango3; var L: lista);

  procedure AgregarAtras (var L, ult: lista; elem: elemento);
  begin
    { Completar }
  end;
  
    
var i: rango3; ult: lista; e: elemento;
begin
  L:= nil; ult:= nil; i:= 1;
  while (i<= dimL) do
  begin
    e.codigoP:=  v[i].codigoP;
    e.cantTotal:= 0;
    while ((i<= dimL) and (e.codigoP =  v[i].codigoP)) do
    begin
      e.cantTotal:= e.cantTotal + v[i].cantidad;
      i:= i + 1;
    end;
    AgregarAtras (L, ult, e);
  end;
end; 

procedure ImprimirLista (L: lista);
begin
 { Completar }
end;

var v: vector;
    dimL: rango3;
    valorInferior, valorSuperior: rango1;
    L: lista;
    
Begin
  AlmacenarInformacion (v, dimL,venta);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       writeln ('--- Vector ingresado --->')
                       ImprimirVector (v, dimL);
                       writeln ('--- Vector ordenado --->');
                       Ordenar (v, dimL);
                       ImprimirVector (v, dimL);
                       write ('Ingrese valor inferior: ');
                       readln (valorInferior);
                       write ('Ingrese valor superior: ');
                       readln (valorSuperior);
                       Eliminar (v, dimL, valorInferior, valorSuperior);
                       if (dimL = 0) then writeln ('--- Vector sin elementos, luego de la eliminacion ---')
                                     else begin
                                            writeln;
                                            writeln ('--- Vector luego de la eliminacion --->');
                                            ImprimirVector (v, dimL);
                                            GenerarLista (v, dimL, L);
                                            if (L = nil) then writeln ('--- Lista sin elementos ---')
                                                         else begin
                                                                writeln;
                                                                writeln ('--- Lista obtenida --->');
                                                                writeln;
                                                                ImprimirLista (L);
                                                              end;
                                          end;}
                      end;
                       
end.
