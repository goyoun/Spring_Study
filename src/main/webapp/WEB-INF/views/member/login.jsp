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

	<form action="login" method="post">
	
<div class="container mt-4" style="width:40%; height:300px; background-color: #f5f5f5; border-radius: 3rem;">
	<div class = "row">
	<h2 class="text-center" style="margin-top:25px"> Login </h2>
	</div>
	
	<div class="row mb-3 mt-3">
		<label for="inputId" class="col-sm-2 col-form-label">ID</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputId" name="m_id">
    </div>
    </div>
    
    <div class="row mb-3">
		<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
		<input type="password" class="form-control" id="inputPassword" name="m_password">
    </div>
  </div>
  
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
    	<button type="submit" class="btn btn-outline-primary">Login</button>
	</div>
		
</div>
	</form>
	  

</body>
</html>