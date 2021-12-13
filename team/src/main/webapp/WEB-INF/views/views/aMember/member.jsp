<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GH SHOP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>


<body>

	<%@include file="../inc/head.jsp"%>
        <!--  left menu -->
  	<%@include file="../inc/left.jsp"%>

        <div id="seller_content" class="item3">
            <div class="local_ov01 local_ov">
                <a href="${pageContext.request.contextPath}/aMember/member" class="ov_listall">회원메인</a>
                <a href="${pageContext.request.contextPath}/aMember/blackList" class="ov_listall">블랙리스트</a>
                <span class="btn_ov01"><span class="ov_txt">등록된 회원</span><span class="ov_num"> <c:out value="${count}"/> </span></span>
            </div>

            <form name="flist" class="local_sch01 local_sch" action="${pageContext.request.contextPath}/aMember/searchMemberList" method="POST">

                <label for="sca" class="sound_only">분류선택</label>
                <select name="searchCulumn" id="sca">
                    <option value="memId">ID</option>
                    <option value="memNm">이름</option>
                </select>

                <label for="stx" class="sound_only">검색어</label>
                
                <input type="text" name="searchText" id="stx" class="frm_input">
                <button type="submit" value="검색" class="btn_submit">검색</button>
            </form>

            <div class="formTitle">회원 리스트 <span>검색조건에 해당하는 회원 리스트를 확인 할수 있습니다.</span></div>

            <div id="listdiv">

                <form name="signForm" method="post" onsubmit="return false;">

                    <table class="listTbl fixed">
                        <colgroup>
                            <col width="345"><!-- checkbox -->
                            <col width="100"><!-- 번호 -->
                            <col width="250"><!-- 아이디 -->
                            <col width="295"><!-- 최근방문일 --> <!--  890 -->
                        </colgroup>
                        
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                                <th class="listTitle">아이디</th>
                                <th class="listTitle">이름</th>
                                <th class="listTitle">생년월일</th>
                                <th class="listTitle">전화번호</th>
                            </tr>
                            
                           <!-- jspl -->
                           <c:forEach items="${memberList}" var = "memberList">
                           
                            <tr onclick="location.href='${pageContext.request.contextPath}/aMember/memberInfo?memId=<c:out value="${memberList.memId}"/>'">
                                <td class="listData">
                                	<c:out value="${memberList.memId}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.memNm}" /> 
                                </td>
                                <td class="listData">
                                	<fmt:formatDate value="${memberList.birthDt}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td class="listData">
                                	<c:out value="${memberList.phone}" /> 
                                </td>
                            </tr>
                            
                           </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div><!--  seller_wrap  -->


    <script>
        $(document).ready(function() {
            $(".seller_menu_tit").click(function() {
                $(".seller_menu_con").removeClass('on');
                $(this).parent().find(".seller_menu_con").toggleClass('on');
            });
        });
    </script>

</body></html>
