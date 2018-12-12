<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입 페이지</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
  	<script type="text/javascript">
    function CheckForm(){
		var form = document.memberInfo;
		   
        if(!form.id.value){
                alert("아이디를 입력하세요.");
                return false;
        }
            
        if(!form.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
        }
        
        if(!form.pwck.value){
           		alert("비밀번호 확인을 입력하세요.");
           		return false;
 	   	}
        else if(form.pwck.value != form.pw.value){
        		alert("비밀번호 확인과 비밀번호가 맞지 않습니다.");
       			return false;
        }
		
		if(!form.age.value){
                alert("재료 및 특징을 입력하세요.");
                return false;
        }

    }
 </script>
  
  </head>
  <body>

<div class="page-header" style="text-align: center;">
<h1 style="margin-left:50px;"><img src="dog.png" width="40px" height="40px" style="margin-right: 15px;">Sign-up page</h1>  
</div>
<form name="memberInfo" action="MemberAdd" method='post' onSubmit="return CheckForm()">
<div class="container">
  <div class="row">
    <div class="col-md-8 col-md-offset-4">
      
<table class="table table-striped" style="width: 400px; text-align: center;">
 
  <tbody>
    <tr>
      <td style="text-align: left;">회원아이디*</td>
      <td>
          <div class="form-group">
          <input type="text" class="form-control" name='id' placeholder="example@example.com"></div></td>
    </tr>
    
    <tr>
      <td style="text-align: left;">비밀번호*</td>
      <td>
          <div class="form-group">
          <input type="password" class="form-control" name='pw' placeholder="8자리 이상"></div></td>
    </tr>
    
    <tr>
      <td style="text-align: left;">비밀번호 확인*</td>
      <td>
          <div class="form-group">
          <input type="text" class="form-control" name='pwck' placeholder="8자리 이상"></div></td>
    </tr>
    
    <tr>
      <td style="text-align: left;">나이*</td>
      <td>
          <div class="form-group">
          <input type="text" class="form-control" name='age' placeholder="age.."></div></td>
    </tr>

    <tr>
      <td style="text-align: left;">성별*</td>
     <td><div class="btn-group">
 		<select class="custom-select" name='sex'>
  		<option selected>성별</option>
 	 	<option value="남성">남성</option>
  		<option value="여성">여성</option>
		</select>
</div>
          </td>
    </tr>
  </tbody>
</table>

<div class="col-sm-4 col-sm-offset-4">
 <button type="submit" class="btn btn-info">만들기</button>
 <button type="button" onclick="location='C:/Users/PC/Desktop/소개실4/index.html'" class="btn btn-danger">취소</button>
  </div>

    </div>    
  </div>
</div>
</form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>