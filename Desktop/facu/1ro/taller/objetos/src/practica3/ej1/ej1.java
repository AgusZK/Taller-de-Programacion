package practica3.ej1;
import PaqueteLectura.GeneradorAleatorio;
public class ej1 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Triangulo t = new Triangulo (GeneradorAleatorio.generarDouble(90) + 1 , 
                                    GeneradorAleatorio.generarDouble(90) + 1 ,
                                    GeneradorAleatorio.generarDouble(90) + 1,
                                    GeneradorAleatorio.generarString(5),
                                    GeneradorAleatorio.generarString(5));
        
        
        System.out.println("EL PERIMETRO DEL TRIANGULO ES: " + t.calcularPerimetro(t));
        System.out.println("EL AREA DEL TRIANGULO ES: " + t.calcularArea(t));
        
    }    
}
