<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="./error.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
  <%
    int id = Integer.parseInt(request.getParameter("id"));

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "abcd1234");	
    
    String query = "delete from gongji where id=?";

    PreparedStatement pstmt = conn.prepareStatement(query);

    pstmt.setInt(1, id);

    pstmt.executeUpdate();

    pstmt.close();
    conn.close();
  %>
  <script>
    alert("삭제 완료");
    window.location.href = "viewAll.jsp";
  </script>
</head>

<body>
  
</body>

</html>