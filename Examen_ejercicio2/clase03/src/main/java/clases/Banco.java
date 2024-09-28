/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

/**
 *
 * @author Vasques
 */

public class Banco {
    private String NombreBanco ;
    private String numeroCuenta ;
    private double Saldo ;

    public Banco(String NombreBanco, String numeroCuenta, double Saldo) {
        this.NombreBanco = NombreBanco;
        this.numeroCuenta = numeroCuenta;
        this.Saldo = Saldo;
    }

    public Banco() {
    }

    public String getNombreBanco() {
        return NombreBanco;
    }

    public void setNombreBanco(String NombreBanco) {
        this.NombreBanco = NombreBanco;
    }

    public String getNumeroCuenta() {
        return numeroCuenta;
    }

    public void setNumeroCuenta(String numeroCuenta) {
        this.numeroCuenta = numeroCuenta;
    }

    public double getSaldo() {
        return Saldo;
    }

    public void setSaldo(double Saldo) {
        this.Saldo = Saldo;
    }

   
     public void depositar (double Monto){
        this.Saldo += Monto;
                       
    }
    
    public void retirar (double Monto){
    
       this.Saldo-=Monto;
     
     
    }
   
   
   

    
    
}

