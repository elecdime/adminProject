<%@ page language="java" contentType="text/jsp; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>GH SHOP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertSearch.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/dd43a0e2b4.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
</head>
<!-- 추가 -->
 <script type="text/javascript">
    $(function() {
    	   $('#search_form').focus(function() {$('#r_search').show();});
    	   $('#search_form').blur(function() {$('#r_search').hide();});
    	});
	/* 인기검색어 슬라이드로 넘기기  */
    window.onload = function (){	  
		var word = new Array();
		//객체 가져오기
		var ranking = document.getElementById("ranking");
		//Ajax객체 생성
		var request = new XMLHttpRequest();					
		//요청준비
		request.open("get","data/EX7_data.json",true);
		//데이터 요청
		request.send();
		//데이터 수신
		request.onreadystatechange = function(){
			if(request.readyState==5){
				if(request.status==200){
					var obj = JSON.parse(request.responseText); //json객체로 변환
					var str="";
					for(var i=0; i<4; i++){
						str = "["+(i+1)+"]"+obj.search_word[i].name;
						word[i] = str;		//str을 순서대로 배열 형태로 저장
					}
				}
			}	
		}
	    var i=0;	
		var interval = setInterval(function(){	
			if(i>2){		//i가 3이상이되면 반복이 종료되므로 
				i=0;		//다시 i를 0으로 초기화
			}
		 	ranking.innerjsp = "<h3>" + word[i] + "</h3>";
		  	i++;	  
		  }, 2000);			//2초마다 갱신
		  
		  setTimeout(function(){
		   	   clearInterval(interval);
		  }, 20000); 		//20초후 정지	
	}
    </script>
    
	<style type="text/css">
	/* 검색엔진 팝업 */
	.row li{
	list-style: none;
	line-height: 50px;
	}
	.row li a{
	width: 200px; border: 2px solid #9ee9cf; 
	border-radius: 20px; text-decoration: none; padding:10px; color: black;}
	#r_search{position: absolute;
             width: 530px;  min-height:50px; border-radius: 25px; box-sizing: border-box; padding: 0 71px 0 31px; !important; 
	}
	#bottomcard{
	background-color: #1ec68c;
	text-align: right;
	width: 100%;
	color: white;
	font-weight: bolder;
	}
	#search_form{
	display: flex;
	}
	.hot-Search{
		width: 200px;
	}
	</style>
