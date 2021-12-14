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
	
<div class="question_wrap ab_franchise innerContent">
	<h3>1:1문의를 남겨주시면 빠르게 답변 드리겠습니다.</h3>
	<div class="ab_nec_wrap"><div class="ab_nec">필수입력</div>표시는 필수항목입니다.</div>
	<form name="writeform" id="writeform" method="post" action="" target="" >
		<div class="ab_fran_tb">
			<table>
				<caption class="hidden">1:1문의</caption>
				<colgroup>
					<col width="19%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="ab_fran3"><span class="ab_nec">필수입력</span>작성자</label></th>
						<td><input type="text" name="name" id="name" value="" placeholder="담당자이름을 입력해주세요." class=""></td>
					</tr>
					<tr>
						<th scope="row"><label for="ab_fran1"><span class="ab_nec">필수입력</span>분류</label></th>
						<td>
						<select name="category" id="addcategory">
							<option value="" selected="selected">- 분류선택 -</option>
							<option value="배송지연/불만">배송지연/불만</option>
							<option value="반품문의">반품문의</option>
							<option value="A/S문의">A/S문의</option>
							<option value="환불문의">환불문의</option>
							<option value="주문결제문의">주문결제문의</option>
							<option value="회원정보문의">회원정보문의</option>
							<option value="취소문의">취소문의</option>
							<option value="교환문의">교환문의</option>
							<option value="상품정보문의">상품정보문의</option>
							<option value="기타문의">기타문의</option>
						</select>
						</td>
					</tr>					
					<tr>
						<th scope="row"><label for="ab_fran4"><span class="ab_nec">필수입력</span>연락처</label></th>
						<td><input type="text" name="tel1" value="" placeholder="연락처를 입력해주세요." id="ab_fran4" class=""></td>
					</tr>
					<tr>
						<th scope="row"><label for="ab_fran5"><span class="ab_nec">필수입력</span>이메일</label></th>
						<td>
							<input type="text" name="email[0]" id="email1" value="" class="ip_email" onchange="changeEmail()" placeholder="이메일">
							<div class="ab_til">@</div>
							<input type="text" name="email[1]" id="email2" value="" class="ip_email" onchange="changeEmail()">
							<select name="find_email" id="find_email" style="" onchange="changeEmail1(this.value)">
								<option value="">직접선택</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empal.com">empal.com</option>
								<option value="unitel.co.kr">unitel.co.kr</option>
								<option value="gmail.com">gmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="chol.com">chol.com</option>
								<option value="paran.com">paran.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
							</select>
							<script type="text/javascript">
								function changeEmail(){
									var email1 = $("#email1").val();
									var email2 = $("#email2").val();
									$("#email").val(email1+"@"+email2);
								}
								function changeEmail1(val){
									$("#email2").val(val);
									changeEmail();
								}
							</script>
							<input type="hidden" name="email" id="email" value="">
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="ab_fran6"><span class="ab_nec">필수입력</span>제목</label></th>
						<td><input type="text" name="subject" id="subject" value="" placeholder="제목을 입력해주세요." class="ab_ip_title"></td>
					</tr>
					<tr>
						<th scope="row"><label for="ab_fran7"><span class="ab_nec">필수입력</span>내용</label></th>
						<td><textarea name="contents" id="contents" placeholder="내용을 입력해주세요." cols="" rows=""></textarea></td>
					</tr>
					<tr>
						<th scope="row"><label for="ab_fran8">사진첨부</label></th>
						<td>
						<div class="attach_default">					
							<div class="img_preview" id="img_viewer">
								<button type="button" class="btnUploader btn_resp size_b"><span>+</span>파일찾기</button>
							</div>					
						</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="ab_fran7"><span class="ab_nec">필수입력</span>비밀번호</label></th>
						<td>
							<input type="password" name="pw" id="pw" value="" password="password" title="비밀번호 입력" placeholder="비밀번호 입력">
						</td>
					</tr>				
				</tbody>
			</table>
		</div>
		<div class="ab_agree">
			<input type="checkbox" name="agree" value="Y" id="f_agree">
			<label for="f_agree">개인정보 수집 및 이용에 동의합니다.</label>
			<span class="btn_view_policy">내용보기</span>
			<textarea class="view_policy" >수집하는 개인정보의 항목
			가. 주식회사 엠에스코리아(전자상거래 사업자)가 운영하는 주식회사 엠에스코리아 사이버 몰은 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다.
			(일반 회원가입 시)
			- 필수항목 : 이름, 아이디, 비밀번호, 이메일 주소,휴대폰번호
			(아이핀(i-Pin) 회원가입 시)
			- 필수항목 : 성명, 생년월일, 아이핀 번호, 아이디, 비밀번호, 이메일 주소,휴대폰번호
			나. 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
			- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
			다. 부가 서비스 및 맞춤식 서비스 이용 과정에서 해당 서비스의 이용자에 한해서만 아래와 같은 정보들이 수집될 수 있습니다.
			- 주소, 연락처, 사용 이동통신사, 계좌번호 등
			라. 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
			- 신용카드 결제시 : 카드사명, 카드번호 등
			- 계좌이체시 : 은행명, 계좌번호 등
			- 상품권 이용시 : 상품권 번호
			마,물품 주문시 개인정보를 수집항목
			-필수항목 : 주문자이름,주문자전화번호,배송받는자이름,배송받는자주소,배송받는자전화번호,배송받는자 휴대폰번호
			개인정보의 수집 및 이용 목적
			가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
			컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심
			나. 회원관리
			회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 불만처리 등 민원처리, 고지사항 전달
			다. 신규 서비스 개발 및 마케팅
			신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속빈도 파악, 회원의 서비스 이용에 대한 통계 개인정보의 보유 및 이용기간
			이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
			가. 주식회사 엠에스코리아 내부 방침에 의한 정보보유 사유
			- 부정이용기록
			보존 이유 : 부정 이용 방지
			보존 기간 : 1년
			나. 관련법령에 의한 정보보유 사유
			상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 주식회사 엠에스코리아는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
			이 경우 주식회사 엠에스코리아는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
			- 방문에 관한 기록
			보존 이유 : 통신비밀보호법
			보존 기간 : 3개월
			- 본인확인에 관한 기록
			보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률
			보존 기간 : 6개월
			- 소비자의 불만 또는 분쟁처리에 관한 기록
			보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
			보존 기간 : 3년
			- 계약 또는 청약철회 등에 관한 기록
			보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
			보존 기간 : 5년
			- 대금결제 및 재화 등의 공급에 관한 기록
			보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
			보존 기간 : 5년
			</textarea>
		</div>
		<div class="btnArea">
			<button type="button" class="btnSSG btnL action" onclick="" id="authNoBtn">문의하기</button>
			<button type="button" class="btnSSG btnR cancel" onclick="" id="authNoBtn">취소</button>
		</div>
	</form>
	<script>
	$(document).ready(function() {
		$(".btn_view_policy").click(function() {
			$(this).parent().find(".btn_view_policy").toggleClass('active');
		});
	});
	</script>
</div><!--question_wrap-->

	</div><!--cuswrap-->					
</div><!--container-->

</body>
</html>
