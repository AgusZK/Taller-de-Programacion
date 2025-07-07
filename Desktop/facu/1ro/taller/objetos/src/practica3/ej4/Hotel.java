package practica3.ej4;
public class Hotel {
    private int dimL;
    private Habitacion [] hotel;

    
    public Hotel (int cant){
        this.dimL = cant;
        // CREO HOTEL
        this.hotel = new Habitacion [dimL];
        // LO LLENO CON HABITACIONES VACIAS
        for (int i = 0 ; i < dimL ; i++)
        this.hotel[i] = new Habitacion(i + 1);
    }
    
    public void setHabitacion (int num , Cliente cli){
        // LE PASO EL CLIENTE A LA HABITACION[I]
        hotel[num - 1].setCli(cli);
    }
    
    public void setPrecio (double monto){
        for (int i = 0 ; i < dimL ; i++){
            Habitacion h = hotel[i];
            // SETEO EL PRECIO AGARRANDO EL COSTO Y LE SUMO MONTO QUE INGRESARON
            h.setCosto(h.getCosto() + monto);
        }
    }
    
    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public Habitacion[] getHotel() {
        return hotel;
    }

    @Override
    public String toString(){
        String ret = "";
        
        for (int i = 0; i < dimL ; i++){
            ret += hotel[i].toString();
        }
        
        return ret;
    }
}
