
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.vo.Estado;
import modelos.vo.Familiapro;


public class FamiliaproDao 
{
    
    BaseDatos db = new BaseDatos();
    PreparedStatement stmt;
    ResultSet rs;
    String sql;
    Familiapro obj;
    
    public List Listar()
    {
    List<Familiapro> lista = new ArrayList<>();
    
    try
    {
        db.Conectar();
        sql = "select * from familiapro";
        stmt = db.getConn().prepareStatement(sql);
        rs = db.EjecutarConsulta(stmt);
        while(rs.next())
        {   
            int familiaid = rs.getInt("familiaid");
            String familiadesc = rs.getString("familiadesc");
            lista.add(new Familiapro(familiaid, familiadesc));
        }
        db.Cerrar();
   
    }
    catch(SQLException exe)
    {
        System.out.println(exe.getMessage());
    }
     
    return lista;    
    }
    
    
    public Familiapro Buscar(int id)
    {
    
    try
    {
        db.Conectar();
        sql = "select * from familiapro where familiaid = ?";
        stmt = db.getConn().prepareStatement(sql);
        stmt.setInt(1, id);
        rs = db.EjecutarConsulta(stmt);
        if(rs.next())
        {   
            int familiaid = rs.getInt("familiaid");
            String familiadesc = rs.getString("familiadesc");
            obj = new Familiapro(familiaid, familiadesc);
  
        }
        db.Cerrar();
   
    }
    catch(SQLException exe)
    {
        System.out.println(exe.getMessage());
    }
     
    return obj;    
    }
    
    
}
