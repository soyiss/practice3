<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<section style="position:fixed; top:70px; left:0px; height:100%; width:100%; background-color:lightgray;">
<h2 style="text-align:center">강사매출현황</h2>

<form style="display:flex;align-items:center;justify-content:center;text-align:center">
<table border ="1">
<tr>
<td>강사코드</td>
<td>강의명</td>
<td>강사명</td>
<td>총매출</td>
</tr>
<%
 request.setCharacterEncoding("UTF-8");


try{
	Connection conn = Util.getConnection();
	String sql ="select * from tbl_teacher";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		
		
%>
		
		
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		</tr>
		
		
<%
	}
	
	
	
}catch(Exception e){
	e.printStackTrace();
}



%>
</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>