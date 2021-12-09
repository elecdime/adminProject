<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>GH SHOP</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<style type="text/css">
.originImg {
	width: 500px;
	height: auto;
}
</style>
</head>


<body>



	<div id="seller_wrap">
		<div id="seller_top" class="item1">
			<a>GHSHOP 관리자센터</a>
			<div class="seller_top_right">
				<span>ADNUIN 관리자님</span><span><button>로그아웃</button></span>
			</div>
		</div>
		<!--  left menu -->
		<div id="seller_lnb" class="item2">
			<div class="store">
				<a href="/">GH SH<span>O</span>P
				</a>
			</div>
			<ul class="seller_menu">
				<li><a class="seller_menu_tit">상품관리</a>
					<ol class="seller_menu_con">
						<li><a href="#">submenu01</a></li>
						<li><a href="#">submenu02</a></li>
					</ol></li>
				<li><a class="seller_menu_tit">쿠폰관리</a>
					<ol class="seller_menu_con">
						<li><a
							href="${pageContext.request.contextPath}/aEvent/newCoupon">submenu01</a></li>
						<li><a href="#">submenu02</a></li>
					</ol></li>
				<li><a class="seller_menu_tit">회원관리</a>
					<ol class="seller_menu_con">
						<li><a href="#">submenu01</a></li>
						<li><a href="#">submenu02</a></li>
					</ol></li>
				<li><a class="seller_menu_tit">menu04</a>
					<ol class="seller_menu_con">
						<li><a href="#">submenu01</a></li>
						<li><a href="#">submenu02</a></li>
					</ol></li>
			</ul>
		</div>

		<div id="seller_content" class="item3">
			<div class="local_ov01 local_ov">
				<a href="/aProduct/product" class="ov_listall">전체목록</a> 
			</div>

			<form name="flist" class="local_sch01 local_sch">
				<input type="hidden" name="save_stx" value=""> <label
					for="sca" class="sound_only">분류선택</label> <select name="sca"
					class="category1" id="sca">
					<option value="">전체분류</option>
					<option value="">분류1</option>
					<option value="">분류2</option>
				</select> <label for="sfl" class="sound_only">검색대상</label> <select name="sfl"
					id="sfl" class="category2">
					<option value="it_name" selected="selected">상품명</option>
					<option value="it_id">상품코드</option>
					<option value="it_maker">제조사</option>
					<option value="it_origin">원산지</option>
					<option value="it_sell_email">판매자 e-mail</option>
				</select> <label for="stx" class="sound_only">검색어</label> <input type="text"
					name="stx" value="" id="stx" class="frm_input">
				<button type="submit" value="검색" class="btn_submit">검색</button>
			</form>




			<div id="listdiv">
				<!-- 카테고리사용법
				insert into goods_category (cateName,cateCode) values('카테고리1','300');

				insert into goods_category (cateName,cateCode,cateCodeRef) values('카테고리3-1','301','300');


				insert into goods_category (cateName,cateCode,cateCodeRef) values('카테고리3-2','302','300');
			 -->

				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="n" value="${goods.goodsNo}" />

					<div class="inputArea">
						<!-- <label>1차 분류</label> <span class="category1"></span> --> 
						<label>카테고리</label> <span class="category2">${goods.cateName}</span>
					</div>
			</div>
			
			<div class="inputArea" >
				<label for="goodsNm">상품명</label> <span>${goods.goodsNm}</span> <label
					for="makerNm">제조사</label> <span>${goods.makerNm}</span> <label
					for="originNm">원산지</label> <span>${goods.originNm}</span>
			</div>

			<div class="inputArea">
				<label for="goodsModelNo">모델명</label> <span>${goods.goodsModelNo}</span>

				<label for="goodsPrice">상품가격</label> <span>${goods.goodsPrice}</span>
				<label for="fixedPrice">정가</label> <span>${goods.fixedPrice}</span>

			</div>

			<div class="inputArea">
				<label for="totalStock">상품수량</label> <span>${goods.totalStock}</span>

			</div>
				<div class="inputArea">
						<label for="goodsWeight">상품 무게</label> 
							 <span>${goods.goodsWeight}</span>

					</div>
					
				<div class="inputArea">
						<label for="shortDescription">짧은 설명</label> 
							 <span>${goods.shortDescription}</span>

					</div>
					<div class="inputArea">
						<label for="goodsDescription">상품 설명</label> 
							 <span>${goods.goodsDescription}</span>

			
					<div class="inputArea">
						<label for="memo">메모</label> 
							<span>${goods.memo}</span>

					</div>

			<div class="inputArea">
				<label for="makeYmd">제조일</label> <span>${goods.makeYmd}</span>
			</div>
			<%-- 	<div class="inputArea">
				<label for="salesStartYmd">상품판매시작일</label> <span>${goods.salesStartYmd}</span>
			</div>
			 --%>

			<div class="inputArea">

				<label for="goodsMustInfo">내용</label> <span>${goods.goodsMustInfo}</span>

			</div>
		



			<!-- 		</div>

					<div class="inputArea">
						<label for="gdsImg">이미지</label> <input type="file" id="gdsImg"
							name="file" />
						<div class="select_img">
							<img src="" />
						</div>

						<script>
					$("#gdsImg").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script> -->



		</div>

		<div class="inputArea">
			<button type="button" id="modify_Btn" class="abtn">수정</button>
			<button type="button" id="delete_Btn" class="abtn">삭제</button>

			<script>
  			var formObj = $("form[role='form']");
  
  				$("#modify_Btn").click(function(){
 				  formObj.attr("action", "/aProduct/productupdate");
  					 formObj.attr("method", "get")
  					 formObj.submit();
 					alert("상품 수정시 카테고리 재기입 필수");
  				});
  				$("#delete_Btn").click(function(){
  					 
  					 var con = confirm("정말로 삭제하시겠습니까?");
  					 
  					 if(con) {      
  					  formObj.attr("action", "/aProduct/deleteproduct");
  					  formObj.submit();
  					 }
  					});
 </script>
		</div>

		</form>

	</div>

	</div>
	</div>
	<!--  seller_wrap  -->



	<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 
 if(jsonData[i].level == "1") {
  cate1Obj = new Object();  //초기화
  cate1Obj.cateCode = jsonData[i].cateCode;
  cate1Obj.cateName = jsonData[i].cateName;
  cate1Arr.push(cate1Obj);
 }
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
      + cate1Arr[i].cateName + "</option>"); 
}

$(document).on("change", "select.category1", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.category2");
	 
	 /*
	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	        + cate2Arr[i].cateName + "</option>");
	 }
	 */
	 
	 cate2Select.children().remove();

	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();  
	  cate2Select.append("<option value=''>전체</option>");
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) {
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }
	  
	 });
	 
	});

</script>

</body>
</html>
