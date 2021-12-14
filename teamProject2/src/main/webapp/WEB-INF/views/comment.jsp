<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(function() {//첫 페이지 로딩시
		checkcomment();
		recentlyComment(1);
		
		//별점
		var ystar = 'url("${pageContext.request.contextPath}/resources/images/yellowStar.png")';
		var gstar = 'url("${pageContext.request.contextPath}/resources/images/grayStar.png")';
		
		if(${sessionScope.user.memId == null}){
			$('.recomment_subform').hide();
		}
		 
		$('#star1').hover(function() {
			
			$('#star1').css('background-image', ystar);
			$('#star2').css('background-image', gstar);
			$('#star3').css('background-image', gstar);
			$('#star4').css('background-image', gstar);
			$('#star5').css('background-image', gstar);
			$('#star').val(1);
		});
		
		$('#star2').hover(function() {
			$('#star1').css("background-image", ystar);
			$('#star2').css("background-image", ystar);
			$('#star3').css("background-image", gstar);
			$('#star4').css("background-image", gstar);
			$('#star5').css("background-image", gstar);
			$('#star').val(2);
		});
		
		$('#star3').hover(function() {
			$('#star1').css("background-image", ystar);
			$('#star2').css("background-image", ystar);
			$('#star3').css("background-image", ystar);
			$('#star4').css("background-image", gstar);
			$('#star5').css("background-image", gstar);
			$('#star').val(3);
		});
		
		$('#star4').hover(function() {
			$('#star1').css("background-image", ystar);
			$('#star2').css("background-image", ystar);
			$('#star3').css("background-image", ystar);
			$('#star4').css("background-image", ystar);
			$('#star5').css("background-image", gstar);
			$('#star').val(4);
		});
		
		$('#star5').hover(function() {
			$('#star1').css("background-image", ystar);
			$('#star2').css("background-image", ystar);
			$('#star3').css("background-image", ystar);
			$('#star4').css("background-image", ystar);
			$('#star5').css("background-image", ystar);
			$('#star').val(5);
		});
		
		$('#star6').hover(function() {
			
			$('#star6').css('background-image', ystar);
			$('#star7').css('background-image', gstar);
			$('#star8').css('background-image', gstar);
			$('#star9').css('background-image', gstar);
			$('#star10').css('background-image', gstar);
			$('#ustar').val(1);
		});
		
		$('#star7').hover(function() {
			$('#star6').css("background-image", ystar);
			$('#star7').css("background-image", ystar);
			$('#star8').css("background-image", gstar);
			$('#star9').css("background-image", gstar);
			$('#star10').css("background-image", gstar);
			$('#ustar').val(2);
		});
		
		$('#star8').hover(function() {
			$('#star6').css("background-image", ystar);
			$('#star7').css("background-image", ystar);
			$('#star8').css("background-image", ystar);
			$('#star9').css("background-image", gstar);
			$('#star10').css("background-image", gstar);
			$('#ustar').val(3);
		});
		
		$('#star9').hover(function() {
			$('#star6').css("background-image", ystar);
			$('#star7').css("background-image", ystar);
			$('#star8').css("background-image", ystar);
			$('#star9').css("background-image", ystar);
			$('#star10').css("background-image", gstar);
			$('#ustar').val(4);
		});
		
		$('#star10').hover(function() {
			$('#star6').css("background-image", ystar);
			$('#star7').css("background-image", ystar);
			$('#star8').css("background-image", ystar);
			$('#star9').css("background-image", ystar);
			$('#star10').css("background-image", ystar);
			$('#ustar').val(5);
		});
	});

	function insertcomment(){ //댓글 작성버튼을 눌렀을 때
		
		var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
		var imgfile = $('#file').val();
		var gstar = 'url("${pageContext.request.contextPath}/resources/images/grayStar.png")';
		
		if(checkNull($('#comment').val())){
			alert("댓글을 입력해 주세요");
		}else if($('#star').val()=="0"){
			alert("별점을 선택해 주세요");
		}else{
			if(imgfile!=""){ 
				if(!imgfile.match(fileForm)) {
			    	alert("jpg,png 파일만 업로드 가능");
			    }else{
			    	var form = $("#commentPicture_subform")[0];
					var formData = new FormData(form);
					
					$.ajax({
						url:"commentSerialize", type:"post", data:$("#comment_subform").serialize(), async: false,

						success: function(){},
						error:function(request,status,error){}
					});
					
					$.ajax({
						url:"upload", type:"post", data:formData, enctype: "multipart/form-data", async: false,
						processData: false,contentType: false, cache: false, timeout: 300000,
						success: function(){},
						error:function(request,status,error){}
					});
			    }
			}else{
				$.ajax({
					url:"commentSerialize", type:"post", data:$("#comment_subform").serialize(), async: false,
					success: function(){},
					error:function(request,status,error){}
				});
			}
			
			checkcomment();
 			pagebt(1); 
			pageCreate(1);
 			$('#commentsub_box').hide();
 			$('#comment_box').show();
			$('#comment').val("");
			$('#star1').css("background-image", gstar);
			$('#star2').css("background-image", gstar);
			$('#star3').css("background-image", gstar);
			$('#star4').css("background-image", gstar);
			$('#star5').css("background-image", gstar);
			$('#star').val(0);
			$('#file').val("");
		}
	}
	
	
	function checkcomment(){ //댓글 확인 여부 메소드 겸 댓글 호출 메소드
		var	id = '${user.memId}';
		var goodsNo = ${param.goodsNo};
		
		if(id == "null"){
 			$('#commentsub_box').hide(); //id가 없으면 입력창 숨기기
 		}else{
			$.ajax({
				url:"checkcomment" , type:"post" , dataType:"json", data:{"memid":id , "goodsNo":goodsNo} ,
				success: function(commentData){
					var str = "";
	         		let list = commentData.datas;
	         		
	         		if(list!=""){ //만약에 내가 남긴 댓글이 있을 시
	         			$('#commentsub_box').hide(); //입력창을 숨기고
	         			
	         			$(list).each(function(idx,arr){ //댓글 불러오기
 	         			
		         			for(var i = 1 ; i <= arr.star ; i++){
		         				str += "<img class=starpic alt='' src=${pageContext.request.contextPath}/resources/images/yellowStar.png>";
		         			}
		         			for(var i = 1 ; i <= 5-arr.star ; i++){
		         				str += "<img class=starpic alt='' src=${pageContext.request.contextPath}/resources/images/grayStar.png>";
		         			}
		         			str += arr.commentTime;
		         			str += "<div>(";
		         			str += arr.memid;
		         			str += ")";
			       			str += "<span class=editbutton ><button onclick=deletecomment(";
			       			str += arr.commentNum;
			       			str += ")>삭제</button><button onclick=updateform()>수정</button></span></div>";
			       			if(arr.picture != null){
			       				str += "<img class=commentpic alt='' src='${pageContext.request.contextPath}/resources/upload/";
			         			str += arr.picture;
			         			str += "''>";
			       			}
			       			str += "<div>";
		         			str += arr.comment;
		         			str += "</div>";
		         			
		         			$("#ucomment").text(arr.comment);
		         			$("#ucommentNum").val(arr.commentNum);
	         			});
	         			
	         			$("#comment_box").html(str);
	         			
	         		}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
 		}
	}
	
	function insertrecomment(a){ //답글 작성 버튼을 눌렀을 때
		if(checkNull($('#recommentarea'+a).val())){
			alert("답글을 입력해 주세요");
		}else{
			$.ajax({
				url:"recommentSerialize" , type:"post" , data:$("#recomment_subform"+a).serialize(), async: false ,
				success: function(){},
				error:function(request,status,error){
				} 
			});
			
			repagebt(1,a);
			RepageCreate(1,a);
			$('#recomment_comment'+a).show();
			$('#recomment_subform'+a).hide();
			$('#recommentarea'+a).val("");
			$('#recountNum'+a).val("답글"+recommentcount(a));
		}
	}
	
	function checkNull(input){ //입력 공백 여부 또는 스페이스바로 공백입력 여부 확인 메소드
		if(input== null||input.replace(/ /gi,"")==""){
			return true;
		}else{
			return false;
		}
	}
	
	
	function pageCreate(a){ //댓글 a칸의 페이지 메소드
		var goodsNo = ${param.goodsNo};
		$.ajax({	//ajax로 전체 댓글의 갯수를 가져온다
         	url: "commentCount", type: "post", dataType: "text", data:{"goodsNo":goodsNo} ,
         	success: function(data){ // success - 앞의 ajax 문구가 정상적으로 작동했을 때 실행하는 함수 / data - 가져온 값
	         	var count = parseInt(data); // count - 가져온 댓글의 갯수를 숫자형로 형변화
	         	var Pagecount = 0;  //페이지 갯수 0으로 초기화
	         	
	         	$(".crema-product-reviews-count").text("(" + count + ")");
	         	
	         	if(count%3==0){ //댓글의 갯수를 n개로 나누어서 만들어야할 전체 페이지 갯수를 추출
	         		Pagecount = count/3;
	         	}else{
	         		Pagecount = parseInt(count/3 + 1);
	         	}
	         		
				var str = "";
				var prev = a-1;
				var next = a+1;
					
				if(a>1){ //첫번째 칸만 아니라면 [이전]버튼 생성 
					str += "<a onclick=pageCreate(";
			 		str += prev;
			 		str += ") href=javascript:;>[이전]  </a>";
				}
				
				if(Pagecount < 5*a){ //n개로 나누었을 때 댓글의 갯수보다 (불러올a칸xn개)가 많으면 댓글의 갯수만큼 제한
					for (var i = (prev*5)+1 ; i<=Pagecount ; i++ ){
						str += "<a id=pageid";
						str += i;
						str += " onclick=pagebt(";
				 		str += i;
				 		str += ") href=javascript:;>"
				 		str += i;
				 		str += "  </a>";
				 		}
				}else{ //아니라면 n개를 전부 생성
					for (var i = (prev*5)+1 ; i<=a*5 ; i++ ){
						str += "<a id=pageid";
						str += i;
						str += " onclick=pagebt(";
				 		str += i;
				 		str += ") href=javascript:;>"
				 		str += i;
				 		str += "  </a>";
			 		}
				}

				if(Pagecount > 5*a){ //(불러올a칸xn개)가 댓글의 갯수보다 부족하면 [다음]버튼 생성 
					str += "<a onclick=pageCreate(";
			 		str += next;
			 		str += ") href=javascript:;>[다음]</a>"
				}
				//전체 페이지갯수를 n개로 나누어서 a칸을 호출할 때 어떻게 만들지를 문자열 str에 더해주기
				
			 	$("#pageNumber").html(str);
				//작성한 str을 id가 pageNumber인 div에 넣어준다
				
			},
				error:function(request,status,error){ // success - 값 가져오기 실패시
              	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); // 에러창 호출
			}
		});
	}
	
	function DpageCreate(a){ //추천순 댓글 a칸의 페이지 메소드
		$.ajax({	//ajax로 전체 댓글의 갯수를 가져온다
         	url: "commentCount", type: "post", dataType: "text", data:{"goodsNo":goodsNo} ,
         	success: function(data){ // success - 앞의 ajax 문구가 정상적으로 작동했을 때 실행하는 함수 / data - 가져온 값
	         	var count = parseInt(data); // count - 가져온 댓글의 갯수를 숫자형로 형변화
	         	var Pagecount = 0;  //페이지 갯수 0으로 초기값
	         	
	         	if(count%3==0){ //댓글의 갯수를 n개로 나누어서 만들어야할 전체 페이지 갯수를 추출
	         		Pagecount = count/3;
	         	}else{
	         		Pagecount = parseInt(count/3 + 1);
	         	}
	         		
				var str = "";
				var prev = a-1;
				var next = a+1;
					
				if(a>1){ //첫번째 칸만 아니라면 [이전]버튼 생성 
					str += "<a onclick=DpageCreate(";
			 		str += prev;
			 		str += ") href=javascript:;>[이전]  </a>";
				}
				
				if(Pagecount < 5*a){ //n개로 나누었을 때 댓글의 갯수보다 (불러올a칸xn개)가 많으면 댓글의 갯수만큼 제한
					for (var i = (prev*5)+1 ; i<=Pagecount ; i++ ){
						str += "<a id=Dpageid";
						str += i;
						str += " onclick=Dpagebt(";
				 		str += i;
				 		str += ") href=javascript:;>"
				 		str += i;
				 		str += "  </a>";
				 		}
				}else{ //아니라면 n개를 전부 생성
					for (var i = (prev*5)+1 ; i<=a*5 ; i++ ){
						str += "<a id=Dpageid";
						str += i;
						str += " onclick=Dpagebt(";
				 		str += i;
				 		str += ") href=javascript:;>"
				 		str += i;
				 		str += "  </a>";
			 		}
				}

				if(Pagecount > 5*a){ //(불러올a칸xn개)가 댓글의 갯수보다 부족하면 [다음]버튼 생성 
					str += "<a onclick=DpageCreate(";
			 		str += next;
			 		str += ") href=javascript:;>[다음]</a>"
				}
				//전체 페이지갯수를 n개로 나누어서 a칸을 호출할 때 어떻게 만들지를 문자열 str에 더해주기
				
			 	$("#pageNumber").html(str);
				//작성한 str을 id가 pageNumber인 div에 넣어준다
				
			},
				error:function(request,status,error){ // success - 값 가져오기 실패시
              	//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 에러창 호출
			}
		});
	}
		
	function pagebt(a){ //최근날짜순으로 댓글을 호출하는 메소드
		var page = a;
		var goodsNo = ${param.goodsNo};
		
		$("#pageid"+a).css('color','#FF6600');
		
		$.ajax({
         	url: "commentPro", type: "post", dataType:"json", data:{"page":page , "goodsNo":goodsNo}, async: false ,
         	success: function(commentData){
         		var str = "";
         		let list = commentData.datas;
         		$(list).each(function(idx,arr){
         			str += "<div class=onecomment>";
	         			for(var i = 1 ; i <= arr.star ; i++){
	         				str += "<img class=starpic alt='' src=${pageContext.request.contextPath}/resources/images/yellowStar.png>";
	         			}
	         			for(var i = 1 ; i <= 5-arr.star ; i++){
	         				str += "<img class=starpic alt='' src=${pageContext.request.contextPath}/resources/images/grayStar.png>";
	         			}
         			str += arr.commentTime;
         			str += "<div>("
         			str += arr.memid;
         			str += ")</div>";
		       			if(arr.picture != null){
		       				str += "<img class=commentpic alt='' src='${pageContext.request.contextPath}/resources/upload/";
		         			str += arr.picture;
		         			str += "'>";
		       			}
	       			str += "<div>";
         			str += arr.comment;
         			str += "</div><input id=recountNum";
         			str += arr.commentNum;
         			str += " type=button onclick=recommentbt(";
         			str += arr.commentNum;		
         			str += ") value=답글"; //답글 버튼 생성
         			str += recommentcount(arr.commentNum);
         			str += "><input "
         				if(checkmyRecommend(arr.commentNum)==1){
             				str += "style=color:red"
             			}else{
             				str += "style=color:black"
             			}
         			str += " class=commendcount id=commendcount";
         			str += arr.commentNum;
         			str += " type=button onclick=recommendadd(";
         			str += arr.commentNum;
         			str += ") value=추천" //추천 버튼 생성
         			str += recommendcount(arr.commentNum);
         			str += "><div class=recommentbox id=recommentbox";
         			str += arr.commentNum;
         			str += " style=display:none;><div id=recomment"; // recomment숫자 - 답글을 하나하나 달아주는 div공간
        			str += arr.commentNum;
         			str += "></div><div id=RepageNumber"; //RepageNumber숫자 - 답글 하나하나마다 페이징을 달아주는 div
         			str += arr.commentNum;
         			str += "></div><form class=recomment_subform id=recomment_subform"; //답글 작성 폼
         			str += arr.commentNum;
         			str += "><textarea id=recommentarea"
         			str += arr.commentNum;
         			str += " name=comment></textarea>";
         			str += "<input name=memId type=text value= ${user.memId} style=display:none;>";
         			str += "<input name=recomment type=text value=";
         			str += arr.commentNum;
         			str += " style=display:none;>";
         			str += "<button type=button id=submit_recomment";
         			str += arr.commentNum;
         			str += " onclick=insertrecomment(";
         			str += arr.commentNum;
         			str += ")>답글 작성</button></form>";
         			str += "<div class=recomment_comment id=recomment_comment" //자신의 댓글이 나오는 div
         			str += arr.commentNum;
         			str += "></div>"; 
         			str += "<form id=recomment_updateform"; //업데이트 폼
         			str += arr.commentNum;
         			str += " style=display:none;>";
         			str += "<input name=memId type=text value=${user.memId} style=display:none;>";
         			str += "<input name=recomment type=text value=";
         			str += arr.commentNum;
         			str += " style=display:none;><textarea id=urecomment"
         			str += arr.commentNum;
         			str += " name=comment></textarea>";
         			str += "<button type=button id=update_recomment";
         			str += arr.commentNum;
         			str += " onclick=updaterecomment(";
         			str += arr.commentNum;
         			str += ")>답글 수정</button>";
         			str += "<button type=button onclick=Noupdatereform(";
         			str += arr.commentNum;		
         			str += ")>수정 취소</button></form></div></div>";
         			
         		});
         		
				$("#comments").html(str);
				
			},
			error:function(request,status,error){}
		});
	}
	
	function Dpagebt(a){ //추천순으로 댓글을 호출하는 메소드
		var page = a;
		var goodsNo = ${param.goodsNo};
		
		$("#Dpageid"+a).css('color','#FF6600');
		$.ajax({
         	url: "DcommentPro", type: "post", dataType:"json", data:{"page":page , "goodsNo":goodsNo}, async: false ,
         	success: function(commentData){
         		var str = "";
         		let list = commentData.datas;
         		$(list).each(function(idx,arr){
         			str += "<div class=onecomment>";
	         			for(var i = 1 ; i <= arr.star ; i++){
	         				str += "<img class=starpic alt='' src=${pageContext.request.contextPath}/resources/images/yellowStar.png>";
	         			}
	         			for(var i = 1 ; i <= 5-arr.star ; i++){
	         				str += "<img class=starpic alt='' src=${pageContext.request.contextPath}/resources/images/grayStar.png>";
	         			}
         			str += arr.commentTime;
         			str += "<div>("
         			str += arr.memid;
         			str += ")</div>";
		       			if(arr.picture != null){
		       				str += "<img class=commentpic alt='' src='${pageContext.request.contextPath}/resources/upload/";
		         			str += arr.picture;
		         			str += "'>";
		       			}
	       			str += "<div>";
         			str += arr.comment;
         			str += "</div><input id=recountNum";
         			str += arr.commentNum;
         			str += " type=button onclick=recommentbt(";
         			str += arr.commentNum;		
         			str += ") value=답글"; //답글 버튼 생성
         			str += recommentcount(arr.commentNum);
         			str += "><input "
         				if(checkmyRecommend(arr.commentNum)==1){
             				str += "style=color:red"
             			}else{
             				str += "style=color:black"
             			}
         			str += " class=commendcount id=commendcount";
         			str += arr.commentNum;
         			str += " type=button onclick=recommendadd(";
         			str += arr.commentNum;
         			str += ") value=추천" //추천 버튼 생성
         			str += recommendcount(arr.commentNum);
         			str += "><div class=recommentbox id=recommentbox";
         			str += arr.commentNum;
         			str += " style=display:none;><div id=recomment"; // recomment숫자 - 답글을 하나하나 달아주는 div공간
        			str += arr.commentNum;
         			str += "></div><div id=RepageNumber"; //RepageNumber숫자 - 답글 하나하나마다 페이징을 달아주는 div
         			str += arr.commentNum;
         			str += "></div><form class=recomment_subform id=recomment_subform"; //답글 작성 폼
         			str += arr.commentNum;
         			str += "><textarea id=recommentarea"
         			str += arr.commentNum;
         			str += " name=comment></textarea>";
         			str += "<input name=memId type=text value=${user.memId} style=display:none;>";
         			str += "<input name=recomment type=text value=";
         			str += arr.commentNum;
         			str += " style=display:none;>";
         			str += "<button type=button id=submit_recomment";
         			str += arr.commentNum;
         			str += " onclick=insertrecomment(";
         			str += arr.commentNum;
         			str += ")>답글 작성</button></form>";
         			str += "<div class=recomment_comment id=recomment_comment" //자신의 댓글이 나오는 div
         			str += arr.commentNum;
         			str += "></div>"; 
         			str += "<form id=recomment_updateform"; //업데이트 폼
         			str += arr.commentNum;
         			str += " style=display:none;>";
         			str += "<input name=memId type=text value=${user.memId} style=display:none;>";
         			str += "<input name=recomment type=text value=";
         			str += arr.commentNum;
         			str += " style=display:none;><textarea id=urecomment"
         			str += arr.commentNum;
         			str += " name=comment></textarea>";
         			str += "<button type=button id=update_recomment";
         			str += arr.commentNum;
         			str += " onclick=updaterecomment(";
         			str += arr.commentNum;
         			str += ")>답글 수정</button>";
         			str += "<button type=button onclick=Noupdatereform(";
         			str += arr.commentNum;		
         			str += ")>수정 취소</button></form></div></div>";
         			
         		});
         		
				$("#comments").html(str);
				
			},
			error:function(request,status,error){}
		});
	}
	
	function recommentbt(a){ //답글 버튼을 눌렀을 때
		var commentNum = a;
		if($("#recommentbox"+commentNum).css("display") == "none"){
		$("#recommentbox"+commentNum).show();
			repagebt(1,commentNum);
			RepageCreate(1,commentNum);
		}else if($("#recommentbox"+commentNum).css("display") != "none"){
	         $("#recommentbox"+commentNum).hide();
		}	
	}
	
	function repagebt(a,b){ //답글을 불러오는 메소드
		var page = a;
		var commentNum = b;
		var id = '${user.memId}';
		
		$.ajax({
			url:"recommentPro", type:"post", async: false , dataType:"json", data:{"page":page ,"commentNum":commentNum},
			success: function(commentData){
				var str = "";
				let list = commentData.datas;
					
				$(list).each(function(idx,arr){
					str += arr.commentTime;
	        		str += "<div>";
	        		str += "<div>("
	         		str += arr.memid;
	         		str += ")";
		       		str +="</div>";
	         		str += arr.recomment;
	         		str += "</div><hr>";
	         		
				});
					
				$("#recomment"+commentNum).html(str);
				
				if(id == "null"){
					$('.recomment_subform').hide();
				}
				
			},
				error:function(request,status,error){}
		});
		
		$.ajax({
			url:"checkrecomment" , type:"post" , async: false , dataType:"json", data:{"memid":id , "recommentNum":commentNum} ,
			success: function(commentData){
				var str = "";
         		let list = commentData.datas;
         		
         		if(list!=""){
         			$(list).each(function(idx,arr){
	         			
	         			str += arr.commentTime;
	         			str += "<div>(";
	         			str += arr.memid;
	         			str += ")";
		       			str += "<span class=editbutton ><button type=button onclick=deleterecomment(";
		       			str += arr.commentNum;
		       			str += ",";
		       			str += arr.recomment;
		       			str += ")>삭제</button><button type=button onclick=updatereform(";
		       			str += arr.recomment;
		       			str += ")>수정</button></span></div><div>";
	         			str += arr.comment;
	         			str += "</div>";
	         			
	         			$("#urecomment"+arr.recomment).val(arr.comment);
         			});
         			
         			$("#recomment_comment"+commentNum).html(str);
         			$('#recomment_subform'+commentNum).hide();
         			
         		}
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	}
	
	function recommentcount(a){
 		var commentNum = a;
 		var count = 0;
 		
		$.ajax({	//ajax로 특정 답글의 갯수를 가져온다
         	url: "recommentCount", type: "post", async: false , dataType: "text", data:{"commentNum":commentNum},
         	//url-controller에 연결할 변수 / type-?? / async - 리턴을 받기 위한 동기식방법 / datatype - 가져올 데이터타입 / data - 건내줄 데이터 / 
         	success: function(data){count = data;},
         	error:function(request,status,error){}
		});
		
		return count;
	}
	
	function RepageCreate(aa,b){ //b답글의 a칸의 페이지 메소드
				var commentNum = b;
				var count = recommentcount(commentNum);
				
				var a = aa;
	         	
	         	if(count%3==0){ //댓글의 갯수를 n개로 나누어서 만들어야할 전체 페이지 갯수를 추출
	         		Pagecount = count/3;
	         	}else{
	         		Pagecount = parseInt(count/3 + 1);
	         	}
	         		
				var str = "";
				var prev = a-1;
				var next = a+1;
				var commentnum = b;
					
				if(a>1){ //첫번째 칸만 아니라면 [이전]버튼 생성 
					str += "<a onclick=RepageCreate(";
			 		str += prev;
			 		str += ",";
			 		str += commentnum;
			 		str += ") href=javascript:;>[이전]  </a>";
				}
				
				if(Pagecount < 5*a){ //n개로 나누었을 때 댓글의 갯수보다 (불러올a칸xn개)가 많으면 댓글의 갯수만큼 제한
					for (var i = (prev*5)+1 ; i<=Pagecount ; i++ ){
				 		str += "<a onclick=repagebt(";
				 		str += i;
				 		str += ",";
				 		str += commentnum;
				 		str += ") href=javascript:;>"
				 		str += i;
				 		str += "  </a>";
				 		}
				}else{ //아니라면 n개를 전부 생성
					for (var i = (prev*5)+1 ; i<=a*5 ; i++ ){
				 		str += "<a onclick=repagebt(";
				 		str += i;
				 		str += ",";
				 		str += commentnum;
				 		str += ") href=javascript:;>"
				 		str += i;
				 		str += "  </a>";
			 		}
				}

				if(Pagecount > 5*a){ //(불러올a칸xn개)가 댓글의 갯수보다 부족하면 [다음]버튼 생성 
					str += "<a onclick=RepageCreate(";
			 		str += next;
			 		str += ",";
			 		str += commentnum;
			 		str += ") href=javascript:;>[다음]</a>"
				}
				//전체 페이지갯수를 n개로 나누어서 a칸을 호출할 때 어떻게 만들지를 문자열 str에 더해주기
				
			 	$("#RepageNumber"+commentnum).html(str);
				//작성한 str을 id가 pageNumber인 div에 넣어준다		
	}
	
	function deletecomment(a){ //댓글 삭제 메소드
		$.ajax({	
         	url: "deletecomment", type: "post", data:{"commentnum":a}, async: false ,
         	success: function(){},
         	error:function(request,status,error){}
		});
	
		recentlyComment(1);
		$('#commentsub_box').show();
		$('#comment_box').hide();
		$('#file').val("");
	}
	
	function deleterecomment(a,b){ //답글 삭제 메소드
		$.ajax({	
         	url: "deleterecomment", type: "post", data:{"commentnum":a}, async: false ,
         	success: function(){},
         	error:function(request,status,error){}
		});
		
		repagebt(1,b);
		RepageCreate(1,b);
		$('#recomment_comment'+b).hide();
		$('#recomment_subform'+b).show();
		$('#recountNum'+b).val("답글"+recommentcount(b));
		
	}
	
	function updateform(){
		$('#comment_box').hide();
		$('#commentupdate_box').show();
		checkcomment();
	}
	
	function Noupdatecomment(){
		$('#comment_box').show();
		$('#commentupdate_box').hide();
	}
	
	function updatereform(a){
		$("#recomment_comment"+a).hide();
		$("#recomment_updateform"+a).show();
	}
	
	function Noupdatereform(a){
		$("#recomment_comment"+a).show();
		$("#recomment_updateform"+a).hide();
	}
	
	
	function updatecomment(){ //댓글 수정 메소드
		
		var gstar = 'url("${pageContext.request.contextPath}/resources/images/grayStar.png")';
		var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
		var imgfile = $('#ufile').val();
		
		var filename = "";
		
		if(checkNull($('#ucomment').val())){
			alert("수정할 내용을 입력해 주세요");
		}else if($('#ustar').val()=="0"){
			alert("별점을 선택해 주세요");
		}else{
			if(imgfile!=""){ 
				if(!imgfile.match(fileForm)) {
			    	alert("jpg,png 파일만 업로드 가능");
			    }else{
			    	var form = $("#ucommentPicture_subform")[0];
					var formData = new FormData(form);
					$.ajax({
						url:"ucommentSerialize", type:"post", data:$("#ucomment_subform").serialize(),  dataType: "text" ,  async: false,
						success: function(data){ filename = data; },
						error:function(request,status,error){}
					});
					
					$.ajax({
						url:"deletefile", type:"post", data:{"filename":filename} , async: false,
						success: function(){},
						error:function(request,status,error){
						}
					});
					
					$.ajax({
						url:"uploadupdate", type:"post", data:formData , enctype: "multipart/form-data", async: false,
						processData: false,contentType: false, cache: false, timeout: 300000,
						success: function(){},
						error:function(request,status,error){
						}
					});
			    }
			}else{
				$.ajax({
					url:"updatecommentNofile", type:"post", data:$("#ucomment_subform").serialize(), async: false,
					success: function(){},
					error:function(request,status,error){}
				});
			}
			
			recentlyComment(1);
			checkcomment();
			Noupdatecomment();
			$('#ufile').val("");
			$('#star6').css("background-image", gstar);
			$('#star7').css("background-image", gstar);
			$('#star8').css("background-image", gstar);
			$('#star9').css("background-image", gstar);
			$('#star10').css("background-image", gstar);
			$('#ustar').val(0);
		}
	}
	
	function updaterecomment(a){ //답글 수정 메소드
		if(checkNull($('#urecomment'+a).val())){
			alert("답글 수정 내용을 입력해 주세요");
		}else{
			$.ajax({
				url:"urecommentSerialize" , type:"post" , data:$("#recomment_updateform"+a).serialize(), async: false ,
				success: function(){},
				error:function(request,status,error){
				} 
			});
			
			repagebt(1,a);
			RepageCreate(1,a);
			Noupdatereform(a);
		
		}
	}
	
	function recommendcount(a){ //특정 추천갯수 가져오기
 		var commentNum = a;
 		var count = 0;
 		
		$.ajax({	
         	url: "recommendCount", type: "post", async: false , dataType: "text", data:{"commentNum":commentNum},
         	success: function(data){count = data;},
         	error:function(request,status,error){}
		});
		
		return count;
	}
	
	function recommendadd(a){ //추천 추가하기
		if(checkmycomment(a)=="1"){
			alert("자기자신의 댓글에는 추천할 수 없습니다.");
		}else{
			var commentNum = a;
	 		var	id = '${user.memId}';
	 		
			if(checkmyRecommend(a)==1){
				$.ajax({ 
 		         	url: "recommendRemove", type: "post", async: false , data:{"id":id , "commentNum":commentNum},
 		         	success: function(){},
 		         	error:function(request,status,error){}
 				});
				
 				$("#commendcount"+a).css('color','black'); // 추천 취소시 꺼멓게
 			}else{
 				$.ajax({ 
 		         	url: "recommendAdd", type: "post", async: false , data:{"id":id , "commentNum":commentNum},
 		         	success: function(){},
 		         	error:function(request,status,error){}
 				});
 				
 				$("#commendcount"+a).css('color','red'); // 추천 입력될시 빨갛게
 			}
			
			$('#commendcount'+a).val("추천"+recommendcount(a));
		}
	}
	
	function checkmycomment(a){ //자기 자신의 댓글인지 확인
		var commentNum = a;
 		var	id = '${user.memId}';
 		var check = 0;
 		
		$.ajax({ 
         	url: "checkmyComment", type: "post", async: false , dataType: "text", data:{"id":id , "commentNum":commentNum},
         	success: function(data){check = data;},
         	error:function(request,status,error){}
		});
		
		return check;
	}
	
	function checkmyRecommend(a){ //해당 댓글에 추천을 눌렀는지 확인
		var commentNum = a;
 		var	id = '${user.memId}';
 		var check = 0;
 		
		$.ajax({ 
         	url: "checkmyReommend", type: "post", async: false , dataType: "text", data:{"id":id , "commentNum":commentNum},
         	success: function(data){check = data;},
         	error:function(request,status,error){}
		});
		
		return check;
	}
	
	function recentlyComment(a){
		pageCreate(a);
		pagebt(a);
	}
	
	function recommendlyComment(a){
		DpageCreate(a);
		Dpagebt(a);
	}
	
</script>
<style type="text/css">

#allsubcommentbox{
	background-color: #DDDDDD;
	padding: 10px;
	padding-left:30px;
}

textarea {
    width: 25em;
    height: 6em;
    resize: none;
}

.onecomment{
   padding-bottom: 20px;
   border-bottom: 1px solid;
}

#pageNumber{
   border-bottom: 4px solid;
   font-size: 1.5em;
   padding-left: 20px;
}

.Sortcomment{
   border-radius: 30px;
    padding: 11px 23px;
    border: solid 3px #FF6600;
    font-size: 1em;
    font-weight: 800;
    margin-left: 10px;
    margin-right: 10px;
}

#Sortbox{
   margin-left: 20px;
   margin-top: 35px;
   margin-bottom: 25px;
}

.recommentbox{
	margin-left: 50px;
	background-color: #CCCCCC;
}

.star{
	width: 30px;
	height: 30px;
	border-style:none;
	background-image: url("${pageContext.request.contextPath}/resources/images/grayStar.png");
	background-size: contain;
	background-color: inherit;
}

a{
	text-decoration: none;
	color: black;
}

#comments > .commentpic{
	width: 400px;
	height: 300px;
}

#comments > .starpic{
	width: 30px;
	height: 30px;
	margin: 2px;
}

