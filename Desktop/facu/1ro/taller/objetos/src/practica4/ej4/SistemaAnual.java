package practica4.ej4;

public class SistemaAnual extends Sistema {

    public SistemaAnual(Estacion estacion) {
        super(estacion);
    }
    
    public double calcularPromedio (int anio){
        double aux = 0;
        for (int i = 0 ; i < 12 ; i++ )
            aux += getEstacion().getTemperatura(i, anio);
        return aux/12;
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        for (int i = 0 ; i < getEstacion().getAnios() ; i++)
            aux += " - " +  getEstacion().getAnios() + i + " : " + calcularPromedio(getEstacion().getAnios()) + ":\\n";
        return aux;
    }
}
