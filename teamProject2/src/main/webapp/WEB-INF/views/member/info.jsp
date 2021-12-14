<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url = "./inc/mypage_top.jsp"/>

		
	
	
		<!-- 회원간단정보 여기부터 -->

		<div class="mypage_con">
			<div class="mypage_left">
			<!-- 왼쪽메뉴 여기부터 -->
			<c:import url = "./inc/sideBar.jsp"/>
			<!-- 왼쪽메뉴 여기까지 -->
			</div>
			<style>
				.box > .box_header > h4 {
					font-size : 20px;
					margin-top : 30px;
					padding : 10px;
					border-bottom : solid 1px #58b8db;
					font-weight: bold;
				}
				
				.box_content {
					padding-left : 30px;
				}
				
				.item_title {
					margin-top: 20px;
				}
				
				.item_title > .item_text {
					display : inline-block;
					font-size : 14px;
					color : #58b8db;
					font-weight: bold;
					margin : 10px;
				}
				
				.item_content > .item_text {
					display : inline-block;
					font-size : 16px;
					font-weight: bold;
					padding : 5px 0;
					margin : 0px 0px 0px 10px;
				}
				
				.item_content:hover > .item_btn {
					display : inline-block;
				}
				
				.sub_text {
					display : inline-block;
					margin-left : 10px;
					font-size : 14px;
					color : #bfbfbf;
				}
				.sub_text:hover {
					color : #919191;
				}
				.item_btn {
					margin-left: 15px;
					display : none;
				}
				
				.item_btn > button {
					padding: 3px 10px;
					border: 2px solid #58b8db;
					border-radius: 10%;
					font-weight: bold;
				}
			</style>
			<div class="mypage_right">
				<div id='printArea'>
				<!-- 본문 여기부터 -->
				<!-- +++++ mypage contents ++++ -->
					<div class="subpage_container">
						<!-- 전체 메뉴 -->
						<div class="my_index_wrap" style="">
							<div class="box">
								<div class="box_header">
									<h4>기본정보 <span class="sub_text">회원님의 기본 정보를 제공합니다.</span></h4>
									<hr>
								</div>
								<div class="box_content">
										<div class="item_title item_container">
											<span class="item_text">아이디</span>
										</div>
										<div class="item_content item_container">
											<span id="user_id" class="item_text">${mDTO.memId}</span>
										</div>
										<div class="item_title item_container">
											<span class="item_text">이름</span>
										</div>
										<div class="item_content item_container">
											<span id = "change_box_name" class="item_text">${mDTO.memNm}</span>
											<span class="item_btn"><button id = "member_update_btn" name = "update_name" onclick="doUpdate(this)">수정</button></span>
										</div>
										<div class="item_title item_container">
											<span class="item_text">가입날짜</span>
										</div>
										<div class="item_content item_container">
											<span class="item_text"><fmt:formatDate value="${mDTO.date}" pattern="yyyy년  MM월  dd일"/></span>
										</div>
								</div>
							</div>
							<div class="box">
								<div class="box_header">
									<h4>상세정보 <span class="sub_text">회원님의 상세 정보를 제공합니다.</span></h4>
									<hr>
								</div>
								<div class="box_content">
									<span>데이터가 없습니다.</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<c:import url = "./inc/mypageBottom.jsp"/>

