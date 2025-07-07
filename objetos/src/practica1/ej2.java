/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica1;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Agustin
 */
public class ej2 {
    public static void main(String[] args) {
		GeneradorAleatorio.iniciar();
		int [] v = new int[15];
		int prom = 0;
		int cant = 0;
		for (int i=0 ; i<15 ; i++){
			v[i] = 0;
		 }
		
		for (int i = 0; i < 15 ; i++) {
			v[i] = 1 + GeneradorAleatorio.generarInt(200);
			prom = prom + v[i];
		}
		prom = prom/15;
		System.out.println("EL PROMEDIO ES: " + prom);
                
		for (int i = 0; i< 15 ; i++){
			if (v[i] > prom)
				cant= cant + 1;
		}	
		System.out.println("LA CANTIDAD DE JUGADORES MAYORES AL PROMEDIO ES: " + cant);
    }
}