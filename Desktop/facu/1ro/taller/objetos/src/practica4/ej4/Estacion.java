package practica4.ej4;


public class Estacion {
    private String nombre;
    private double latitud,longitud;
    private double [][] registro;
    private int anios, inicio;

    public Estacion(String nombre, double latitud, double longitud, int anios, int inicio) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        this.anios = anios;
        this.inicio = inicio;
        this.registro = new double [12][anios];
        
        for (int i = 0 ; i < anios ; i++)
            for (int j = 0 ; j < 12 ; j++)
                this.registro[j][i] = 99999;
        
    }

    public int getInicio() {
        return inicio;
    }

    public void setInicio(int inicio) {
        this.inicio = inicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public double[][] getRegistro() {
        return registro;
    }

    public void setRegistro(double[][] registro) {
        this.registro = registro;
    }

    public int getAnios() {
        return anios;
    }

    public void setAnios(int anios) {
        this.anios = anios;
    }

    public double getTemperatura (int mes , int anio){
       return registro[mes - 1][anio - inicio];
   } 
    
    public void setTemperatura (double temp , int mes , int anio){
       registro[mes - 1][anio - inicio] = temp;
   }
    
   public String getMayor(){
       double max = -1;
       String aux = null;
       for (int i = 0 ; i < anios ; i++){
           for (int j = 0 ; j < 12 ; j++){
               double temp = registro[j][i];
               if (temp > max)
                   max = temp;
                   aux = (j + 1) + " / " + (i + getInicio());
           }
        }
       return aux;
   }
   
    @Override
   public String toString(){
     String aux;
     aux = getNombre() + "(" + getLatitud() + getLongitud() + ")";
     return aux;
   }
}
   
   
