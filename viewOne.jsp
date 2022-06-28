<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="./error.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시물 상세 조회</title>
  <style>
    .container {
      max-width: 600px;
      margin:0 auto;
    }
    table {
      text-align: center;
    }
    td {
      border: 1px solid black;
    }
    .table-view {
      width: 600px;
      border-collapse: collapse;
    }
    .table-view td {
      height: 30px;
      border: 1px solid grey;
    }
    td.title {
      border-right: 3px double grey;
      background-color: lightgrey;
    }
    .align-left {
      text-align: right;
    }
    a {
      color: black;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    #content {
      height: 200px;
    }
    div.div-button {
      text-align: right;
    }
  </style>
  <%
    int id = Integer.parseInt(request.getParameter("id"));
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "abcd1234");	
    
    String query = "select * from gongji where id=?";

    PreparedStatement pstmt = conn.prepareStatement(query);
    
    pstmt.setInt(1, id);

    ResultSet rset = pstmt.executeQuery();
    rset.next();
  %>
</head>

<body>
  
  <div class="container">
    <jsp:include page="banner.jsp"/>

    <h1>공지사항</h1>

    <table class="table-view">
      <tr>
        <td class="title"><b>번호</b></td>
        <td width="450px"><%= rset.getString("id")%></td>
      </tr>
      <tr>
        <td class="title"><b>제목</b></td>
        <td><%= rset.getString("title")%></td>
      </tr>
      <tr>
        <td class="title"><b>일자</b></td>
        <td><%= rset.getDate("date")%></td>
      </tr>
      <tr>
        <td class="title"><b>내용</b></td>
        <td id="content"><%= rset.getString("content")%></td>
      </tr>
    </table>

    <br>
    
    <div class="div-button">
      <input type="button" value="목록" onclick="location.href='viewAll.jsp'">
      <input type="button" value="수정" onclick="location.href='updateForm.jsp?id=<%= rset.getString("id")%>'">
    </div>
  </div>
  <%	
    rset.close();	
    pstmt.close();	
    conn.close();	
  %>
</body>

</html>