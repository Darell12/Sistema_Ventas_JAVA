
package Modelo;

public class login {
    private String numero_docu;
    private String nomb_usuario;

    private String pass;
    private String rol;

    public login() {
    }

    public login(String numero_docu, String nomb_usuario, String pass, String rol) {
        this.numero_docu = numero_docu;
        this.nomb_usuario = nomb_usuario;
        
        this.pass = pass;
        this.rol = rol;
    }


    public String getNumDocu() {
        return numero_docu;
    }

    public void setNumDocu(String numero_docu) {
        this.numero_docu = numero_docu;
    }

    public String getNombre() {
        return nomb_usuario;
    }

    public void setNombre(String nomb_usuario) {
        this.nomb_usuario = nomb_usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }


    
}
