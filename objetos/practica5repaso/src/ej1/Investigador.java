
package ej1;

public class Investigador {
    private String nombreI;
    private int categoria;
    private String especialidad;
    private Subsidio [] subsidios;
    private int dimL;

    public Investigador(String nombreI, int categoria, String especialidad) {
        this.nombreI = nombreI;
        this.categoria = categoria;
        this.especialidad = especialidad;
    }

    public String getNombreI() {
        return nombreI;
    }

    public void setNombreI(String nombreI) {
        this.nombreI = nombreI;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }
    
    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void agregarSubsidio (Subsidio unSubsidio){
        if (getDimL() < 5){
            subsidios[getDimL() + 1] = unSubsidio;
            unSubsidio.setOtorgado(true);
            setDimL(getDimL() + 1);
        }
        else
            System.out.println("NO HAY MAS ESPACIO PARA SUBSIDIOS");
    }
    
      public double devolverMonto (){
        double total = 0;
        for (int i = 0 ; i < getDimL() ; i++)
            total += subsidios[i].getMonto();
        return total;
    }
}
