<%@page import="modelos.vo.Familiapro"%>
<%@page import="modelos.vo.Estado"%>
<%@page import="modelos.dao.FamiliaproDao"%>
<%@page import="modelos.dao.EstadoDao"%>
<%@page import="modelos.dao.ProductoDao"%>
<%@page import="modelos.vo.Producto"%>

<%

    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    int precio = Integer.parseInt(request.getParameter("precio"));


 
    Producto obj = new Producto(id, nombre, precio,  null, null);
    ProductoDao dao = new ProductoDao();
    dao.Update(obj);
    
    response.sendRedirect("index.jsp");
%>
