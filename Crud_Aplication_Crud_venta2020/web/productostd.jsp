<%@page import="modelos.dao.ProductoDao"%>
<%
    
    int std = Integer.parseInt(request.getParameter("std"));
    int id = Integer.parseInt(request.getParameter("id"));
    

    ProductoDao dao = new ProductoDao();
    dao.UpdateSTD(std, id);
    
        
    response.sendRedirect("index.jsp");

%>