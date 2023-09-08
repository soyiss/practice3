<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
request.setCharacterEncoding("UTF-8");
String empno = request.getParameter("empno");

try{

	Connection conn = Util.getConnection();
	String sql="select * from tbl_resv_202108 where empno=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,empno);
	
	ResultSet rs = pstmt.executeQuery();
	
	// empno값과 같은목록이 여러개 있든 하나만 있든 나는 있나 없나만 알면되니까 여기선 while을 써주지 않는다.
	if(rs.next()){
		%>
		<jsp:forward page="success.jsp"></jsp:forward>
		<%
	}else{
		%>
		<jsp:forward page="fail.jsp"></jsp:forward>
		<%
	}
	
}catch(Exception e){
	e.printStackTrace();
}




%>