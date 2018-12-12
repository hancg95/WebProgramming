<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>음식 추가 페이지</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <script type="text/javascript">
    function CheckForm(){
		var form = document.foodInfo;

        var isAtrbtChk = false;
        var arr_Atrbt = document.getElementsByName("ATRBT[]");
        for(var i=0;i<arr_Atrbt.length;i++){
            if(arr_Atrbt[i].checked == true) {
                isAtrbtChk = true;
                break;
            }
        }
		   
        if(!form.fname.value){
                alert("음식 이름을 입력하세요.");
                return false;
        }
            
        if(!form.kind.value){
                alert("음식 종류를 선택하세요.");
                return false;
        }	
        
		if(!isAtrbtChk){
            alert("음식의 특징을 한개 이상 선택해주세요.");
            return false;
        }
		
		if(!form.material.value){
                alert("재료 및 특징을 입력하세요.");
                return false;
        }

    }
 </script>
    
  </head>
  <body>

<div class="page-header" style="text-align: center;">
<h1 style="margin-left:50px;"><img src="dog.png" width="40px" height="40px" style="margin-right: 15px;">음식 추가 페이지</h1>  
</div>

<div class="container">
  <div class="row">
    <div class="col-md-8 col-md-offset-4">
<form name="foodInfo" action="FoodAdd" method='post' onSubmit="return CheckForm()">     
<table class="table table-striped" style="width: 1000px; text-align: center;">

  <tbody>
    <tr>
      <td style="text-align: left;">음식 이름*</td>
      <td>
          <div class="form-group">
          <input type="text" name='fname' class="form-control" placeholder="Food Name.."></div></td>
    </tr>

    <tr>
      <td style="text-align: left;">종류*</td>
      <td>
			<select class="form-control form-control-sm" name='kind' size=1>
			<option value='' selected></option>
			<option value='한식'>한식</option>
			<option value='양식'>양식</option>
			<option value='일식'>일식</option>
			<option value='중식'>중식</option>
			<option value='분식'>분식</option>
			</select></td>
    </tr>
    
    <tr>
      <td style="text-align: left;">특징*</td>
      <td>
          <div class="form-check">
			<input class="form-check-input" type="checkbox" id="매운" name="ATRBT[]" value="매운,">
			<label class="form-check-label" >
			매운 맛
			</label>
			<input class="form-check-input" type="checkbox" id="단" name="ATRBT[]" value="단,">
			<label class="form-check-label" >
			단 맛
			</label>
			<input class="form-check-input" type="checkbox" id="짠" name="ATRBT[]" value="짠,">
			<label class="form-check-label" >
			짠 맛
			</label>
			<input class="form-check-input" type="checkbox" id="신" name="ATRBT[]" value="신,">
			<label class="form-check-label" >
			신 맛
			</label>
			<input class="form-check-input" type="checkbox" id="고소한" name="ATRBT[]" value="고소한,">
			<label class="form-check-label" >
			고소한 맛
			</label>
			<input class="form-check-input" type="checkbox" id="바삭한" name="ATRBT[]" value="바삭한,">
			<label class="form-check-label" >
			바삭한 식감
			</label>
			<input class="form-check-input" type="checkbox" id="걸쭉한" name="ATRBT[]" value="걸쭉한,">
			<label class="form-check-label" >
			걸쭉한 식감
			</label>
			<input class="form-check-input" type="checkbox" id="뜨거운" name="ATRBT[]" value="뜨거운,">
			<label class="form-check-label" >
			뜨거운 요리
			</label>
			<input class="form-check-input" type="checkbox" id="차가운" name="ATRBT[]" value="차가운,">
			<label class="form-check-label" >
			차가운 요리
			</label>
			<input class="form-check-input" type="checkbox" id="느끼한" name="ATRBT[]" value="느끼한,">
			<label class="form-check-label" >
			느끼한 요리
			</label>
			<input class="form-check-input" type="checkbox" id="튀긴" name="ATRBT[]" value="튀긴,">
			<label class="form-check-label" >
			튀긴 요리
			</label>
			<input class="form-check-input" type="checkbox" id="구운" name="ATRBT[]" value="구운,">
			<label class="form-check-label" >
			구운 요리
			</label>
			<input class="form-check-input" type="checkbox" id="삶은" name="ATRBT[]" value="삶은,">
			<label class="form-check-label" >
			삶은 요리
			</label>
			<input class="form-check-input" type="checkbox" id="볶은" name="ATRBT[]" value="볶은,">
			<label class="form-check-label" >
			볶은 요리
			</label>
			<input class="form-check-input" type="checkbox" id="국물" name="ATRBT[]" value="국물,">
			<label class="form-check-label" >
			국물
			</label>
			<input class="form-check-input" type="checkbox" id="날" name="ATRBT[]" value="날,">
			<label class="form-check-label" >
			날 음식
			</label>
			<input class="form-check-input" type="checkbox" id="고기" name="ATRBT[]" value="고기,">
			<label class="form-check-label" >
			고기
			</label>
			<input class="form-check-input" type="checkbox" id="야채" name="ATRBT[]" value="야채,">
			<label class="form-check-label" >
			야채
			</label>
			<input class="form-check-input" type="checkbox" id="밥" name="ATRBT[]" value="밥,">
			<label class="form-check-label" >
			밥
			</label>
			<input class="form-check-input" type="checkbox" id="치즈" name="ATRBT[]" value="치즈,">
			<label class="form-check-label" >
			치즈
			</label>
			<input class="form-check-input" type="checkbox" id="빵" name="ATRBT[]" value="빵,">
			<label class="form-check-label" >
			빵
			</label>
			<input class="form-check-input" type="checkbox" id="면" name="ATRBT[]" value="면,">
			<label class="form-check-label" >
			면
			</label>
			</div></td>
    </tr>
    
    <tr>
      <td style="text-align: left;">재료 및 특징*</td>
      <td>
          <div class="form-group">
			<label for="exampleFormControlTextarea1"></label>
			<textarea class="form-control" name='material' rows="5" placeholder='추가하실 재료들을 &#39;,&#39;로 구분하여 적어주세요.'></textarea>
			</div></td>
    </tr>
    
  </tbody>
  
</table>

<div class="col-sm-4 col-sm-offset-4">
 <button type="submit" class="btn btn-info">만들기</button>
 <button type="button" onclick="location='C:/Users/PC/Desktop/소개실4/index.html'" class="btn btn-danger">취소</button>
  </div>
</form>
    </div>    
  </div>
</div>


 

</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>