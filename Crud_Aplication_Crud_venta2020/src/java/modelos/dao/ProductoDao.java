
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.vo.Estado;
import modelos.vo.Familiapro;
import modelos.vo.Producto;


public class ProductoDao 
{
    
    BaseDatos db = new BaseDatos();
    PreparedStatement stmt;
    ResultSet rs;
    String sql;
    Producto obj;
    //
    EstadoDao daoestado = new EstadoDao();
    FamiliaproDao daofamiliapro = new FamiliaproDao();
    
    
    public List Listar()
    {
    List<Producto> lista = new ArrayList<>();
    
        try
        {
            db.Conectar();
            sql = "select * from producto";
            stmt = db.getConn().prepareStatement(sql);
            rs = db.EjecutarConsulta(stmt);
            while(rs.next())
            {   
               int productoid = rs.getInt("productoid");
               String nombre = rs.getString("nombre");
               int precio = rs.getInt("precio");     
               Estado estado = daoestado.Buscar(rs.getInt("estadoid"));
               Familiapro familiapro = daofamiliapro.Buscar(rs.getInt("familiaid"));
                  
                lista.add(new Producto(productoid, nombre, precio, estado, familiapro));
            }
            db.Cerrar();

        }
        catch(SQLException exe)
        {
            System.out.println(exe.getMessage());
        }

        return lista;
   }
    
    public Producto Buscar(int id)
    {
        try
        {
            db.Conectar();
            sql = "select * from producto where productoid = ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, id);
            rs = db.EjecutarConsulta(stmt);
            if(rs.next())
            {   
               int productoid = rs.getInt("productoid");
               String nombre = rs.getString("nombre");
               int precio = rs.getInt("precio");     
               Estado estado = daoestado.Buscar(rs.getInt("estadoid"));
               Familiapro familiapro = daofamiliapro.Buscar(rs.getInt("familiaid"));
          
               obj = new Producto(productoid, nombre, precio, estado, familiapro);
            }
            db.Cerrar();

        }
        catch(SQLException exe)
        {
            System.out.println(exe.getMessage());
        }

        return obj;
   }
    
    public void Insert(Producto obj)
    {
        try
        {
            db.Conectar();
            sql = "insert into producto (nombre, precio, estadoid, familiaid) values (?,?,?,?)";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setString(1, obj.getNombre());
            stmt.setInt(2, obj.getPrecio());
            stmt.setInt(3, obj.getEstado().getEstadoid());
            stmt.setInt(4, obj.getFamiliapro().getFamiliaid());
            db.EjecutarAccion(stmt);
          
            db.Cerrar();

        }
        catch(SQLException exe)
        {
            System.out.println(exe.getMessage());
        }
   }
    
    public void UpdateSTD(int std, int id)
    {
    
         try
        {
            db.Conectar();
            sql = "update producto set estadoid = ?  where productoid = ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1,std);
            stmt.setInt(2, id);
            db.EjecutarAccion(stmt);
          
            db.Cerrar();

        }
        catch(SQLException exe)
        {
            System.out.println(exe.getMessage());
        }
    }
    
    public void Update(Producto obj)
    {
    
         try
        {
            db.Conectar();
            sql = "update producto set nombre = ? , precio = ? where productoid = ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setString(1,obj.getNombre());
            stmt.setInt(2, obj.getPrecio());
            stmt.setInt(3, obj.getProductoid());
            db.EjecutarAccion(stmt);
          
            db.Cerrar();

        }
        catch(SQLException exe)
        {
            System.out.println(exe.getMessage());
        }
    }
}    
