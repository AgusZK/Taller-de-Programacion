package practica4.ej4;

public class SistemaMensual extends Sistema {

    public SistemaMensual(Estacion estacion) {
        super(estacion);
    }
    
    public double calcularPromedio (int mes){
        double aux = 0;
        for (int i = 0 ; i < getEstacion().getAnios() ; i++ )
            aux += getEstacion().getTemperatura(mes,getEstacion().getAnios() + 1);
        return aux/getEstacion().getAnios();
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        aux += "Enero: " + calcularPromedio(1) + "°C\\n";
        aux += "Febrero: " + calcularPromedio(2) + "°C\\n";     
        aux += "Marzo: " + calcularPromedio(3) + "°C\\n";
        aux += "Abril: " + calcularPromedio(4) + "°C\\n";
        aux += "Mayo: " + calcularPromedio(5) + "°C\\n";
        aux += "Junio: " + calcularPromedio(6) + "°C\\n";
        aux += "Julio: " + calcularPromedio(7) + "°C\\n";
        aux += "Agosto: " + calcularPromedio(8) + "°C\\n";
        aux += "Septiembre: " + calcularPromedio(9) + "°C\\n";
        aux += "Octubre: " + calcularPromedio(10) + "°C\\n";
        aux += "Noviembre: " + calcularPromedio(11) + "°C\\n";
        aux += "Diciembre: " + calcularPromedio(12) + "°C\\n";
        return aux;
    }
}
