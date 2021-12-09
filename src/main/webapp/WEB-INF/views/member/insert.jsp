<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<script>
//	 아이디 입력을 하는 동안에 idDuplicate() 함수를 호출하고 입력된 값을 콘솔에 출력
	function idDuplicate() {
	const id = document.getElementById('m_id').value;
	console.log(id);
	const checkResult = document.getElementById('id-dup-check')
	$.ajax({
		type: 'post', // 전송방식 (get, post, delete, put등)
		url : 'idDuplicate', // 요청주소 (컨트롤러로 요청하는 주소)
		data : {'m_id': id}, // 전송할 데이터 (자바스크립트 객체 'm_id'파라미터: id파라미터값 추가값이있으면 ,'ㅇㅇ':ㅇㅇ,)
		dataType: 'text', // 요청후 리턴받을 때의 데이터 형식
		success: function(result) { // 요청이 성공적으로 처리됐을 때 실행할 함수
			console.log('ajax 성공');
			console.log(result);
			if (result=="ok") {
				checkResult.style.color = 'green';
				checkResult.innerHTML = '멋진 아이디네요!!'
			} else {
				checkResult.style.color = 'red';
				checkResult.innerHTML = '이미 사용중인 아이디입니다.';
			}
			},
		error: function() { //요청이 실패했을때 실행할 함수
			console.log('오타찾으셈')
			},
			
	});
}
	</script>
	
</head>

<body>

<form action="savefile" method="post" enctype="multipart/form-data">

<div class="container mt-5" style="width:40%; height:700px; background-color: #f5f5f5; border-radius: 3rem;">
	<div class = "row">
	<h2 class="text-center" style="margin-top:25px"> Member Insert </h2>
	</div>
	<div class="row mb-3 mt-3">
		<label for="inputId" class="col-sm-2 col-form-label">ID</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="m_id" name="m_id" onblur="idDuplicate()">
		<span id="id-dup-check"></span>
    </div>
    </div>
    
    <div class="row mb-3">
		<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
		<input type="password" class="form-control" id="inputPassword" name="m_password">
    </div>
  </div>
	
	<div class="row mb-3">
		<label for="inputName" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputName"name="m_name">
    </div>
    </div>
	
	<div class="row mb-3">
		<label for="inputEmail" class="col-sm-2 col-form-label">E-mail</label>
    <div class="col-sm-10">
		<input type="email" class="form-control" id="inputId" name="m_email">
    </div>
    </div>

	<div class="row mb-3">
		<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputPhone" name="m_phone">
    </div>
    </div>
    
    <input type="file" name="m_file" class="btn warning">
    
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
    	<button type="submit" class="btn btn-outline-primary">Member Join</button>
		<button type="submit" class="btn btn-outline-danger mb-3"> Cancle </button>
	</div>
</div>	
	
</form>	
</body>
</html>