
<%@page import="java.util.List"%>
<%@page import="modelos.vo.Producto"%>
<%@page import="modelos.dao.ProductoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body> 
        <div class="container">
             <div class="card">
                        <div class="card-header">
                             <h1>Listar Producto</h1>
                        </div>
                    <div class="card-body"> 
                        <p>
                            <a href="productonuevo.jsp" class="btn btn-primary">Nuevo</a>
                        </p>
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Producto ID</th>
                                    <th>Nombre</th>
                                    <th>Precio</th>
                                    <th>Estado</th>
                                    <th>Familia</th>
                                    <th>Editar</th>
                                    <th>Estado</th>
                                </tr>
                             </thead>
                            <tbody>
                                <%
                                    ProductoDao dao = new ProductoDao();
                                    List<Producto> listaproducto = dao.Listar();
                                    for(Producto item: listaproducto)
                                    {
                                %>
                                <tr>
                                    <td><%=item.getProductoid()%></td>
                                    <td><%=item.getNombre()%></td>
                                    <td><%=item.getPrecio() %></td>
                                    <td><%=item.getEstado().getEstadodesc() %></td>
                                    <td><%=item.getFamiliapro().getFamiliadesc() %></td>
                                    <td> <a href="productoeditar.jsp?id=<%=item.getProductoid() %>" > Editar</a> </td>
                                    
                                <%
                                        if(item.getEstado().getEstadoid()==1)
                                        {
                                %>  
                                     <td> <a href="productostd.jsp?std=2&id=<%=item.getProductoid() %>">Dar de baja </a>  </td>
                                <%
                                        }
                                        else
                                        {
                                %>  
                                     <td> <a href="productostd.jsp?std=1&id=<%=item.getProductoid() %>"> Activar </a>  </td>
                                <%

                                        }
                                    
                                %>        
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>                    
                        </table>  
                    </div>   
                </div>
             </div>
    </body>
</html>

