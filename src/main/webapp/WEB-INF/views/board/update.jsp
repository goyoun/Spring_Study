<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script>
	/* 비밀번호 입력창에서 비밀번호를 입력받고 DB에서 가져온 비밀번호와 비교해서 일치하면 update처리 일치하지 않으면 비밀번호가 일치하지 않습니다 alert출력
	*/
	
	function update() {
		// 이 문장이 아래 form을 전송하는 문장	
 		const pw = document.querySelector("#_password").value;
/* 		const pw = document.getElementById("b_password").value; */
		const pwDB = '${board.b_password}';
		console.log(pwDB)
		if(pw == pwDB){
			update_form.submit();
		} else {
			alert('비밀번호가 일치하지 않습니다.')	
		}
	}
</script>
</head>

<body>

<form action="/board/update" method="post" name="update_form" enctype="multipart/form-data">

<div class="container mt-5" style="width:40%; height:500px; background-color: #f5f5f5; border-radius: 3rem;">
	<div class = "row">
	<h2 class="text-center" style="margin-top:25px"> update.jsp </h2>
	</div>
	
	<input type="hidden" name="page" value="${page}"> <br>
	
	<div class="row mb-3 mt-3">
		<label for="inputNumber" class="col-sm-2 col-form-label">글번호</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputNumber" name="b_number" value="${board.b_number}"readonly>
    </div>
    </div>
    
	<div class="row mb-3 mt-3">
		<label for="inputId" class="col-sm-2 col-form-label">작성자</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputId" name="b_writer" value="${board.b_writer}"readonly>
    </div>
    </div>
    
    <div class="row mb-3">
		<label for="inputPassword" class="col-sm-2 col-form-label"> 글비밀번호 </label>
    <div class="col-sm-10">
		<input type="password" class="form-control" id="b_password" name="b_password" >
    </div>
  </div>
	
	<div class="row mb-3">
		<label for="inputName" class="col-sm-2 col-form-label">제목</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputName" name="b_title" value="${board.b_title}" readonly>
    </div>
    </div>
	
	<div class="row mb-3">
	 <label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label"> 내용 </label>
     <div class="col-sm-10">
		<textarea class="form-control" id="inputId" name="b_contents" > ${board.b_contents} </textarea>
    </div>
    </div>
    
    <input type="file" name="b_file" class="warning">
    
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
    	<button onclick="update()" class="btn btn-outline-success"> 수정하기 </button>
	</div>
</div>	
	
</form>	

</body>
</html>