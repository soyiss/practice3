<%@page import="java.text.DecimalFormat"%>
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
<h2 style="text-align:center">회원정보조회</h2>

<form style="display:flex;align-items:center;justify-content:center;text-align:center">
<table border ="1">
<tr>
<td>수강일</td>
<td>회원번호</td>
<td>회원명</td>
<td>강의명</td>
<td>강의장소</td>
<td>수강료</td>
<td>등급</td>
</tr>
<%
 request.setCharacterEncoding("UTF-8");


try{
	Connection conn = Util.getConnection();
	String sql ="select c.month,m.cno, m.cname,t.classname,c.area,t.classprice,m.grade from tbl_teacher t, tbl_member m, tbl_class c where t.tcode=c.tcode and m.cno=c.cno";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String month =rs.getString(1); //202203
		String date = month.substring(0,4)+"년"+month.substring(4,6)+"일";
		
		int num = rs.getInt(6);
		DecimalFormat formats = new DecimalFormat("￦ ###,###,###");
		String num1 = formats.format(num);
		
%>
		
		
		<tr>
		<td><%=date %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=num1 %></td>
		<td><%=rs.getString(7) %></td>
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