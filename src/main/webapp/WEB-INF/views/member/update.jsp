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
		console.log ('update 함수호출')		
		// 
		const pw = document.getElementById('m_password').value;
		console.log(pw);
		const pwDB = '${member.m_password}';
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
<form action="update" method="POST" name="update_form">
<div class="container mt-5" style="width:40%; height:500px; background-color: #f5f5f5; border-radius: 3rem;">
	<div class = "row">
	<h2 class="text-center" style="margin-top:25px"> update.jsp </h2>
	</div>
	<div class="row mb-3 mt-3">
		<label for="inputNumber" class="col-sm-2 col-form-label">Number</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputNumber" name="m_number" value="${member.m_number}"readonly>
    </div>
    </div>
    
	<div class="row mb-3 mt-3">
		<label for="inputId" class="col-sm-2 col-form-label">ID</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputId" name="m_id" value="${member.m_id}"readonly>
    </div>
    </div>
    
    <div class="row mb-3">
		<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
		<input type="password" class="form-control" id="m_password" name="m_password">
    </div>
  </div>
	
	<div class="row mb-3">
		<label for="inputName" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputName"name="m_name" value="${member.m_name}"readonly>
    </div>
    </div>
	
	<div class="row mb-3">
		<label for="inputEmail" class="col-sm-2 col-form-label">E-mail</label>
    <div class="col-sm-10">
		<input type="email" class="form-control" id="inputId" name="m_email" value="${member.m_email}">
    </div>
    </div>

	<div class="row mb-3">
		<label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputPhone" name="m_phone" value="${member.m_phone}">
    </div>
    </div>
    
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
    	<input type="button" value="수정하기" onclick="update()" class="btn btn-outline-primary">
	</div>
</div>	
	
</form>	
</body>

</html>