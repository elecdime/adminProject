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

			<h1>게시판 글수정</h1>

			<%
				// String id=(String)session.getAttribute("id");
			//자바파일 객체생성(기억장소할당)하고 getMember(id)메서드 호출
			// MemberDAO memberDAO=new MemberDAO();
			// MemberDTO memberDTO=memberDAO.getMember(id);
			// MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");

			// model.addAttribute("memberDTO", memberDTO);
			%>


			<form action="${pageContext.request.contextPath}/board/bupdatePro"
				method="post">
				<input type="hidden" name="ntcNo" value="${boardDTO.ntcNo }">
				<table border="1">
					<tr>
						<td>작성자</td>
						<td><input type="text" name="memId"
							value="${boardDTO.memId }"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="ntcTitle"
							value="${boardDTO.ntcTitle }"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="ntcCont" rows="10" cols="20">${boardDTO.ntcCont }</textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input class="writeBtn red" type="submit"
							value="글수정"></td>
					</tr>
				</table>
			</form>

		</div>
		<!--notice-->
	</div>
	<!--cuswrap-->
</div>
<!--container-->
<%@ include file="../include/footer.jsp"%>
