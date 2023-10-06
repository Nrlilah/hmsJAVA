<%@page import="javax.servlet.http.HttpServletResponse"%>
<%
    HttpServletResponse rn = (HttpServletResponse) pageContext.getResponse();
    
    Object userAccessLevel = session.getAttribute("USERaccessLevel");
    if (userAccessLevel == null || userAccessLevel.equals("1")) {
        rn.sendRedirect("Login.jsp");
    }
%>
