package ej3;
import PaqueteLectura.GeneradorAleatorio;

public class Gira extends Recital {
    private String nombreGira;
    private Fecha [] fechas;
    private int actual;
    private final int dimF;
    private int dimL = 0;

    public Gira(String nombreGira, int cantFechas, String nombreBanda, int cant) {
        super(nombreBanda, cant);
        this.nombreGira = nombreGira;
        this.fechas = new Fecha [cantFechas];
        this.dimF = cantFechas;
        this.actual = 0;
        
        for (int i = 0 ; i < cantFechas ; i++)
            fechas[i] = new Fecha(GeneradorAleatorio.generarString(5),
                                  GeneradorAleatorio.generarInt(30) + 1);
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fecha[] getFechas() {
        return fechas;
    }

    public void setFechas(Fecha[] fechas) {
        this.fechas = fechas;
    }

    public int getActual() {
        return actual;
    }

    public void setActual(int actual) {
        this.actual = actual;
    }
    
    public void agregarFecha (Fecha f){
        if (getDimL() < getDimF()){
            dimL++;
            fechas[dimL] = f;
        }
        else
            System.out.println("NO HAY ESPACIO PARA AGREGAR FECHA");
    }
    
    @Override
    public String actuar (){
        String aux;
        aux = " BUENAS NOCHES... " + fechas[actual].getCiudad() + "\n" + super.actuar();
        setActual(actual + 1);
        return aux;
    }
    
    @Override
    public double calcularCosto(){
        double aux;
        aux = 0;
        for (int i = 0 ; i < dimF ; i++)
            aux += 30000;
        return aux;
    }
}
