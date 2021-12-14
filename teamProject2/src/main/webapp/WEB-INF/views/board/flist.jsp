<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="../include/header.jsp"%>

<div id="container">
	<div class="cuswrap innerContent">
		<div class="content_tit">
			<div class="member_tit">
				<h1 class="sub_tit">공지사항</h1>
			</div>
			<ul class="sub_menu">
				<li class="on"><a
					href="${pageContext.request.contextPath}/board/flist">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/board/blist">1:1문의</a></li>
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

			<c:choose>
				<c:when test="${mDTO.memberFA == 'business'}">
					<button class="writeBtn">
						<a href="${pageContext.request.contextPath}/board/fwrite">글쓰기</a>
					</button>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>




			<div class="list con_box">
				<table border="1">
					<colgroup>
						<col class="col_w07">
						<col class="col_w">
						<col class="col_w10">
						<col class="col_w12">
						<col class="col_w10">
						<col class="col_w10">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">첨부</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회</th>
						</tr>
					</thead>

					<c:forEach var="boardDTO" items="${boardList }" varStatus="status">
						<tr>
							<td class="num">${(pageDTO.count-(pageDTO.currentPage-1)*pageDTO.pageSize)-status.index}</td>
							<td class="tit"><a
								href="${pageContext.request.contextPath}/board/fview?ntcNo=${boardDTO.ntcNo }">${boardDTO.ntcTitle }</a></td>
							<td>${boardDTO.ntcFile}</td>
							<td>${boardDTO.memId}</td>
							<td class="date">${boardDTO.regDt}</td>
							<td>${boardDTO.ntcHit}</td>
						</tr>
					</c:forEach>

				</table>
			</div>
			<!--  list con_box  -->

			<div class="pager">
				<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a
						href="${pageContext.request.contextPath}/board/flist?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pageDTO.startPage }"
					end="${pageDTO.endPage }" step="1">
					<a
						href="${pageContext.request.contextPath}/board/flist?pageNum=${i}">${i}
					</a>
				</c:forEach>
				<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
					<a
						href="${pageContext.request.contextPath}/board/flist?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
				</c:if>
			</div>
			<!--pager-->

		</div>
		<!--notice-->
	</div>
	<!--cuswrap-->
</div>
<!--container-->



<%@ include file="../include/footer.jsp"%>
<<script type="text/javascript">
$(function() {
	var timedate = ${boardDTO.regDt};
	var date = timedate.substring(0,10);
	
	$(".date").html(date);
});
</script>
