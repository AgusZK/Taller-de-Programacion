package practica3.ej3;


public class Estante {
    private int dimL = 0;
    private int dimF;
    private Libro[] libros;

    // CONSTRUCTOR PARA GENERAR EL ESTANTE 
    public Estante (int dimF){
        this.dimF = dimF;
        libros = new Libro [dimF];
    }
    
    // DEVUELVE CUANTOS LIBROS HAY METIDOS
    public int getCantLibros() {
        return dimL;
    }
    
    // DEVUELVE TRUE SI TODOS LOS SLOTS ESTAN OCUPADO
    public boolean estaLleno() {
        return dimL == dimF;
    }
    
    public void agregarAlEstante (Libro libro){
        if (estaLleno()){
            System.out.println("EL ESTANTE ESTA LLENO");
        }
        else{
            libros[dimL++] = libro;
        }
    }
    
    public Libro buscarLibro(String titulo){
        int i = 0;
        while ( i < dimL && !libros[i].getTitulo().equals(titulo)){
            i++;
        }
        // i = la pos en la que esta el libro con el titulo
        return libros[i];
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public Libro[] getLibros() {
        return libros;
    }

    public void setLibros(Libro[] libros) {
        this.libros = libros;
    }
}
