package ej3;
import PaqueteLectura.GeneradorAleatorio;

public abstract class Recital {
    private String nombreBanda;
    private String [] temas;
    private final int dimF;
    private int dimL = 0;

    public Recital(String nombreBanda, int cant) {
        this.nombreBanda = nombreBanda;
        this.temas = new String [cant];
        this.dimF = cant;
        
        // INICIALIZO VECTOR
        for (int i = 0 ; i < dimF ; i++)
            temas[i] = GeneradorAleatorio.generarString(5);
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public String[] getTemas() {
        return temas;
    }

    public void setTemas(String[] temas) {
        this.temas = temas;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void agregarTema (String tema){
       if (getDimL() < getDimF()){
           temas[dimL] = tema;
           dimL++;
        }   
       else
            System.out.println("NO HAY MAS ESPACIO");
    }
    
    
    public String actuar (){
        String aux;
        aux = "";
        for (int i = 0 ; i < dimL ; i++){
            aux += "("+i+ ")"+ "Y AHORA TOCAREMOS: " + this.getTemas()[i] + "\n";
        }
        return aux;
    }
    
    public abstract double calcularCosto();
}
