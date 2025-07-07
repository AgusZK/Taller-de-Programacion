package ej2;

public class Autos {
    private String duenio;
    private String patente;

    public Autos(String duenio, String patente) {
        this.duenio = duenio;
        this.patente = patente;
    }

    public String getDuenio() {
        return duenio;
    }

    public void setDuenio(String duenio) {
        this.duenio = duenio;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    @Override
    public String toString(){
        return " Duenio: " + getDuenio() + " Patente: " + getPatente();
    }
}
