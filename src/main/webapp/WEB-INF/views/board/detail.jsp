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
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<body>
 		<h2 style="color: white">detail.jsp</h2>
 		

<div class="container mt-5" style="width:60%; height:auto; background-color: #f5f5f5; border-radius: 1rem;">
	<table class="table caption-top table-bordered">
  <caption> detail.jsp </caption>
  <thead class="table-dark">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">작성자</th>
      <th scope="col">비밀번호</th>
      <th scope="col">제목</th>
      <th scope="col">내용</th>
      <th scope="col">작성시간</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">${board.b_number}</th>
      <td>${board.b_writer}</td>
      <td>${board.b_password}</td>
      <td>${board.b_title}</td>
      <td>${board.b_contents}  </td>
      <td> ${board.b_date} </td>
      <td> ${board.b_hits} </td>
    </tr>
  </tbody>
</table>
<br>
	<div class="text-center">
	<div class="btn-group" role="group" aria-label="Basic mixed styles example">
	<c:choose>
	<c:when test="${sessionScope.loginId eq board.b_writer}">
  		<button type="button" class="btn btn-danger" onclick="location.href='/board/delete?b_number=${board.b_number}'"> 삭제 </button>
  		<button type="button" class="btn btn-warning" onclick="location.href='/board/update?b_number=${board.b_number}&page=${page}'"> 수정 </button>
  		<button type="button" class="btn btn-success" onclick="location.href='/'"> 메인화면 </button>
  		<button type="button" class="btn btn-primary" onclick="location.href='/board/paging?page=${page}'"> 글목록 </button>
  	</c:when>
	
	<c:when test="${sessionScope.loginId eq 'admin'}">
  		<button type="button" class="btn btn-danger" onclick="location.href='/board/delete?b_number=${board.b_number}'"> 삭제 </button>
  		<button type="button" class="btn btn-success" onclick="location.href='/'"> 메인화면 </button>
  		<button type="button" class="btn btn-primary" onclick="location.href='/board/paging?page=${page}'"> 글목록 </button>
  	</c:when>
  	
  	<c:otherwise>
   	<button type="button" class="btn btn-success" onclick="location.href='/'"> 메인화면 </button>
  	<button type="button" class="btn btn-primary" onclick="location.href='/board/paging?page=${page}'"> 글목록 </button>
  	</c:otherwise>
  	</c:choose>
  	
  	</div>
	</div>
		<!-- 파일가져오기 -->
	<div class="text-center">
		<img class="rounded mx-auto d-block mt-3" alt="" src="/resources/boardupload/${board.b_filename}" width="400" height="400"> <br>
      ${board.b_filename}
</div>
		<!-- 댓글작성 -->
	<div id="comment-write" class="input-group mb-3">
	<span class="input-group-text">작성자</span>
  	<input id="c_writer" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${sessionScope.loginId}" readonly>
	<br>
	<span class="input-group-text">댓글내용</span>
	<input id="c_contents" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
	</div>
	<div>
		<button id="comment-write-btn" class="mb-3 btn btn-info"> 댓글등록 </button>
	</div>

<!-- 		css 가져오기
	<link href="/resources/css/test.css" rel="stylesheet"> -->
	
	
	<!-- 댓글 목록 출력 -->	
	<div id="comment-list">
		<table class="table">
		<tr><th>댓글번호</th>
		<th>작성자</th>
		<th>내용</th>
		<th>작성시간</th></tr>
		<c:forEach items="${commentList}" var="comment">
		<tr>
		<td>${comment.c_number}</td>
		<td>${comment.c_writer}</td>
		<td>${comment.c_contents}</td>
		<td>${comment.c_date}</td> </tr>
		</c:forEach>
		</table>
	</div>
</div>
</body>

<script>

/* 	const commentBtn = document.getElementById("comment-write-btn");
	commentBtn.addEventListener("click", function() {
		console.log("댓글등록 버튼 클릭")
	}); */
	
	/* jquery */
 	$("#comment-write-btn").click(function(){
		console.log("댓글등록버튼 클릭");
		const c_writer = document.getElementById('c_writer').value;
		const c_contents = document.getElementById('c_contents').value;
		console.log(c_writer, c_contents);
		const boardNumber = '${board.b_number}';
		console.log(c_writer, c_contents, boardNumber);
		$.ajax({
			type: 'post', // 전송방식 (get, post, delete, put등)
			url : '/comment/save', // 요청주소 (컨트롤러로 요청하는 주소)
			data : {
				'c_writer': c_writer,
				'c_contents': c_contents,
				'b_number': boardNumber }, 	// 전송할 데이터 (자바스크립트 객체 'm_id'파라미터: id파라미터값 추가값이있으면 ,'ㅇㅇ':ㅇㅇ,)
			dataType: 'json', 				// 요청후 리턴받을 때의 데이터 형식
			success: function(result) {		 // 요청이 성공적으로 처리됐을 때 실행할 함수
				console.log(result);
				let output = "<table class='table'>";
				output += "<tr><th>댓글번호</th>";
				output += "<th>작성자</th>";
				output += "<th>내용</th>";
				output += "<th>작성시간</th></tr>";
				for(let i in result){
					output += "<tr>";
					output += "<td>"+result[i].c_number+"</td>";
					output += "<td>"+result[i].c_writer+"</td>";
					output += "<td>"+result[i].c_contents+"</td>";
					output += "<td>"+result[i].c_date+"</td>";
					output += "</tr>";
				}
				output += "</table>";
				// id가 comment-list인 div에 출력
				document.getElementById('comment-list').innerHTML = output;

				document.getElementById('c_contents').value='';
			},
			error: function() { //요청이 실패했을때 실행할 함수
				console.log('오타찾으셈')
			},
					
			});
	});
		/* ajax 문법을 이용하여 댓글 작성자, 작성내용을 comment/save 주소로 post방식으로 전송하는 코드를 작성 */
		/* CommentController도 하나 선언해서 여기서 보낸 데이터를 받는지 sysout으로 출력해봅시다.
		팁) data: {"c_writer": 작성자입력값, "c_contents" : 내용입력값}*/


</script>
</html>