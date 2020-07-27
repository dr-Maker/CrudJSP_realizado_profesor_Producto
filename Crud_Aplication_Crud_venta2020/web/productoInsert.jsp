<%@page import="modelos.vo.Familiapro"%>
<%@page import="modelos.vo.Estado"%>
<%@page import="modelos.dao.FamiliaproDao"%>
<%@page import="modelos.dao.EstadoDao"%>
<%@page import="modelos.dao.ProductoDao"%>
<%@page import="modelos.vo.Producto"%>

<%
    EstadoDao daoe = new EstadoDao();
    FamiliaproDao daof = new FamiliaproDao();
    
    String nombre = request.getParameter("nombre");
    int precio = Integer.parseInt(request.getParameter("precio"));
    int estadoid = Integer.parseInt(request.getParameter("estadoid"));
   int familiaid = Integer.parseInt(request.getParameter("familiaid"));
            
    Estado estado = daoe.Buscar(estadoid);
    Familiapro familiapro = daof.Buscar(familiaid);
 
    Producto obj = new Producto(0, nombre, precio, estado, familiapro);
    ProductoDao dao = new ProductoDao();
    dao.Insert(obj);
    response.sendRedirect("index.jsp");
%>