<body>
    <div id="mainLayout">
        <header id="header">
            <div id="util">
                <div class="innerContent flex">
                    <div class="qbtn">
                        <ul>
                            <li class="tab01">
                                <a href="">즐겨찾기<span class="icon_bookmark"></span></a>
                            </li>
                            <li class="tab02">
                                <a href="${pageContext.request.contextPath}/notice.jsp">GH SHOP CUSTOMER</a>
                            </li>
                        </ul>
                    </div>
                    <div class="util_menu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
                            <li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
                            <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                            <li><a href="${pageContext.request.contextPath}/notice">고객센터</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="mid">
                <div class="innerContent">
                    <div id="layout_side" class="mobile layout_side">
                        <div class="mo_buger">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="menuSide">

                            <div class="close">
                                <span></span>
                                <span></span>
                            </div>

                            <div class="aside_userinformation">
                                <ul class="btn_nm">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login.jsp" class="btn_login">로그인</a>
                                        <a href="${pageContext.request.contextPath}/join.jsp" class="btn_join">회원가입</a>
                                    </li>
                                </ul>
                                <div class="log_noti">회원이 되시면 <br>다양한 혜택과 할인, 이벤트에 참여하실 수 있습니다.</div>
                            </div>

                            <div class="asie_main_menu">
                                <ul>
                                    <li class="am_my">
                                        <a href="/member/login?return_url=/mypage/index" class="aside_icon mypage"><span>마이페이지</span></a>
                                    </li>
                                    <li class="am_order"><a href="/mypage/order_catalog" class="aside_icon delivery"><span>주문/배송조회</span></a></li>
                                    <li class="am_wish">
                                        <a href="/member/login?return_url=/mypage/wish" class="aside_icon wish"><span>관심상품</span> </a>
                                    </li>
                                    <li class="am_cart"><a href="/order/cart" class="aside_icon cart"><span>장바구니</span> </a></li>
                                </ul>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/sub_new.jsp" target="_blank">NEW</a></li>
                                    <li><a href="${pageContext.request.contextPath}/sub_best.jsp">TOP100</a></li>
                                    <li><a href="">이용안내</a></li>
                                    <li><a href="${pageContext.request.contextPath}/sub_live.jsp">라이브쇼핑</a></li>
                                </ul>
                            </div>
                            <div class="aside_menu1">
                                
                            </div>
                            <!--aside_menu2-->

                            <div class="aside_navigation_wrap">
                                <div class="aside_title">카테고리</div>
                                <!-- ++++++++ 카테고리 ++++++++ -->
                                <ul id="categorySideMenu" class="menu">
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            건강기능식품
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            건강가공식품
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            가공식품
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon3">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            잡화
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            기타상품
                                        </a>
                                    </li>
                                    <li class="mitem category mitem_category mitemicon1">
                                        <a class="mitem_title" href="" target="_self"></a>
                                        <a class="mitem_goodsview" href="">
                                            사은품
                                        </a>
                                    </li>
                                </ul>
                                <!-- ++++++++ //카테고리 ++++++++ -->
                            </div>
                            <!--aside_navigation_wrap-->

                            <div class="right_cs">
                                <div class="tle">고객 센터</div>
                                <b>070-123-4567</b>
                                <div class="info info1">
                                    평일 : AM10:00 ~ PM17:00<br>
                                    점심 : PM12:00 ~ PM1:00<br>
                                    주말 및 공휴일 휴무
                                    <a href="" class="kakach"><img src="${pageContext.request.contextPath}/resources/images/kakach.jpg"></a>
                                </div>
                                <div class="tle">계좌 안내</div>
                                <div class="info info2">
                                    <img src="${pageContext.request.contextPath}/resources/images/qbnk.png">
                                    <strong>051-04542-5224-1</strong>
                                    예금주：아이티윌
                                </div>
                            </div>
                            <!-right_cs--->
                                <div class="aside_menu3">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/notice.jsp">공지사항</a></li>
                                        <li><a href="">EVENT</a></li>
                                    </ul>
                                </div>
                                <!--aside_menu3-->

                        </div><!-- mobile -->
                        <div class="menuBG"></div>

                    </div>
                    <!--mobile layout_side-->

                    <h1 class="hlogo">
                        <a href="${pageContext.request.contextPath}/main">GH SH<span>O</span>P</a>
                    </h1>
					 <!-- 인기검색어 -->
                            <table class="hot-Search">
								<tr>
									<td class="td1"><h2>실시간 검색 순위</h2></td>
									<td class="td2"><div id="ranking">${searchDTO.keyword}</div></td>
								</tr>
							</table>
                            <!--  -->
                    <div class="top_search">
                        <form name="frmSearchTop" id="frmSearchTop" action="${pageContext.request.contextPath}/mainPro" method="get" novalidate="novalidate">
                            <input type="hidden" name="adUrl" value="">
                            <fieldset>
                                <legend>검색폼</legend>
                                <div class="top_search_cont">
                                    <div class="top_text_cont">
                                        <input type="text" id="search_form" name="keyword" class="top_srarch_text" title="라이프앤밸러스 일상생활에 활력을" placeholder="라이프앤밸러스 일상생활에 활력을" autocomplete="off"
                                       value="${keyword}" >
                                        <input type="image" src="${pageContext.request.contextPath}/resources/images/search_bt.png" id="btnSearchTop" class="btn_top_srarch" title="검색" value="검색" alt="검색"
                                        >
                                   
                    <!-- Side widget-->
                                    </div>
                                    <!-- //top_text_cont -->
                                </div>
                                <!-- //top_search_cont -->
                            </fieldset>
                        </form>
                        <!-- 검색필터 추가 -->
                                  
				                    <div class="card mb-4" id="r_search" style="display: none;">
				                        <div class="card-header">추천검색어</div>
				                        <div class="card-body">
				                            <div class="row">
				                                <div class="col-sm-4">
				                                    <ul class="search-list">
				                                        <li><a href="#!">검색어1</a></li>
				                                        <li><a href="#!">검색어2</a></li>
				                                        <li><a href="#!">검색어3</a></li>
				                                    </ul>
				                                </div>
				                                <div class="col-sm-4">
				                                    <ul class="list-unstyled mb-0">
				                                        <li><a href="#!">검색어4</a></li>
				                                        <li><a href="#!">검색어5</a></li>
				                                        <li><a href="#!">검색어6</a></li>
				                                    </ul>
				                                    
				                                </div>
				                                <div class="col-sm-4">
				                                    <ul class="list-unstyled mb-0">
				                                        <li><a href="#!">검색어4</a></li>
				                                        <li><a href="#!">검색어5</a></li>
				                                        <li><a href="#!">검색어6</a></li>
				                                    </ul>
				                                    
				                                </div>
				                            </div>
				                        </div>
				                        <div class="card-header" id="bottomcard" onclick="href='#'">브랜드검색</div>
				                    </div>
				             <!-- //검색필터 추가 -->
                    </div>

                    <div class="buttonArea">
                        <ul>                           
                            <li><a href="${pageContext.request.contextPath}/cart.jsp" class="cart">장바구니<span class="count">0</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="gnbw">
                <div class="innerContent">
                    <div id="categoryAll">
                        <a>
                            <div class="h_buger">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                            전체카테고리
                        </a>
                        <div class="categoryAll_abs">
                            <ul>
                                <li class="cate6">
                                    <a href="${pageContext.request.contextPath}/sub.jsp">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_ii.png">
                                        </span>
                                        <span class="ca_t">전체상품</span>

                                    </a>
                                </li>
                                <li class="cate0">
                                    <a href="">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i0.png">
                                        </span>
                                        <span class="ca_t">건강기능식품</span>
                                    </a>
                                    <ol>
                                        <li><a href="#">submen</a></li>
                                        <li><a href="#">submen</a></li>
                                        <li><a href="#">submen</a></li>
                                        <li><a href="#">submen</a></li>
                                        <li><a href="#">submen</a></li>
                                        <li><a href="#">submen</a></li>
                                    </ol>
                                </li>
                               
                                <li class="cate2">
                                    <a href="">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i2.png">
                                        </span>
                                        <span class="ca_t">가공식품</span>
                                    </a>
                                </li>
                                <li class="cate3">
                                    <a href="">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i3.png">
                                        </span>
                                        <span class="ca_t">잡화</span>
                                    </a>
                                </li>
                                <li class="cate4">
                                    <a href="">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i4.png">
                                        </span>
                                        <span class="ca_t">기타상품</span>
                                    </a>
                                </li>
                                <li class="cate5">
                                    <a href="">
                                        <span class="ca_i">
                                            <img src="${pageContext.request.contextPath}/resources/images/ca_i5.png">
                                        </span>
                                        <span class="ca_t">사은품</span>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="gnbMenu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/sub.jsp" target="_blank">NEW</a></li>
                            <li><a href="${pageContext.request.contextPath}/sub_best.jsp">TOP 100</a></li>
                        </ul>
                    </div>
                    <div class="gnbLive">
                        <a href="${pageContext.request.contextPath}/sub_live.jsp">라이브쇼핑</a><span>LIVE</span>
                    </div>
                </div>
            </div>
        </header><!-- header -->
        <div id="container">
            <div id="main_visual">
                <!-- 메인 키비주얼 -->
                <div class="swiper-container swiper01 cboth swiper-container-initialized swiper-container-horizontal">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_01.jpg" class="pc"></a>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_01_m.jpg" class="mo"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_02.jpg" class="pc"></a>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_02_m.jpg" class="mo"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_03.jpg" class="pc"></a>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_03_m.jpg" class="mo"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_01.jpg" class="pc"></a>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_01_m.jpg" class="mo"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_02.jpg" class="pc"></a>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/images/main_02_m.jpg" class="mo"></a>
                        </div>
                    </div><!-- //swiper-wrapper -->

                    <div class="swiper-pagination swiper-pagination1 move"></div>
                    <!--<div class="swiper-button-next swiper-button-next-main"></div>
			<div class="swiper-button-prev swiper-button-prev-main"></div>-->
                </div><!-- //swiper01 -->
            </div><!-- main_visual -->
            <div id="favmenu" class="innerContent">
                <div class="main_title">
                    <strong>즐겨찾는 카테고리</strong>
                </div>

                <div class="top-fav-list">
                    <ul>
                        <li>
                            <a href=""><span class="icon"><img src="${pageContext.request.contextPath}/resources/images/fav_icon01.jpg" alt=""></span>
                                <span class="tit">주문/배송조회</span>
                            </a>
                        </li>
                        <li>
                            <a href=""><span class="icon"><img src="${pageContext.request.contextPath}/resources/images/fav_icon03.jpg" alt=""></span>
                                <span class="tit">마이페이지</span>
                            </a>
                        </li>
                        <li>
                            <a href=""><span class="icon"><img src="${pageContext.request.contextPath}/resources/images/fav_icon04.jpg" alt=""></span>
                                <span class="tit">장바구니</span>
                            </a>
                        </li>
                        <li>
                            <a href=""><span class="icon"><img src="${pageContext.request.contextPath}/resources/images/fav_icon05.jpg" alt=""></span>
                                <span class="tit">1:1문의</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="top-log-list">
                    <ul>
                        <li>
                            <a href=""><span class="icon"><img src="${pageContext.request.contextPath}/resources/images/favlog_icon01.png" alt=""></span>
                                <span class="tit">로그인</span>
                            </a>
                        </li>
                        <li>
                            <a href=""><span class="icon"><img src="${pageContext.request.contextPath}/resources/images/favlog_icon02.png" alt=""></span>
                                <span class="tit">셀러 로그인</span>
                            </a>
                        </li>
                        <li>
                            <a href=""><span class="icon"><img src="${pageContext.request.contextPath}/resources/images/favlog_icon03.png" alt=""></span>
                                <span class="tit bgcolor">회원가입</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div><!-- 즐겨찾는 카테고리  -->

            <div class="main_newpro_wrap innerContent">
                <div class="main_title">
                    <a href=""><strong>오늘의 신상품</strong></a>
                    <p>새로 입고된 제품을 확인해보세요</p>
                </div>
                <div class="item-display-wrap">
                    <div class="item-display type-cart clear cboth">
                        <div class="swiper proslide01 list innerContent">
                            <ul class="swiper-wrapper">
                                <li class="swiper-slide line_4">
                                    <div class="space">
                                        <div class="PJ_goods_border">
                                            <div class="thumbnail">
                                                <a href="/prodDetail.php" target="_self"></a>
                                                <img src="${pageContext.request.contextPath}/resources/images/proimg1.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                <span class="hot"></span>
                                                <span class="choice">
                                                    <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                </span>

                                            </div>
                                            <div class="txt">
                                                <a href="/prodDetail.php"><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                            </div>
                                            <div class="desc">
                                                <div class="type">
                                                    상품타입 <span class="s1">자율</span>
                                                </div>
                                                <div class="code">
                                                    상품코드 <span>W4A7D57</span>
                                                </div>
                                            </div>
                                            <div class="price gd-default">
                                                <span class="cost">
                                                    <strong>13,800<em class="pr_unit">원</em></strong>
                                                </span>
                                                <span class="del">17,250원 </span>
                                                <div class="dc_per">20%</div>
                                                <br>
                                            </div>
                                            <div class="tag-box">
                                                <span class="tag-type2">SALE</span>
                                                <span class="tag-type3">무료배송</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="swiper-slide line_4">
                                    <div class="space">
                                        <div class="PJ_goods_border">
                                            <div class="thumbnail">
                                                <a href="/prodDetail.php"></a>
                                                <img src="${pageContext.request.contextPath}/resources/images/proimg2.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                <span class="hot"></span>
                                                <span class="choice">
                                                    <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                </span>
                                            </div>
                                            <div class="txt">
                                                <a href="/prodDetail.php"><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                            </div>
                                            <div class="desc">
                                                <div class="type">
                                                    상품타입 <span class="s1">자율</span>
                                                </div>
                                                <div class="code">
                                                    상품코드 <span>W4A7D57</span>
                                                </div>
                                            </div>
                                            <div class="price gd-default">
                                                <span class="cost">
                                                    <strong>13,800<em class="pr_unit">원</em></strong>
                                                </span>
                                                <span class="del">17,250원 </span>
                                                <div class="dc_per">20%</div>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="swiper-slide line_4">
                                    <div class="space">
                                        <div class="PJ_goods_border">
                                            <div class="thumbnail">
                                                <a href="/prodDetail.php" target="_self"></a>
                                                <img src="${pageContext.request.contextPath}/resources/images/proimg3.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                <span class="hot"></span>
                                                <span class="choice">
                                                    <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                </span>
                                            </div>
                                            <div class="txt">
                                                <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                            </div>
                                            <div class="desc">
                                                <div class="type">
                                                    상품타입 <span class="s2">준수</span>
                                                </div>
                                                <div class="code">
                                                    상품코드 <span>W4A7D57</span>
                                                </div>
                                            </div>
                                            <div class="price gd-default">
                                                <span class="cost">
                                                    <strong>13,800<em class="pr_unit">원</em></strong>
                                                </span>
                                                <span class="del">17,250원 </span>
                                                <div class="dc_per">20%</div>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="swiper-slide line_4">
                                    <div class="space">
                                        <div class="PJ_goods_border">
                                            <div class="thumbnail">
                                                <a href="/prodDetail.php" target="_self"></a>
                                                <img src="${pageContext.request.contextPath}/resources/images/proimg4.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                <span class="hot"></span>
                                                <span class="choice">
                                                    <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                </span>
                                            </div>
                                            <div class="txt">
                                                <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                            </div>
                                            <div class="desc">
                                                <div class="type">
                                                    상품타입 <span class="s1">자율</span>
                                                </div>
                                                <div class="code">
                                                    상품코드 <span>W4A7D57</span>
                                                </div>
                                            </div>
                                            <div class="price gd-default">
                                                <span class="cost">
                                                    <strong>13,800<em class="pr_unit">원</em></strong>
                                                </span>
                                                <span class="del">17,250원 </span>
                                                <div class="dc_per">20%</div>
                                                <br>
                                            </div>
                                            <div class="tag-box">
                                                <span class="tag-type2">SALE</span>
                                                <span class="tag-type3">무료배송</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="swiper-slide line_4">
                                    <div class="space">
                                        <div class="PJ_goods_border">
                                            <div class="thumbnail">
                                                <a href="/prodDetail.php" target="_self"></a>
                                                <img src="${pageContext.request.contextPath}/resources/images/proimg3.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                <span class="hot"></span>
                                                <span class="choice">
                                                    <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                </span>
                                            </div>
                                            <div class="txt">
                                                <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                            </div>
                                            <div class="desc">
                                                <div class="type">
                                                    상품타입 <span class="s2">준수</span>
                                                </div>
                                                <div class="code">
                                                    상품코드 <span>W4A7D57</span>
                                                </div>
                                            </div>
                                            <div class="price gd-default">
                                                <span class="cost">
                                                    <strong>13,800<em class="pr_unit">원</em></strong>
                                                </span>
                                                <span class="del">17,250원 </span>
                                                <div class="dc_per">20%</div>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="swiper-slide line_4">
                                    <div class="space">
                                        <div class="PJ_goods_border">
                                            <div class="thumbnail">
                                                <a href="/prodDetail.php" target="_self"></a>
                                                <img src="${pageContext.request.contextPath}/resources/images/proimg4.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                <span class="hot"></span>
                                                <span class="choice">
                                                    <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                </span>
                                            </div>
                                            <div class="txt">
                                                <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                            </div>
                                            <div class="price gd-default">
                                                <span class="cost">
                                                    <strong>13,800<em class="pr_unit">원</em></strong>
                                                </span>
                                                <span class="del">17,250원 </span>
                                                <div class="dc_per">20%</div>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div><!-- proslide01 -->
                        <div class="swiper-button-next swiper-button-next-pro"></div>
                        <div class="swiper-button-prev swiper-button-prev-pro"></div>
                    </div><!-- item-display -->
                </div><!-- item-display-wrap -->
            </div><!-- 신상품 슬라이드 -->

            <div id="main_bn01">
                <a href="" class="pc_only"><img src="${pageContext.request.contextPath}/resources/images/main_bn01_pc.jpg" alt="메인 띠배너"></a>
                <a href="" class="mo_only"><img src="${pageContext.request.contextPath}/resources/images/main_bn01_mo.jpg" alt="메인 띠배너"></a>
            </div><!-- 메인 띠배너 -->

            <div class="main_hotpro_wrap innerContent">
                <div class="main_title">
                    <a href=""><strong>인기상품</strong></a>
                    <p>새로 입고된 제품을 확인해보세요</p>
                </div>
                <div class="item-display-wrap ">
                    <div class="item-display type-cart clear cboth">
                        <div class="itemlist_wrap">
                            <div class="tab_btn">
                                <p class="active"><span>건강기능식품</span></p>
                                <p><span>가공식품</span></p>
                                <p><span>신선식품</span></p>
                                <p><span>차/티백</span></p>
                                <p><span>생활잡화</span></p>
                            </div>
                            <div class="tab_con_wrap">
                                <div class="tab_con active">
                                    <div class="swiper proslide01 list innerContent">
                                        <ul class="swiper-wrapper">
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg1.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                        <div class="tag-box">
                                                            <span class="tag-type2">SALE</span>
                                                            <span class="tag-type3">무료배송</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg2.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s2">준수</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg3.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                        <div class="tag-box">
                                                            <span class="tag-type2">SALE</span>
                                                            <span class="tag-type3">무료배송</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg4.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s2">준수</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div><!-- proslide01 -->
                                    <div class="swiper-button-next swiper-button-next-pro"></div>
                                    <div class="swiper-button-prev swiper-button-prev-pro"></div>
                                </div>
                                <div class="tab_con">
                                    <div class="swiper proslide01 list innerContent">
                                        <ul class="swiper-wrapper">
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg8.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg5.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s2">준수</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                        <div class="tag-box">
                                                            <span class="tag-type2">SALE</span>
                                                            <span class="tag-type3">무료배송</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg6.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                        <div class="tag-box">
                                                            <span class="tag-type2">SALE</span>
                                                            <span class="tag-type3">무료배송</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg7.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s2">준수</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="swiper-button-next swiper-button-next-pro"></div>
                                    <div class="swiper-button-prev swiper-button-prev-pro"></div>
                                </div>
                                <div class="tab_con">
                                    <div class="swiper proslide01 list innerContent">
                                        <ul class="swiper-wrapper">
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href="/prodDetail.php" target="_self"></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg1.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                        <div class="tag-box">
                                                            <span class="tag-type2">SALE</span>
                                                            <span class="tag-type3">무료배송</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg2.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s2">준수</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                        <div class="tag-box">
                                                            <span class="tag-type2">SALE</span>
                                                            <span class="tag-type3">무료배송</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg3.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg4.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s2">준수</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                        <div class="tag-box">
                                                            <span class="tag-type2">SALE</span>
                                                            <span class="tag-type3">무료배송</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="swiper-button-next swiper-button-next-pro"></div>
                                    <div class="swiper-button-prev swiper-button-prev-pro"></div>
                                </div>
                                <div class="tab_con">
                                    <div class="swiper proslide01 list innerContent">
                                        <ul class="swiper-wrapper">
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg5.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg6.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg7.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s2">준수</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg8.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="swiper-button-next swiper-button-next-pro"></div>
                                    <div class="swiper-button-prev swiper-button-prev-pro"></div>
                                </div>
                                <div class="tab_con">
                                    <div class="swiper proslide01 list innerContent">
                                        <ul class="swiper-wrapper">
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg6.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg2.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s2">준수</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg5.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="swiper-slide line_4">
                                                <div class="space">
                                                    <div class="PJ_goods_border">
                                                        <div class="thumbnail">
                                                            <a href=""></a>
                                                            <img src="${pageContext.request.contextPath}/resources/images/proimg7.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                            <span class="hot"></span>
                                                            <span class="choice">
                                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                            </span>
                                                        </div>
                                                        <div class="txt">
                                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                        </div>
                                                        <div class="desc">
                                                            <div class="type">
                                                                상품타입 <span class="s1">자율</span>
                                                            </div>
                                                            <div class="code">
                                                                상품코드 <span>W4A7D57</span>
                                                            </div>
                                                        </div>
                                                        <div class="price gd-default">
                                                            <span class="cost">
                                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                                            </span>
                                                            <span class="del">17,250원 </span>
                                                            <div class="dc_per">20%</div>
                                                            <br>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="swiper-button-next swiper-button-next-pro"></div>
                                    <div class="swiper-button-prev swiper-button-prev-pro"></div>
                                </div>
                            </div>
                        </div>
                        <!--.itemlist_wrap-->
                    </div><!-- item-display -->
                </div><!-- item-display-wrap -->
            </div><!-- 인기상품 슬라이드  -->

            <div class="main_video_wrap">
                <div class="inner">
                    <h1 class="tit">
                        GH SHOP
                        <span class="txtSub">새로운 삶의 시작을 함께합니다</span>
                    </h1>

                    <div class="main-video">
                        <!--<span class="videoimg"><img src="${pageContext.request.contextPath}/resources/images/videoimg.png" alt=""></span>-->
                        <div id="player">
                            <img src="${pageContext.request.contextPath}/resources/images/videoimg.png" alt="" class="img">
                            <div class="iframe">
                                <iframe width="100%" height="100%" src="https://www.youtube.com/embed/J0y843Qtucs?rel=0&amp;autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                        </div>
                        <button type="button" class="play">
                            <img src="${pageContext.request.contextPath}/resources/images/main_play_btn.png" alt="">
                        </button>
                    </div>
                </div>
            </div><!-- 메인 동영상  -->

            <div class="main_bestpro_wrap innerContent">
                <div class="main_title">
                    <a href="#"><strong>주간 BEST</strong></a>
                    <p>새로 입고된 제품을 확인해보세요</p>

                </div>
                <div class="item-display-wrap">
                    <div class="item-display">
                        <div class="item-best01">
                            <div class="list">
                                <ul class="">
                                    <li class="line_1">
                                        <div class="space">
                                            <div class="PJ_goods_border">
                                                <div class="thumbnail">
                                                    <a href=""></a>
                                                    <img src="${pageContext.request.contextPath}/resources/images/proimg1.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                    <span class="hot"></span>
                                                    <span class="choice">
                                                        <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                    </span>
                                                </div>
                                                <div class="txt">
                                                    <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                </div>

                                                <div class="price gd-default">
                                                    <span class="cost">
                                                        <strong>13,800<em class="pr_unit">원</em></strong>
                                                    </span>
                                                    <span class="del">17,250원 </span>
                                                    <div class="dc_per">20%</div>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="item-best02">
                            <div class="list">
                                <ul class="">
                                    <li class="line_2">
                                        <div class="space">
                                            <div class="PJ_goods_border">
                                                <div class="thumbnail">
                                                    <a href=""></a>
                                                    <img src="${pageContext.request.contextPath}/resources/images/proimg3.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                    <span class="hot"></span>
                                                    <span class="choice">
                                                        <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                    </span>
                                                </div>
                                                <div class="txt">
                                                    <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                </div>
                                                <div class="price gd-default">
                                                    <span class="cost">
                                                        <strong>13,800<em class="pr_unit">원</em></strong>
                                                    </span>
                                                    <span class="del">17,250원 </span>
                                                    <div class="dc_per">20%</div>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="line_2">
                                        <div class="space">
                                            <div class="PJ_goods_border">
                                                <div class="thumbnail">
                                                    <a href=""></a>
                                                    <img src="${pageContext.request.contextPath}/resources/images/proimg4.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                    <span class="hot"></span>
                                                    <span class="choice">
                                                        <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                    </span>
                                                </div>
                                                <div class="txt">
                                                    <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                </div>
                                                <div class="price gd-default">
                                                    <span class="cost">
                                                        <strong>13,800<em class="pr_unit">원</em></strong>
                                                    </span>
                                                    <span class="del">17,250원 </span>
                                                    <div class="dc_per">20%</div>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </li><br>
                                    <li class="line_2">
                                        <div class="space">
                                            <div class="PJ_goods_border">
                                                <div class="thumbnail">
                                                    <a href=""></a>
                                                    <img src="${pageContext.request.contextPath}/resources/images/proimg2.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                    <span class="hot"></span>
                                                    <span class="choice">
                                                        <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                    </span>
                                                </div>
                                                <div class="txt">
                                                    <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                </div>
                                                <div class="price gd-default">
                                                    <span class="cost">
                                                        <strong>13,800<em class="pr_unit">원</em></strong>
                                                    </span>
                                                    <span class="del">17,250원 </span>
                                                    <div class="dc_per">20%</div>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="line_2">
                                        <div class="space">
                                            <div class="PJ_goods_border">
                                                <div class="thumbnail">
                                                    <a href=""></a>
                                                    <img src="${pageContext.request.contextPath}/resources/images/proimg6.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                    <span class="hot"></span>
                                                    <span class="choice">
                                                        <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                    </span>
                                                </div>
                                                <div class="txt">
                                                    <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                                </div>
                                                <div class="price gd-default">
                                                    <span class="cost">
                                                        <strong>13,800<em class="pr_unit">원</em></strong>
                                                    </span>
                                                    <span class="del">17,250원 </span>
                                                    <div class="dc_per">20%</div>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- 주간 베스트상품  -->

           <div id="main_bn02">
                <a href="" class="pc_only"><img src="${pageContext.request.contextPath}/resources/images/main_bn02_pc.jpg" alt="메인 띠배너"></a>
                <a href="" class="mo_only"><img src="${pageContext.request.contextPath}/resources/images/main_bn02_mo.jpg" alt="메인 띠배너"></a>
            </div><!-- 메인 띠배너 -->

            <div class="main_live_wrap innerContent">
                <div class="main_title">
                    <strong>라이브쇼핑</strong>
                    <p>새로 입고된 제품을 확인해보세요</p>
                </div>
                <div class="item-display-wrap">
                    <div class="item-display type-cart clear">
                        <div class="list clear">
                            <ul class="clear">
                                <li class="line_3">
                                    <div class="space">
                                        <div class="thumbnail">

                                            <div class="onair-timer clear">
                                                <span class="label prev">8/12(목)</span>
                                                <span class="timer" id="dtvLeftTime">00 : 34 : 35</span>
                                            </div>
                                            <a href="" class="blackbg"><img src="${pageContext.request.contextPath}/resources/images/livebtn.png" class="livebtn"></a>
                                            <img src="${pageContext.request.contextPath}/resources/images/proimg1.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                            <span class="hot"></span>
                                            <span class="choice">
                                                <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                            </span>
                                        </div>
                                        <div class="txt">
                                            <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                        </div>
                                        <div class="desc">
                                            <div class="type">
                                                상품타입 <span class="s2">준수</span>
                                            </div>
                                            <div class="code">
                                                상품코드 <span>W4A7D57</span>
                                            </div>
                                        </div>
                                        <div class="price gd-default">
                                            <span class="cost">
                                                <strong>13,800<em class="pr_unit">원</em></strong>
                                            </span>
                                            <span class="del">17,250원 </span>
                                            <div class="dc_per">20%</div>
                                            <br>
                                        </div>
                                    </div>
                                </li>
                                <li class="line_3">
                                    <div class="space">
                                        <div class="PJ_goods_border">
                                            <div class="thumbnail">
                                                <div class="onair-timer clear">
                                                    <span class="label live">ON AIR</span>
                                                    <span class="timer" id="dtvLeftTime">00 : 34 : 35</span>
                                                </div>
                                                <a href="" class="blackbg"><img src="${pageContext.request.contextPath}/resources/images/livebtn.png" class="livebtn"></a>
                                                <img src="${pageContext.request.contextPath}/resources/images/proimg2.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                <span class="hot"></span>
                                                <span class="choice">
                                                    <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                </span>
                                            </div>
                                            <div class="txt">
                                                <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                            </div>
                                            <div class="desc">
                                                <div class="type">
                                                    상품타입 <span class="s1">자율</span>
                                                </div>
                                                <div class="code">
                                                    상품코드 <span>W4A7D57</span>
                                                </div>
                                            </div>
                                            <div class="price gd-default">
                                                <span class="cost">
                                                    <strong>13,800<em class="pr_unit">원</em></strong>
                                                </span>
                                                <span class="del">17,250원 </span>
                                                <div class="dc_per">20%</div>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="line_3">
                                    <div class="space">
                                        <div class="PJ_goods_border">
                                            <div class="thumbnail">
                                                <div class="onair-timer clear">
                                                    <span class="label next">8/12(목)</span>
                                                    <span class="timer" id="dtvLeftTime">00 : 34 : 35</span>
                                                </div>
                                                <a href="" class="blackbg"><img src="${pageContext.request.contextPath}/resources/images/livebtn.png" class="livebtn"></a>
                                                <img src="${pageContext.request.contextPath}/resources/images/proimg3.jpg" alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중" class="middle">
                                                <span class="hot"></span>
                                                <span class="choice">
                                                    <button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
                                                </span>
                                            </div>
                                            <div class="txt">
                                                <a href=""><strong>5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중</strong></a>
                                            </div>
                                            <div class="desc">
                                                <div class="type">
                                                    상품타입 <span class="s1">자율</span>
                                                </div>
                                                <div class="code">
                                                    상품코드 <span>W4A7D57</span>
                                                </div>
                                            </div>
                                            <div class="price gd-default">
                                                <span class="cost">
                                                    <strong>13,800<em class="pr_unit">원</em></strong>
                                                </span>
                                                <span class="del">17,250원 </span>
                                                <div class="dc_per">20%</div>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!-- .item-display-wrap -->
            </div><!-- .라이브쇼핑 wrap -->


        </div><!-- container -->
        <footer id="footer">
            <div class="con1">
                <div class="innerContent">
                    <div class="customInfo">
                        <h3>고객센터</h3>
                        <dl>
                            <dt>상담시간</dt>
                            <dd>
                                <span class="day">(<em>10:00 ~ 17:00</em>, 주말.공휴일 휴무)</span>
                                <span aria-label="전화번호" class="phoneNum">070-4196-0927</span>
                            </dd>
                        </dl>
                        <a href="" role="button" class="fbtn">자주묻는 질문</a>
                        <a href="" role="button" class="fbtn">1:1문의</a>
                    </div><!-- //customInfo -->
                    <div class="bankInfo">
                        <h3>입금계좌</h3>
                        <div>
                            <p><img src="${pageContext.request.contextPath}/resources/images/bnk.png"></p>
                            <p class="banknum">101-2076-9077-04</p>
                            <p class="bankname">GH SHOP</p>
                        </div>
                    </div><!-- //bankInfo -->
                    <div class="noticeInfo">
                        <div id="noticeTab01" class="tabContentWrap tabON">
                            <h3 class="hidden">공지사항</h3>
                            <ul class="noticeList">

                                <li>
                                    <a href="">
                                        <span>[긴급][중요]상품명 절대 준수상품 - 키워드 주의 상품 </span><em>2021.08.20</em>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>[리뉴얼안내]4074_뉴트로웨이 WPC 500g외1건</span><em>2021.08.20</em>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>발주시간 안내-6월4일자 업데이트</span><em>2021.08.20</em>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>[필독] ★상품명절대준수★ 품목 관련 사항</span><em>2021.08.20</em>
                                    </a>
                                </li>
                            </ul>
                            <a href="" class="txtLink lineU">더보기</a>
                        </div>
                    </div><!-- //noticeInfo -->
                </div>
            </div>
            <div class="copyArea">
                <div class="copyLink">
                    <ul>
                        <li><a href="">회사소개</a></li>
                        <li><a href="/etc/terms">서비스 이용약관</a></li>
                        <li><a href="/etc/privacy" class="notoM">개인정보처리방침</a></li>
                        <li><a href="#">카카톡문의</a></li>
                        <li><a href="">입점문의</a></li>
                        <li><a href="">오시는 길</a></li>
                    </ul>
                </div>
                <div class="copyRight">
                    <!-- 20200428 수정 -->
                    <div class="copyInfo">
                        <em class="noLine">GH SHOP</em>
                        <em>주소: 부산광역시 &amp;GH SHOP</em>
                        <em>대표: 홍길동</em>
                        <em>제휴문의 : 070-1234-5678</em>
                        <em>FAX : 051-123-4567</em>
                        <em>개인정보관리책임자 : 홍길동</em>
                        <br>
                        <em class="noLine">사업자등록번호 012-81-45670<a href="" class="btn_line">사업자 정보 확인</a></em>
                        <em>
                        </em>
                        <em class="noLine">통신판매번호 : 제2021-부산-01234호</em>
                        <em>건강기능식품판매업 : 제1234-245757호</em>
                        <em>관리자이메일 : <a href="mailto:mskorea3118@naver.com">ghshop@naver.com</a></em>
                    </div>
                    <em>
                        <p>Copyright © 2021 GH SHOP . All Rights Reserved.</p>
                    </em>
                </div>
                <div class="copySns">
                    <ul class="navi-list">
                        <li class="navi-item facebook">
                            <a class="navi-name" href="" target="_blank">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                    <title>facebook</title>
                                    <path d="M16,9.6L15.7,12h-2.1v7h-3.1v-7H9V9.6h1.6V8.1c0-2,0.9-3.1,3.4-3.1H16v2.4h-1.3c-1,0-1,0.3-1,1l0,1.2H16z"></path>
                                </svg>
                            </a>
                        </li>
                        <li class="navi-item instagram">
                            <a class="navi-name" href="" target="_blank">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                    <title>instagram</title>
                                    <path d="M12,8.4c-2,0-3.6,1.6-3.6,3.6s1.6,3.6,3.6,3.6s3.6-1.6,3.6-3.6S14,8.4,12,8.4z M12,14.4c-1.3,0-2.4-1.1-2.4-2.4s1.1-2.4,2.4-2.4s2.4,1.1,2.4,2.4S13.3,14.4,12,14.4z M16.4,8.2C16.4,8.6,16,9,15.6,9c-0.4,0-0.8-0.4-0.8-0.8s0.4-0.8,0.8-0.8C16,7.4,16.4,7.8,16.4,8.2z M15.3,5.1H8.7c-2,0-3.6,1.6-3.6,3.6v6.6c0,2,1.6,3.6,3.6,3.6h6.6c2,0,3.6-1.6,3.6-3.6V8.7C18.9,6.7,17.3,5.1,15.3,5.1z M17.7,15.3c0,1.3-1.1,2.4-2.4,2.4H8.7c-1.3,0-2.4-1.1-2.4-2.4V8.7c0-1.3,1.1-2.4,2.4-2.4h6.6c1.3,0,2.4,1.1,2.4,2.4V15.3z"></path>
                                </svg>
                            </a>
                        </li>
                        <li class="navi-item youtube">
                            <a class="navi-name" href="" target="_blank">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                    <title>youtube</title>
                                    <path d="M10.4,9.7l4,2.3l-4,2.3V9.7L10.4,9.7z M20.9,11.8v0.3c0,0.4,0,2.8-0.4,4.1c-0.2,0.9-1,1.6-1.9,1.9c-1.3,0.3-5.5,0.4-6.5,0.4h-0.3c-1,0-5.2,0-6.5-0.4c-0.9-0.2-1.6-1-1.9-1.9c-0.3-1.1-0.4-3.3-0.4-3.9v-0.4c0-0.7,0.1-2.8,0.4-3.9C3.7,7,4.4,6.2,5.3,6c1.2-0.3,4.9-0.4,6.3-0.4h0.8c1.3,0,5.1,0.1,6.2,0.4c0.9,0.2,1.6,1,1.9,1.9C20.9,9,20.9,11.1,20.9,11.8z M19.4,8.2L19.4,8.2c-0.1-0.5-0.5-0.9-1-1c-1-0.3-4.9-0.3-6.3-0.3c-1.4,0-5.3,0.1-6.3,0.3c-0.5,0.1-0.9,0.5-1,1C4.3,9.4,4.3,12,4.3,12c0,0,0,2.6,0.3,3.8c0.1,0.5,0.5,0.9,1,1c1,0.3,4.9,0.3,6.3,0.3c1.4,0,5.3-0.1,6.3-0.3c0.5-0.1,0.9-0.5,1-1c0.3-1.2,0.3-3.8,0.3-3.8C19.7,12,19.7,9.4,19.4,8.2z"></path>
                                </svg>
                            </a>
                        </li>
                        <li class="navi-item blog">
                            <a class="navi-name" href="" target="_blank">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                    <title>blog</title>
                                    <path d="M9.6,9.7v4.7H8v-4.2c0-1.3-0.7-1.4-0.8-1.4h0V7C9.5,7,9.6,9.2,9.6,9.7z M6.6,11.9c0,2.6-2.4,2.7-2.4,2.7c-1,0-1.4-0.7-1.4-0.7v0.6H1V7.2h1.7v2.7c0.7-0.7,1.5-0.7,1.5-0.7C6.5,9.2,6.6,11.9,6.6,11.9z M4.9,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C4.4,13,4.9,12.5,4.9,11.9z M23,9.4v4.9c0,2.6-2.2,2.7-2.5,2.7h-0.7v-1.5h0.4c1.2,0,1.1-1.3,1.1-1.3v-0.4c-0.5,0.6-1.3,0.7-1.5,0.7h0c-2.2,0-2.4-2.2-2.4-2.5v0c0-2.5,2-2.6,2.4-2.6h0c1,0,1.5,0.7,1.5,0.7V9.4H23z M21.4,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C20.9,13,21.4,12.5,21.4,11.9z M16.6,11.9L16.6,11.9c0,2.7-2.9,2.7-2.9,2.7c-2.7,0-2.8-2.2-2.8-2.6v-0.1c0-2.5,2.5-2.6,2.8-2.7l0,0C16.4,9.3,16.6,11.5,16.6,11.9z M14.8,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C14.3,13,14.8,12.5,14.8,11.9z"></path>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </footer><!-- footer -->


        <button type="button" class="btnTop"><span class="hide">TOP</span></button>
        <div class="rightQuick_main">
            <div class="right_menu_hidden">
                <div class="toggle-right">
                    <div class="toggle-click open">
                        <div class="toggle-click_img_02"></div>
                    </div>
                    <div class="toggle_ico">
                        <div class="ico_inner">
                            <div class="quick_ico_style quick_ico_style_first">
                                <div class="quick_ico_img quick_tooltip" quick-title="대량주문안내">
                                    <a href=""><span class="s1"><img src="${pageContext.request.contextPath}/resources/images/quick_ico_01.png"></span></a>
                                </div>
                            </div>
                            <div class="quick_ico_style photoReview-display display_on">
                                <div class="quick_ico_img quick_tooltip" quick-title="QnA">
                                    <a href=""><span class="s2"><img src="${pageContext.request.contextPath}/resources/images/quick_ico_02.png"></span></a>
                                </div>
                            </div>
                            <div class="sns_on">
                                <div class="quick_ico_style">
                                    <div class="quick_ico_img_add quick_ico_sns quick_tooltip" quick-title="인스타그램">
                                        <a href=""><span><img src="${pageContext.request.contextPath}/resources/images/quick_ico_instagram.png"></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="right_hidden_inner">
                        <div class="right_hidden_width">
                            <div class="right_titbox">
                                <a href="" class="bmark">+BOOKMARK</a>
                                <div class="text">
                                    <p>첫방문 이신가요?</p>
                                    <b>고객과 함께하는 GHSHOP</b>
                                </div>
                            </div>
                            <div class="right_menu">
                                <div class="menu_border border_50" alt="">
                                    <a href="#">마이페이지</a>
                                </div>
                                <div class="menu_border border_50" alt="">
                                    <a href="#">장바구니</a>
                                </div>
                                <div class="menu_border border_50" alt="">
                                    <a href="#">최근본상품</a>
                                </div>
                                <div class="menu_border border_50" alt="">
                                    <a href="#">주문/배송조회</a>
                                </div>
                                <div class="menu_border border_50" alt="">
                                    <a href="#">1:1문의</a>
                                </div>
                                <div class="menu_border border_50" alt="">
                                    <a href="#">공지사항</a>
                                </div>

                                <div class="menu_border border_50" alt="">
                                    <a href="#">이벤트</a>
                                </div>

                            </div>
                            <div class="right_cs">
                                <div class="tle">고객 센터</div>
                                <b>070-1234-5678</b>
                                <div class="info">
                                    평일 : AM10:00 ~ PM17:00<br>
                                    점심 : PM12:00 ~ PM1:00<br>
                                    주말 및 공휴일 휴무
                                    <a href="" class="kakach"><img src="${pageContext.request.contextPath}/resources/images/kakach.jpg"></a>
                                </div>
                                <div class="tle">계좌 안내</div>
                                <div class="info">
                                    <img src="${pageContext.request.contextPath}/resources/images/qbnk.png">
                                    <strong>051-12345-6447-04</strong>
                                    예금주：GHSHOP
                                </div>
                                <a href="">문의 게시판</a>
                                <a href="">QnA</a>
                            </div>
                        </div>
                    </div>
                </div><!-- toggle-right -->
            </div><!-- right_menu_hidden -->
        </div><!-- rightQuick_main -->
    </div><!-- mainLayout -->
</body>
<script src="${pageContext.request.contextPath}/js/main.js"></script></html>>

