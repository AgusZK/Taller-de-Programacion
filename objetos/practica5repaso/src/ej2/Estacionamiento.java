package ej2;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int apertura;
    private int cierre;
    private int dimLF;
    private int dimLC;
    private Autos [][] auto;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        
        this.auto = new Autos [5][10];
        dimLC = 5;
        dimLF = 10;
    }

    public Estacionamiento(String nombre, String direccion, int apertura, int cierre, int N , int M) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.apertura = apertura;
        this.cierre = cierre;
        
        this.auto = new Autos [N][M];
        dimLC = N;
        dimLF = M;
    }
    
    public void setEstacionamiento (Autos aut, int X , int Y){
        auto[X][Y] = aut;
    }
    
    public void setAuto(Autos aut, int X, int Y){
        auto[X][Y] = aut;
    }
    
    public String getPisoPlaza (String pat){
        int piso = 0,  plaza = 0;
        boolean encontre = false;
        while (piso < dimLF && !encontre){
            while (piso < dimLF && plaza < dimLC && !encontre){
                if (estaOcupada(piso,plaza) && auto[piso][plaza].getPatente().equals(pat))
                    encontre = true;
                else
                    plaza++;
            }
            if (!encontre) {
                piso++;
                plaza = 0;
            }
        }
        if (piso < dimLF)
           return "Piso: " + (piso + 1) + " Plaza: " + (plaza + 1);
        else
           return "Auto no encontrado";
    }
    
    public boolean estaOcupada (int piso , int plaza){
       return auto[piso][plaza] != null;
    }
    
    public int cantPlaza (int Y){
        int cant = 0;
        for (int i = 0 ; i < dimLF ; i++){
            if (estaOcupada(i,Y));
            cant++;
        }
        return cant;
    }
   
    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < dimLF; i++)
            for (int j = 0; j < dimLC; j++) {
                aux += "Piso " + (i + 1) + " Plaza " + (j + 1) + ": ";
                if (estaOcupada(i, j))
                    aux += auto[i][j].toString();
                else
                    aux += "Libre";
                aux += " ";
            }
        return aux;
    }
}
 


