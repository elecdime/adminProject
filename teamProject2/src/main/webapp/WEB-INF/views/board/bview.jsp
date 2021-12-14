<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>


<div id="container">
	<div class="cuswrap innerContent">
		<div class="content_tit">
			<div class="member_tit">
				<h1 class="sub_tit">1:1문의</h1>
			</div>
			<ul class="sub_menu">
				<li><a href="${pageContext.request.contextPath}/board/flist">공지사항</a></li>
				<li class="on"><a
					href="${pageContext.request.contextPath}/board/blist">1:1문의</a></li>
			</ul>
		</div>
		<!--content_tit-->
		<div class="notice">
			<div class="page_info">
				<div class="total">
					총 <em id="r_cnt">${pageDTO.count}</em> 건 (<em class="hilite"
						id="now_page">1</em>/<em id="total_page">1</em>페이지)
				</div>
			</div>

			<h1>게시판 글보기</h1>
			<div class="list con_box">
				<table border="1">
					<tr>
						<td>작성자</td>
						<td>${boardDTO.memId}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>${boardDTO.pass}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${boardDTO.ntcTitle}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${boardDTO.ntcCont}</td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td>${boardDTO.ntcFile}</td>
					</tr>
				</table>
			</div>
			<!--  list con_box  -->

			<div>
				<input class="writeBtn red" type="button" value="글수정"
					onclick="location.href='bupdate?ntcNo=${boardDTO.ntcNo}'">
				<input class="writeBtn gray" type="button" value="글삭제"
					onclick="del(${boardDTO.ntcNo})"> <a class="writeBtn gray"
					href="${pageContext.request.contextPath}/board/blist">목록가기</a>
			</div>

		</div>
		<!--notice-->
	</div>
	<!--cuswrap-->
</div>
<!--container-->

<script>
	function del(ntcNo) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='fdeletePro?ntcNo='+ntcNo;
		}
	}	
</script>


<%@ include file="../include/footer.jsp"%>