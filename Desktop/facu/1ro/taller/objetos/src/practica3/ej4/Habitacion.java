package practica3.ej4;
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private int numero;
    private double costo;
    private Cliente cli;

    // INICIALIZO HABITACION
    public Habitacion (int num){
        this.numero = num;
        this.costo = GeneradorAleatorio.generarDouble(8000 - 2000) + 2000;
        this.cli = null;
    }
    

    public boolean estaOcupada (){
        return cli != null;
    }
    
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public Cliente getCli() {
        return cli;
    }

    // RECIBE CLI QUE LEE Y LO METE EN LA VI
    public void setCli(Cliente cli) {
        this.cli = cli;
    }
      
    @Override
    public String toString(){
        String ret = "";
        if (estaOcupada()){
           ret = "COSTO : " + getCosto() + "OCUPADA" + " PERSONA: " + getCli().toString();
        }
        else
           ret += "HABITACION VACIA";
        
        return ret;
    }
}
