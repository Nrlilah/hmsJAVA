<%
    HttpServletResponse ra = (HttpServletResponse) pageContext.getResponse();
    
    Object uaa = session.getAttribute("USERaccessLevel");
    if (uaa == null || !uaa.equals("0")) {
        ra.sendRedirect("Login.jsp");
    }
%>
