package practica3.ej5;
import PaqueteLectura.Lector;
public class ej5 {
    public static void main(String[] args) {
        System.out.println("INGRESE RADIO DEL CIRCULO");
        double radio = Lector.leerDouble();
        System.out.println("INGRESE RELLENO DEL CIRCULO");
        String relleno = Lector.leerString();
        System.out.println("INGRESE CONTORNO DEL CIRCULO");
        String linea = Lector.leerString();
        
        Circulo c = new Circulo (radio,relleno,linea);
        System.out.println("EL PERIMETRO DEL CIRCULO ES: " + c.calcularPerimetro());
        System.out.println("EL AREA DEL CIRCULO ES: " + c.calcularArea());
    }
    
}
