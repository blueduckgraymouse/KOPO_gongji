<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="./error.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시물 전체 조회</title>
  <style>
    .container {
      max-width: 600px;
      margin:0 auto;
    }
    table {
      text-align: center;
    }
    .table-view {
      width: 600px;
      border: 1px solid black;
      border-collapse: collapse;
    }
    .table-view td {
      height: 30px;
      border: 1px solid grey;
    }
    .title {
      background-color: lightgrey;
      border-bottom: 3px double black;
    }
    a {
      color: black;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    div.div-button {
      text-align: right;
    }
  </style>
  <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "abcd1234");	

    Statement stmt = conn.createStatement();

    String query = "select * from gongji;";
    ResultSet rset = stmt.executeQuery(query);
  %>
</head>

<body>
  <div class="container">
    <jsp:include page="banner.jsp"/>

    <h1>공지사항</h1>

    <table class="table-view">
      <tr class="title">
        <td width="50px"><b>번호</b></td>
        <td width="500px"><b>제목</b></td>
        <td width="100px"><b>등록일</b></td>
      </tr>
      <%
        while(rset.next()) {
          out.println("<tr>");											
            out.println("<td>" + rset.getInt("id") + "</td>");
            out.println("<td><a href='viewOne.jsp?id=" + rset.getString("id") + "'>" + rset.getString("title") + "</a></td>");
          out.println("<td>" + rset.getDate("date") + "</td>");
          out.println("</tr>");
        }
      %>
    </table>

    <br>

    <div class="div-button">
      <input type="button" value="신규" onclick="window.location='insertForm.jsp'">
    </div>
  </div>
  <%	
    rset.close();	
    stmt.close();	
    conn.close();	
  %>
</body>

</html>