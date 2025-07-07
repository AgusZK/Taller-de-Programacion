package practica3.ej4;

public class ej4 {
    public static void main(String[] args) {
        Hotel hotel = new Hotel (20);
       
        hotel.setHabitacion(10, Cliente.leerCliente());
        hotel.setHabitacion(18, Cliente.leerCliente());
        hotel.setPrecio(3000);
        
        System.out.println(hotel.toString());
    }  
}
