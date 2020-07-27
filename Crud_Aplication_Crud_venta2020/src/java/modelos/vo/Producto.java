
package modelos.vo;

public class Producto 
{
    private int productoid;
    private String nombre;
    private int precio;
    private Estado estado;
    private Familiapro familiapro;

    public Producto() 
    {
    }

    public Producto(int productoid, String nombre, int precio, Estado estado, Familiapro familiapro) 
    {
        this.productoid = productoid;
        this.nombre = nombre;
        this.precio = precio;
        this.estado = estado;
        this.familiapro = familiapro;
    }

    public int getProductoid() {
        return productoid;
    }

    public void setProductoid(int productoid) {
        this.productoid = productoid;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Familiapro getFamiliapro() {
        return familiapro;
    }

    public void setFamiliapro(Familiapro familiapro) {
        this.familiapro = familiapro;
    }
    
    
    
        
    
    
}
