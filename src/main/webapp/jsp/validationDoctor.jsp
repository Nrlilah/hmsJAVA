<%@page import="javax.servlet.http.HttpServletResponse"%>
<%
    HttpServletResponse rd = (HttpServletResponse) pageContext.getResponse();
    
    Object uad = session.getAttribute("USERaccessLevel");
    if (uad == null || uad.equals("2")) {
        rd.sendRedirect("PatientAssignation.jsp");
    }
%>
