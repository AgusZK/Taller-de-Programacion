
package ej3;


public class Ocasional extends Recital {
    private String motivo;
    private String contratante;
    private int dia;

    public Ocasional(String motivo, String contratante, int dia, String nombreBanda, int cant) {
        super(nombreBanda, cant);
        this.motivo = motivo;
        this.contratante = contratante;
        this.dia = dia;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    
    @Override
    public String actuar (){
        if (getMotivo().equals("a beneficio"))
            return " RECUERDEN COLABORAR CON..." + getContratante() + super.actuar();
        if (getMotivo().equals("show de TV"))
            return " SALUDOS AMIGOS TELEVIDENTES" + "\n" + super.actuar();
        if (getMotivo().equals("show privado"))
            return " UN FELIZ CUMPLE PARA... " + getContratante() + super.actuar();
        else
            return " NO SE ENCONTRO MOTIVO VALIDO";
            
    }
    
    @Override
    public double calcularCosto (){
        if (getMotivo().equals("a beneficio"))
            return 0;
        if (getMotivo().equals("show de TV"))
            return 50000;
        if (getMotivo().equals("show privado"))
            return 150000;
        else
            return -1;
    }
}
