package ej1;

public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private Investigador [] investigadores;
    private int dimL;

    public Proyecto(String nombre, int codigo, String director) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.director = director;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
   
    public void agregarInvestigador (Investigador unInvestigador){
        investigadores[getDimL() + 1] = unInvestigador;
        setDimL(getDimL() + 1);
    }
    
    public double dineroTotalOtorgado (){
        double total = 0;
        for (int i = 0 ; i < getDimL() ; i++)
            total += investigadores[i].devolverMonto();
        return total;
    }
    
    public void otorgarTodos (String nombreCompleto){
        
    }
}
