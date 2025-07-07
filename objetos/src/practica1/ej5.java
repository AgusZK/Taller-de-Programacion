package practica1;
import PaqueteLectura.Lector;

public class ej5 {
    public static void main(String[] args){
        int [][] m = new int [5][4];
        double [] p = new double [4];
        
        for (int i = 0 ; i < 5 ; i++){
            System.out.println("CLIENTE " + (i + 1));
            System.out.println("INGRESE ATENCION AL CLIENTE");
            m[i][0] = Lector.leerInt();
            System.out.println("INGRESE CALIDAD DE LA COMIDA");
            m[i][1] = Lector.leerInt();   
            System.out.println("INGRESE PRECIO");
            m[i][2] = Lector.leerInt(); 
            System.out.println("INGRESE AMBIENTE");
            m[i][3] = Lector.leerInt();
        }
        
        for (int i = 0 ; i < 5 ; i++){
            for (int j = 0 ; j < 4 ; j++){
                 p[i] = m[j][i];
            }
            p[i] = p[i] / 5;
            System.out.println("PROMEDIO DE LA CATEGORIA " + i + ":" + p[i] );
        }    
    }
}
