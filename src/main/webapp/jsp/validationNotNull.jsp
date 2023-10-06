<%@page import="javax.servlet.http.HttpServletResponse"%>
<%
    HttpServletResponse rnn = (HttpServletResponse) pageContext.getResponse();
    
    Object uann = session.getAttribute("USERaccessLevel");
    if (uann == null) {
        rnn.sendRedirect("Login.jsp");
    }
%>
