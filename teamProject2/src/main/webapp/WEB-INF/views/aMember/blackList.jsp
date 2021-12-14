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
                <span class="btn_ov01"><span class="ov_txt">등록된 블랙리스트</span><span class="ov_num"> <c:out value="${count}"/> </span></span>
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

            <div class="formTitle">블랙리스트 <span>블랙리스트로 등록된 회원입니다.</span></div>

            <div id="listdiv" >

                    <table class="listTbl fixed">
                        <colgroup>
                            <col width="100"><!-- checkbox -->
                            <col width="100"><!-- 번호 -->
                            <col width="740">
                            <col width="50">
                        </colgroup>
                        
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                                <th class="listTitle">아이디</th>
                                <th class="listTitle">이름</th>
                                <th class="listTitle">블랙 사유</th>
                                <th class="listTitle">블랙 해제</th>
                            </tr>
                            
                           <!-- jspl -->
                           <c:forEach items="${blackList}" var = "blackList">
                           
                            <tr>
                                <td class="listData">
                                	<c:out value="${blackList.memId}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${blackList.memNm}" /> 
                                </td>
                                <td class="listData">
                                	<c:out value="${blackList.blackReason}"/>
                                </td>
                                <td> <a href="${pageContext.request.contextPath}/aMember/resetBlack?memId=<c:out value="${blackList.memId}" />">X</a> </td>
                            </tr>
                            
                           </c:forEach>
                        </tbody>
                    </table>
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
