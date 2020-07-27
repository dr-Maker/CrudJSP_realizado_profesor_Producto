<%@page import="modelos.vo.Producto"%>
<%@page import="modelos.dao.ProductoDao"%>
<%
    
   int id = Integer.parseInt(request.getParameter("id"));
   ProductoDao dao = new ProductoDao();
   Producto producto  = dao.Buscar(id);
%>    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Editar Producto</title>
    </head>
    <body>
      
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h1>Editar Producto</h1>
                    
                </div>
                <div class="card-body">
                    
                </div>
                <form action="productoupdate.jsp" method="post">
                    <p>
                        <label>Nombre</label>
                        <input required class="form-control" type="text" name="nombre" value="<%= producto.getNombre() %>">
                    </p>
                    
                    <p>
                        <label>Precio</label>
                        <input required class="form-control" type="text" name="precio" value="<%= producto.getPrecio() %>">
                    </p>
                    <p>
                        <label>Estado</label>
                        <input readonly  class="form-control" type="text" name="precio" value="<%= producto.getEstado().getEstadodesc() %>">
                    </p>
                    <p>
                        <label>Familia Producto</label>
                        <input  readonly  class="form-control" type="text" name="precio" value="<%= producto.getFamiliapro().getFamiliadesc() %>">
                    </p>
                    
                    <p>
                        
                        <input type="hidden" name="id" value="<%= producto.getProductoid()%>" >
                        <input class="btn btn-warning" type="submit" value="Grabar">
                    </p>
                    
                </form>      
            </div>
        </div>
        
        
    </body>
</html>
