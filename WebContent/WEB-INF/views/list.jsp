
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("n","\n"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>			<!--/g3/list로 썼더니 추가안되서 add로 바꿈 -->
	<form action="/g3/add" method="get">
		<table border=1 width=500>
			<tr>
				<td>이름</td><td><input type="text" name="name"></td>
				<td>비밀번호</td><td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
			<!-- <input type="text" name="a" value="add"> -->
						
		</table>
	</form>
	<br/>

	<c:forEach items="${list }" var="vo" >
	<table width="510" border="1">
			<tr>
				<td>${vo.no}</td>
				<td>${vo.name }</td>
				<td>${vo.regDate }</td>
				<td><a href="deleteform?no=${vo.no}">삭제</a></td>
			</tr>               <!-- 삭제누르면 해당 번호가 삭제되야하고 그 번호 페이지로 연결되야지 -->
			<tr>
				<td colspan=4>안녕하세요~<br/>${fn:replace(vo.content,n,'<br/>')}</td>
															
			</tr>
		</table>
        <br/>
	
	</c:forEach>


</body>
</html>