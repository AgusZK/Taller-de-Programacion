
package parcialTurnoG;

public class Producto {
    private int codigo;
    private String nombre;
    private String marca;
    private int unidades;
    private double precio;

    public Producto(int codigo, String nombre, String marca, int unidades, double precio) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.marca = marca;
        this.unidades = unidades;
        this.precio = precio;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getMarca() {
        return marca;
    }

    public int getUnidades() {
        return unidades;
    }


    public double getPrecio() {
        return precio;
    }

    @Override
    public String toString(){
        String aux;
        aux = "{" + getCodigo() + " "  + getNombre() + " " + getMarca() + " " + getUnidades() + " " + getPrecio() + "}"; 
        return aux;
    }
}
