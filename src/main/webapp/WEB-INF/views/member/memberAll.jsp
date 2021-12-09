<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- JSTL(JSP Standard Tag Library) 사용  -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	function detailAjax(m_number) {
		console.log(m_number);
		const view = document.getElementById('detail-view');
		$.ajax({
			type: 'post',
			url:'detailAjax',
			data: {'m_number': m_number},
			dataType: 'json',
			success: function(result) { // 처리결과를 받는 부분
				console.log(result);
/* 				console.log(result.m_number);
				console.log(result.m_id); */
				
				let output = "<table class='table'>";
				output += "<tr><th>number</th> <th>id</th> <th>password</th> <th>name</th>";
				output += "<th>email</th> <th>phone</th> </tr>";
				output += "<tr>";
				output += "<td>"+result.m_number+"</td>";
				output += "<td>"+result.m_id+"</td>";
				output += "<td>"+result.m_password+"</td>";
				output += "<td>"+result.m_name+"</td>";
				output += "<td>"+result.m_email+"</td>";
				output += "<td>"+result.m_phone+"</td>";
				output += "</tr>";
				output += "</table>";
				
				view.innerHTML = output;
				
			},
			error: function() {
				console.log('오타찾으세요');
			}
		})
		
	}
</script>

</head>
<body>

		<h2> memberAll.jsp</h2>
	
    <table class="table table-dark table-hover">
            <tr>
                <th scope="col">번호</th>
                <th scope="col">ID</th>
                <th scope="col">Password</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Phone</th>
                <th scope="col">상세조회</th>
                <th scope="col">상세조회(ajax)</th>
                <th scope="col">삭제</th>
                 
            </tr>
                	<c:forEach items="${mList}" var="m">
                <tr>
                    <td>${m.m_number}</td>
                    <td>${m.m_id}</td>
                    <td>${m.m_password}</td>
                    <td>${m.m_name}</td>
					<td>${m.m_email}</td>
					<td>${m.m_phone}</td>
					<!-- detail 이라는 주소요청을 통해 회원 상세조회를 해봅시다. 상세조회 데이터는 detail.jsp에 출력 -->
					<td> <a href="/member/detail?m_number=${m.m_number}"> 조회 </a></td>
					
					<td> <button onclick="detailAjax('${m.m_number}')"> 조회(ajax)</button> </td>
					
					<td> <a href="/member/delete?m_number=${m.m_number}"> 삭제 </a></td>
				
				</tr>
				</c:forEach>
				<a href="/board/paging"> 이전화면으로 돌아가기 </a>
</table>

	<!-- ajax로 가져온 상세조회 결과를 여기에 보여줌 -->
	<div id="detail-view">
	
	</div>
</body>
</html>