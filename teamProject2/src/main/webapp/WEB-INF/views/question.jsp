<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>GH SHOP</title>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/sub.css">
<link rel="stylesheet" href="./css/cart.css">
<link rel="stylesheet" href="./css/member.css">
<link rel="stylesheet" href="./css/style.css">
<script src="https://kit.fontawesome.com/dd43a0e2b4.js" crossorigin="anonymous"></script>
<script src="./js/jquery.js"></script>
</head>

<body>
<div id="container">
	<div class="cuswrap innerContent">
		<div class="content_tit">
		<div class="member_tit"><h1 class="sub_tit">1:1문의</h1></div>
		<ul class="sub_menu">
			<li><a href="../board/list.php?bdId=notice">공지사항</a></li>     
			<li><a href="../service/faq.php">FAQ</a></li>
			<li class="on"><a href="../board/list.php?">1:1문의</a></li>
		</ul>
	</div><!--content_tit-->
		<div class="notice">
			<div class="date_check_box">
			<form name="frmSearch" method="get" action="list.php">
				<input type="hidden" name="bdId" value="qa">
				<input type="hidden" name="memNo" value="">
				<input type="hidden" name="noheader" value="">

				<h3> 조회기간 </h3>
				<div class="date_check_list" data-target-name="rangDate[]">
					<button type="button" data-value="0">오늘</button>
					<button type="button" data-value="7" class="on">7일</button>
					<button type="button" data-value="15">15일</button>
					<button type="button" data-value="30">1개월</button>
					<button type="button" data-value="90">3개월</button>
					<button type="button" data-value="365">1년</button>
				</div>
				<!-- //date_check_list -->
				<div class="date_check_calendar">
					<input type="text" id="picker2" name="rangDate[]" class="anniversary js_datepicker" value="">
					<span class="date_line"><em></em></span>
					<input type="text" name="rangDate[]" class="anniversary js_datepicker" value="">
				</div>
				<!-- //date_check_calendar -->

				<button type="submit" class="btn_date_check"><em>조회</em></button>
			</form>
</div>
			<div class="btn_right_box">
			<button type="button" class="btn_write" onclick="gd_btn_write('qa')"><strong>1:1 문의하기</strong></button>
	</div><!--btn_right_box-->
			<div class="list con_box question">
			<table>
				<colgroup>
					<col class="col_w10">
					<col class="col_w12">
					<col class="col_w">
					<col class="col_w10">
					<col class="col_w12">
			   </colgroup>
				<thead>
				<tr>
					<th scope="col">문의날짜</th>
					<th scope="col">카테고리</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">문의상태</th>

				</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021.09.01</td>
						<td>NON</td>
						<td class="tit">
							<a href="">명성코리아 1:1문의 입니다.</a>
						</td>
						<td>NON</td>
						<td>접수</td>
					</tr>
					<tr>
						<td>2021.09.01</td>
						<td>NON</td>
						<td class="tit">
							<a href="">명성코리아 1:1문의 입니다.</a>
						</td>
						<td>NON</td>
						<td>답변완료</td>
					</tr>
				</tbody>
			</table>
	</div><!--list-->
			<div class="pager">
			<ul>
				<li class="arrow mgr"><img src="/images/ico_first.png" alt="처음"></li>
				<li class="arrow mgr"><img src="/images/ico_pre.png" alt="이전"></li>
				<li id="present">1</li>		
				<li class="arrow mgl"><img src="/images/ico_nxt.png" alt="다음"></li>
				<li class="arrow mgl"><img src="/images/ico_last.png" alt="마지막"></li>
			</ul>
</div><!--pager-->
			<div class="seeker">
			<form name="frmList" action="?fn=list&amp;lang=ko" method="post">
				<input name="sel_cate" type="hidden" id="sel_cate" value="">
				<fieldset>
					<legend>검색</legend>
					<label for="sltOption" class="hide">검색카테고리 선택</label>
					<select name="sltOption" id="sltOption" title="검색카테고리 선택">
						<option value="all">All</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select>
					<label for="txtKeyword" class="hide">검색어입력</label>
					<input name="txtKeyword" type="text" id="txtKeyword" class="search_input" value="">
					<span class="btn xs write"><input type="submit" value="검색"></span>
				</fieldset>
			</form>
</div><!--seeker-->
		</div><!--notice-->
	</div><!--cuswrap-->					
</div><!--container-->

</body>
</html>

































