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


<script>
	function logout() {
		location.href="/";
	}
</script>

<style>
table, th, tr, td {
	text-align : center;
}
</style>
</head>
<body>
<div class="container mt-5" style="width:100%; height:800px; background-color: #f5f5f5; border-radius: 3rem;">
		<h1 class="text-center mt-5">Member Board</h1>
		<form>
	<h4 class="text-end">${sessionScope.loginId} 님 환영합니다</h4>
	</form>
	
	<div class="d-flex flex-row-reverse bd-highlight">
  <div class="p-2 bd-highlight">
  <input class="btn btn-danger" onclick="logout()" value="LogOut">
  </div>
  <div class="p-2 bd-highlight">
   <form action="/member/mypage">
	<input type="hidden" name="m_number" value="${sessionScope.loginNumber}">
	<input type="submit" class="btn btn-warning" value="MyPage">
	</form>
  </div>
</div>
	<!-- 아래링크를 클릭하면 전체 회원목록을 조회하면 memberAll.jsp에 출력 -->
	<!-- 아이디가 admin 인 관리자가 로그인 했을 때만 목록 링크가 보이도록 -->
<div class="d-flex flex-row-reverse bd-highlight">
<div class="p-2 bd-highlight">
  	<c:if test="${sessionScope.loginId eq 'admin'}">
  	<button type="button" class="btn btn-success" onclick="location.href='/member/memberAll'">관리자전용 회원조회
  	</button>
	</c:if>
	</div>
</div>
		
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
    		<a class="navbar-brand">Board List</a>
   <form action="/board/search" method="get" class="d-flex">
		<select class="me-2" name="searchtype">
			<option value="b_title"> 제목 </option>
			<option value="b_writer"> 작성자 </option>
		</select>
        	<input class="me-1" type="search" name="keyword"placeholder="검색어.." aria-label="Search">
        	<button class="btn btn-warning" type="submit"> 검색 </button>
      </form> 
  </div>
</nav>

<!-- 		<h1 class="text-center">글목록</h1>
		
		<div class="d-flex justify-content-end">
		<form action="/board/search" method="get" class="d-flex">
		<select class="form-select" name="searchtype">
			<option value="b_title"> 제목 </option>
			<option value="b_writer"> 작성자 </option>
		</select>
        <input class="form-control me-2" type="search" placeholder="검색어.." aria-label="Search">
        <button class="btn btn-outline-success" type="submit">검색</button>
      </form>    
	</div>
	 -->
    <table class="table table-light table-hover text-center">
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">작성자</th>
                <th scope="col">제목</th>
                <th scope="col">내용</th>
                <th scope="col">작성시간</th>
                <th scope="col">조회수</th>   
            </tr>
                <c:forEach items="${bList}" var="b">
                <tr>
                    <td>${b.b_number}</td>
                    <td>${b.b_writer}</td>
                    <td><a href="detail?b_number=${b.b_number}&page=${paging.page}">${b.b_title}</a></td>
					<td>${b.b_contents}</td>
					<td>${b.b_date}</td>
					<td>${b.b_hits}</td>
				</tr>
				</c:forEach>
				
	</table>
	<nav aria-label="Page navigation example">
  <ul class="pagination pagination-lg justify-content-center">
    <li class="page-item">
     <c:choose>
			<c:when test="${paging.page<=1}">
			<a class="page-link" href="#" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
			</a>
			</c:when>
			<c:otherwise>
			<%-- 현재 페이지에서 1감소한 페이지 요청하는 링크 --%>
			<a class="page-link" href="/board/paging?page=${paging.page-1}" aria-label="Previous">
			 <span aria-hidden="true">&laquo;</span>
			</a>
			</c:otherwise>
		</c:choose>
    </li>
     <li class="page-item">
    		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
    		
			<c:choose>
			<%-- i값이 현재 페이지(page) 값과 같다면 i출력 --%>
				<c:when test="${i eq paging.page}">
			 <li class="page-item active" aria-current="page">	<a class="page-link" href="#">	${i}</a></li>
				</c:when>
				<c:otherwise>
		 <li class="page-item"><a class="page-link" href="paging?page=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
			<a class="page-link" href="#" aria-label="Next">
       		<span aria-hidden="true">&raquo;</span></a>
			</c:when>
			<c:otherwise>
		 <li class="page-item"><a class="page-link" href="/board/paging?page=${paging.page+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span> </a></li>
			</c:otherwise>
		</c:choose>    
    </li>
  </ul>
</nav>
	<div class=text-center>
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
		<button type="submit" class="btn btn-warning" onclick="location.href='/board/save'"> 글쓰기 </button>
    	<button type="submit" class="btn btn-outline-primary" onclick="location.href='/'"> 메인으로 돌아가기 </button>
	</div>
</div>


</div>

<%-- 	<div>
		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
			현재 페이지에서 1감소한 페이지 요청하는 링크
				<a href="/board/paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		

		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
			i값이 현재 페이지(page) 값과 같다면 i출력
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div> --%>

</head>
<body>



</body>
</html>