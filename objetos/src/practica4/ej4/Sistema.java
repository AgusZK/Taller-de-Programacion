package practica4.ej4;

public abstract class Sistema {
    private Estacion estacion;

    public Sistema(Estacion estacion) {
        this.estacion = estacion;
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }
    
    @Override
    public String toString(){
        return getEstacion().toString() + ":\\n";
    }
    
 
}
