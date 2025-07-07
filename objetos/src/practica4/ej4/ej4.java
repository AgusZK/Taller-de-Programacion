package practica4.ej4;
import PaqueteLectura.GeneradorAleatorio;

public class ej4 {

    public static void main(String[] args) {
        Estacion lp = new Estacion ("La Plata" , -32.921 , -57.955, 3, 2021);
        Sistema sistAnual = new SistemaAnual (lp);
        
        for (int i = 0 ; i < lp.getAnios() ; i++)
            for (int j = 0 ; j < 12 ; j++)
                lp.setTemperatura(GeneradorAleatorio.generarDouble(30), j + 1, lp.getInicio() + i);
       
        
        System.out.println("LA MAYOR TEMPERATURA EN LA ESTACION DE LA PLATA FUE EN: " + lp.getMayor());
        System.out.println("PROMEDIOS ANUALES: " + sistAnual.toString());
        
        Estacion mdp = new Estacion ("Mar del Plata", -38.002, -57.556, 4 , 2020);
        Sistema sistMensual = new SistemaMensual(mdp);
        
        for (int i = 0; i < mdp.getAnios(); i++)
             for (int j = 0; j < 12; j++) {
               mdp.setTemperatura(GeneradorAleatorio.generarDouble(40), j + 1, mdp.getInicio() + i);
	  }
        
        System.out.println("LA MAYOR TEMP EN LA ESTACION DE MAR DEL PLATA FUE EN: " + mdp.getMayor());
        System.out.println("PROMEDIOS MENSUALES: " + sistMensual.toString());
    } 
}
