package practica1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Agustin
 */
public class ej3 {
    public static void main (String [] args){
        GeneradorAleatorio.iniciar();
        int [][] m = new int [5][5];
        int [] v = new int [5];
        int suma = 0;
        
        // INCIALIZO VECTOR
        for (int i = 0 ; i < 5 ; i++){
            v[i] = 0;
        }
        
        // CARGO MATRIZ
        for (int i = 0 ; i < 5 ; i++){
            for (int j = 0 ; j < 5 ; j++){
                m[i][j] = 1 + GeneradorAleatorio.generarInt(30);
                System.out.print("(" +i+ "," + +j+ ")" +  m[i][j] + "|");
                if (i == 1)
                    suma = suma + m[i][j];
            }
        }
        System.out.println("-");
        System.out.println("LA SUMA DE LOS ELEMENTOS DE LA FILA 1 ES: " + suma);
       
        // CARGO SUMA DE COLMUNAS
        for (int i = 0; i < 5; i++){
            for (int j = 0; j < 5; j++){
                v[i] += m[j][i];
            }
        }
        // INFORMO SUMA DE COLUMNAS
        for (int i = 0 ; i < 5 ; i++){
            System.out.println("SUMA DE COLUMNA " + i + ":" + v[i]);
        }
        
        System.out.println("INGRESE NUMERO ENTERO A BUSCAR"); 
        int num = Lector.leerInt();
        boolean encontre = false;
        
        for (int i = 0 ; i < 5 ; i++){
            for (int j = 0 ; j < 5 ; j++){
                if (m[i][j] == num){
                    encontre = true;
                    System.out.println("EL VALOR ESTA EN LA POS: " + i + "," + j );
                }
                else
                    encontre = false;
            }
        }
        if (encontre == false)
            System.out.println("NO SE ENCONTRO EL ELEMENTO");
        
    }
}
