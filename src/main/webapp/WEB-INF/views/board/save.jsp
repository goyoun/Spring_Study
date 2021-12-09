<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<h2>save.jsp</h2>

<h1 class="text-center" style="margin-top:25px"> 글쓰기 페이지 </h1>

<form action="savefile" method="post" enctype="multipart/form-data">

<div class="container mt-5" style="width:60%; height:700px; background-color: #f5f5f5; border-radius: 1rem;">

<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label mt-3">작성자</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="b_writer" value="${sessionScope.loginId}" readonly>
</div>

<div class="mb-3">
  <label for="exampleFormControlInput2" class="form-label">제목</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="b_title" placeholder="제목을 입력해주세요">
</div>

<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label"> 내용 </label>
  <textarea class="form-control" id="exampleFormControlTextarea1" name="b_contents" rows="3" placeholder="내용을 입력해주세요"></textarea>
</div>

<input type="file" name="b_file" class="warning">
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
    <button type="submit" class="btn btn-primary"> 글저장 </button>
	</div>
</div>
</form>

</body>
</html>