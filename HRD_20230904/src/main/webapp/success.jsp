<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>success</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section style="position:fixed; top:70px;left:0px;width:100%;height:100%;background-color:lightyellow;">

<%
request.setCharacterEncoding("UTF-8");
String empno = request.getParameter("empno");

%>
<h2 style="text-align:center">사원번호:<%=empno %>님의 좌석예약조회</h2>

<form name="frm2" method="post" action="l_action.jsp" style="display:flex; align-items:center;justify-content:center;text-align:center">

<table border="1">

		
		<tr>
			<td>사원번호</td>
			<td>이름</td>
			<td>근무일자</td>
			<td>좌석번호</td>
			<td>좌석위치</td>
			<td>내선번호</td>
		</tr>
<%

request.setCharacterEncoding("UTF-8");

try{
	Connection conn = Util.getConnection();
	String sql="select e.empno, e.empname, r.resvdate, s.seatno, s.office, s.callno from tbl_emp_202108 e , tbl_seat_202108 s , tbl_resv_202108 r where e.empno = r.empno and s.seatno = r.seatno and e.empno =? order by s.seatno desc";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,empno);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String resvdate = rs.getString(3); //20210214 -> 2021년 02월 14일
		String date = resvdate.substring(0,4)+"년"+resvdate.substring(4,6)+"월"+resvdate.substring(6,8)+"일";
		
		
		%>
		<tr>
			
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=date %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
	</tr>
	
	<%
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>


</table>
</form>
<p style="text-align:center">
<input type="button" value="돌아가기" onclick="goList()"> 
</p>

</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>