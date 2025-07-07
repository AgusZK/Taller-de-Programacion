package practica1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ej4 {
    public static void main(String[] args){
     GeneradorAleatorio.iniciar();
     int [][] m = new int [8][4];
       
     System.out.println("INGRESE NUMERO DE PISO");
     int piso = Lector.leerInt();
     System.out.println("INGRESE NUMERO DE OFICINA");
     int ofi = Lector.leerInt();  
     
     while (piso != 9){
       m[piso - 1][ofi - 1] = m[piso - 1][ofi - 1] + 1; 
   
       System.out.println("INGRESE NUMERO DE PISO");
       piso = Lector.leerInt();
       System.out.println("INGRESE NUMERO DE OFICINA");
       ofi = Lector.leerInt(); 
      } 
     
     for (int i = 0; i < 8 ; i++)
         for (int j = 0 ; j < 4 ; j++)
          System.out.println("A LA OFICINA" + i+1 + "PISO " + j+1 + "FUERON: " + m[i][j]);
    
    }
}



