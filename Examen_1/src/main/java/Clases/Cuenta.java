    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author Vasquez
 */
public class Cuenta {
    private String Nombre;
    private String Cuenta;
    private double saldo;
    private double TipoInteres;

    public Cuenta() {
    }

    public Cuenta(String Nombre, String Cuenta,double TipoInteres, double saldo ) {
        this.Nombre = Nombre;
        this.Cuenta = Cuenta;
        this.saldo = saldo;
        this.TipoInteres = TipoInteres;
    }

    public Cuenta(String Nombre, String Cuenta) {
        this.Nombre = Nombre;
        this.Cuenta = Cuenta;
         this.saldo = 0.0;
        this.TipoInteres = 0.0;
    }

    public Cuenta(String Cuenta, double TipoInteres) {
        this.Cuenta = Cuenta;
        this.TipoInteres = TipoInteres;
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

    public double getTipoInteres() {
        return TipoInteres;
    }

    public void setTipoInteres(double TipoInteres) {
        this.TipoInteres = TipoInteres;
    }
    
    //metodos
    
    public void Estadodecuenta(){
        
    }
    
    public void depositos(double Monto){
        this.saldo += Monto;
    }
    
    public void retirar(double Monto) {
    this.saldo -= Monto;
    }

    
    public void asignarinteres(double interes){
        this.TipoInteres = interes;
    }
    public double obenerinteres(double inte){
      return inte;   
    }
    public double obenerinteresGanado( double dinero){
        return dinero;
    }
}
