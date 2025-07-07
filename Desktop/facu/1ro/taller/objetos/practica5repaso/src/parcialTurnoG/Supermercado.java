
package parcialTurnoG;

public class Supermercado {
    private String nombre;
    private String direccion;
    private final Producto [][] estanteria;
    private int dimLF;
    private int dimLC;
    private int [] vc;

    public Supermercado(String nombre, String direccion, int G , int E) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.dimLC = G;
        this.dimLF = E;
        
        // INICIALIZO ESTANTERIA
        this.estanteria = new Producto [G][E];
        for (int i = 0 ; i < G ; i++)
            for (int j = 0 ; j < E ; j++)
                estanteria[i][j] = null;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

     
    public void agregarProducto (int X, int Y, Producto p){
        if (this.estanteria[X][Y] == null)
            this.estanteria[X][Y] = p;
        else
            System.out.println("ESPACIO OCUPADO");                   
    }
    
    public String liberarEstantes (int X){
        String aux = "";
        for (int i = 0 ; i < dimLF ; i++)
            if (this.estanteria[i][X].getUnidades() == 0){
                aux += "PRODUCTO ELIMINADO: " + estanteria[i][X].toString() + "\n";
                this.estanteria[i][X] = null;
            }
        return aux;        
    }
    
    public int devolverMax (String M){
       int maxC = 0;
       int cant = 0;
       vc = new int [dimLC];
       for (int i = 0 ; i < dimLF ; i++){
           for (int j = 0 ; j < dimLC ; j++){
               if (this.estanteria[j][i] == null){
                   System.out.println("VACIO");
               }
               else
               if (this.estanteria[j][i].getMarca().equals(M))
                   cant++;
           }
           vc[i]= cant;
        }
       maxC = calcularMax(vc);
       return maxC;
    }
   
    public int calcularMax (int[] vc){
        int maxC = 0;
        int aux = 0;
        for (int i = 0 ; i < dimLC ; i++){
            if (vc[i] > aux)
                aux = vc[i];
                maxC = i;
        }        
        return maxC;
    }
    
    @Override
    public String toString(){
        String aux = "";
        for (int i = 0 ; i < dimLF ; i++){
            aux += "GONDOLA " + (i + 1) + ":" + "\n";
            for (int j = 0 ; j < dimLC ; j++) {
                if (this. estanteria[i][j] == null )
                aux += "ESTANTE " + (j + 1) + ":" + "\n";
                else
                aux += "ESTANTE " + (j + 1) + ":" + " PRODUCTO " + estanteria[i][j].toString() + "\n";   
            }
        }    
        return aux;
    }
}
