
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdk.nashorn.internal.runtime.arrays.ArrayLikeIterator;
import modelos.vo.Estado;


public class EstadoDao 
{
    
    BaseDatos db = new BaseDatos();
    PreparedStatement stmt;
    ResultSet rs;
    String sql;
    Estado obj;
    
    public List Listar()
    {
    List<Estado> lista = new ArrayList<>();
    
    try
    {
        db.Conectar();
        sql = "select * from estado";
        stmt = db.getConn().prepareStatement(sql);
        rs = db.EjecutarConsulta(stmt);
        while(rs.next())
        {   
            int estadoid = rs.getInt("estadoid");
            String estado = rs.getString("estadodesc");
            lista.add(new Estado(estadoid, estado));
        }
        db.Cerrar();
   
    }
    catch(SQLException exe)
    {
        System.out.println(exe.getMessage());
    }
     
    return lista;    
    }
    
    
    public Estado Buscar(int id)
    {
    
    try
    {
        db.Conectar();
        sql = "select * from estado where estadoid = ?";
        stmt = db.getConn().prepareStatement(sql);
        stmt.setInt(1, id);
        rs = db.EjecutarConsulta(stmt);
        if(rs.next())
        {   
            int estadoid = rs.getInt("estadoid");
            String estado = rs.getString("estadodesc");
            obj = new Estado(estadoid, estado);
  
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
