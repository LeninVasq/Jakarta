/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

/**
 *
 * @author Vasques
 */
public class Cuenta {
    private String Nombre = "";
    private String Cuenta = "";
    private double saldo = 0;
    private String Tipointeres = "";

    public Cuenta() {
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getCuenta() {
        return Cuenta;
    }

    public void setCuenta(String Cuenta) {
        this.Cuenta = Cuenta;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public String getTipointeres() {
        return Tipointeres;
    }

    public void setTipointeres(String Tipointeres) {
        this.Tipointeres = Tipointeres;
    }
    
    
    
    public void AsignarNombre(String Nombre){
        this.Nombre = Nombre;
    }
    
    
    
     public void depositar (double monto){
        this.saldo += monto;
                       
    }
    
    public void retirar (double cantidad){
    
       this.saldo-=cantidad;
     
     
    }
    
    
    
    
}
