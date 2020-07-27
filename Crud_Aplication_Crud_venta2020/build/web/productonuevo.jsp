<%@page import="modelos.dao.FamiliaproDao"%>
<%@page import="modelos.vo.Familiapro"%>
<%@page import="java.util.List"%>
<%@page import="modelos.vo.Estado"%>
<%@page import="modelos.dao.EstadoDao"%>
<%
    EstadoDao daoe = new EstadoDao();
    List<Estado> listae = daoe.Listar();
    
    FamiliaproDao daof = new FamiliaproDao();
    List<Familiapro> listaf = daof.Listar();
    
%>

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
                    <h1>Nuevo Producto</h1>
                </div>
                <div class="card-body">
                    <form id="frm" name="frm" action="productoInsert.jsp" method="post">
                        <p>
                            <label>Nombre producto</label>
                            <input required class="form-control" type="text" name="nombre" value>
                        </p>
                        <p>
                            <label>Precio</label>
                            <input required class="form-control" type="number" name="precio" value>
                        </p>
                        <p>
                            <label>Estado</label>
                            <select required class="form-control"  name="estadoid"  >
                                     <option value="">Seleccionar...</option>
                                <%
                                    for(Estado item: listae)
                                    {
                                %>
                                    <option value="<%= item.getEstadoid() %>" ><%= item.getEstadodesc() %></option>
                                <%
                                    }
                                %>    
                            </select>
                        </p>
                        <p>
                            <label>Familia</label>
                            <select required class="form-control"  name="familiaid" >
                                     <option value="">Seleccionar...</option>
                                <%
                                    for(Familiapro item: listaf)
                                    {
                                %>
                                    <option value="<%= item.getFamiliaid()%>" ><%= item.getFamiliadesc() %></option>
                                <%
                                    }
                                %>    
                            </select>
                        </p>
                        <p>
                            <input class="btn btn-primary" type="submit" value="Grabar">                                
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