.editbutton {
	float: right;
}

.editbutton button{
	margin-left: 10px;
}

.starpic{
	width: 30px;
	height: 30px;
	margin: 2px; 
}

.commentpic{
	width: 400px;
	height: 300px;
}

#commentlist{
	size: 8em;
	background-color: gray;
}

.recommentbox .recomment_comment {
	background-color: #FFFFCC;
}

.recommentbox .recomment_subform {
	background-color: #FFFFCC;
}

.commendcount {
	margin-left: 100px;
}

</style>

</head>
<body>

<%-- 가져올 상품의 번호 : ${param.goodsNo} <br> --%>

<div id="allsubcommentbox">
	<c:choose>
		<c:when test="${sessionScope.user.memId == null}">
		
		</c:when>
		<c:otherwise>
				<div id=commentsub_box>
					<div id=starbox>
						별점:
						<button class="star" id="star1"></button>
						<button class="star" id="star2"></button>
						<button class="star" id="star3"></button>
						<button class="star" id="star4"></button>
						<button class="star" id="star5"></button>
					</div>

					<form id="comment_subform">
						<input id="star" name="star" type="text" value="0"
							style="display: none;"><br> <input id="memId"
							name="memId" type="text" value="${user.memId}"
							style="display: none;"> <input id="goodsNo"
							name="goodsNo" type="text" value="${param.goodsNo}"
							style="display: none;">
						<textarea id="comment" name="comment"></textarea>
						<button type="button" id="submit_comment"
							onclick="insertcomment()">댓글 작성</button>
					</form>

					<form id="commentPicture_subform" enctype="multipart/form-data">
						리뷰사진 첨부 : <input type="file" id="file" name="file"
							accept=".jpg, .png">
					</form>
				</div>
			</c:otherwise>
	</c:choose>
	<div id = comment_box></div>
	
	<div id = commentupdate_box style="display:none">
		<div id = ustarbox>
			별점:<button class="star" id="star6"></button>
			<button class="star" id="star7"></button>
			<button class="star" id="star8"></button>
			<button class="star" id="star9"></button>
			<button class="star" id="star10"></button>
		</div>
		
		<form id="ucomment_subform">
			<input id="ustar" name="star" type="text" value="0" style="display:none;"><br>
			<input id="ucommentNum" name="commentNum" type="text" style="display:none;">
			<textarea id="ucomment" name="comment"></textarea>
			<span id="updatebutton"><button type="button" id="usubmit_comment" onclick="updatecomment()">댓글 수정</button>
			<button type="button" id="nousubmit_comment" onclick="Noupdatecomment()">수정 취소</button></span>
		</form>
		
		<form id="ucommentPicture_subform" enctype="multipart/form-data">
			리뷰사진 첨부:<input type="file" id="ufile" name="ufile" accept=".jpg, .png">
		</form>
	</div>
</div>

<hr>
<div id="Sortbox">
<a class="Sortcomment" href="javascript:;" onclick="recentlyComment(1)">최근 날짜순</a>
<a class="Sortcomment" href="javascript:;" onclick="recommendlyComment(1)">추천순</a>
</div>
<hr>

<div id = "comments"></div>
<div id = "pageNumber"></div>

</body>
</html>