$(document).ready(function() {
	acountPlus();
	$("#selectall").click(function() {
		allCheck()
	});
	
	$("input[name=product]").click(function() {
		doCheck(this)
	});
	
		count();
});

function allCheck() {
	$('#cart_order_list').empty();
	$('#total_price').text(0);
	$('#product_price').text(0);
	if($("#selectall").is(":checked")){
		 $("input[name=product]").prop("checked", true);
		 acountPlus();
		 
		 let items = $("input[name=product]");
		 for(let i = 0; i < items.length; i++){
		 	addOrderList(items[i].value);
		 	setTotalPrice(items[i], 'add');
		 }
		 
	} else {
		 $("input[name=product]").prop("checked", false);
		 acountPlus();
	}
}

function doCheck(item) {
	var total = $("input[name=product]").length;
	var checked = $("input[name=product]:checked").length;
	
	if(total != checked){
		 $("#selectall").prop("checked", false);
		 acountPlus();
	} else {
		 $("#selectall").prop("checked", true);
		 acountPlus();
	}
	
	if(item.checked == true) {
		addOrderList(item.value);
		setTotalPrice(item, 'add');
	} else {
		removeOrderList(item.value);
		setTotalPrice(item, 'remove');
	}
}


function setTotalPrice(item, type){
	let productPrice = $('#product_price').text().replaceAll(',','');
	let baesongPrice = $('#baesong_price').text().replaceAll(',','');
	let discountPrice = $('#discount_price').text().replaceAll(',','');
	let amount = $('#product_amount').text();
	if(type == 'add') {
		$('#product_price').text(Number(productPrice)+Number(item.dataset.price));
	} else {
		$('#product_price').text(Number(productPrice)-Number(item.dataset.price));
	}
	
	if(amount > 0){
		$('#total_price').text(Number($('#product_price').text().replaceAll(',','')) 
		+ Number(baesongPrice) - Number(discountPrice));
	} else {
		$('#total_price').text('0');
	}
}

function addOrderList(id) {
	$('#cart_order_list').append('<input type="hidden" id="cartId'+id+'" name="cartId" value="'+id+'">');
}

function removeOrderList(id) {
	$('#cartId'+id).remove();
}


function acountPlus(){
	var check = $("input[name=product]");
	var amount = $("span[name=amount]").text();
	var count = 0;
	var cartSizeList = 0;	
	
	for(var i =0; i<check.length; i++){
		if(check[i].checked == true){
			count += parseInt(amount[i]);
			cartSizeList += 1;
		}
	}
	$("#cartListSize").text(cartSizeList);
	$('#product_amount').text(count);
}



function CartdeleteOne(items){
	var cartId = items.getAttribute('id').replace('delete_', '');
	var cartIdNm = parseInt(cartId);
	

		$.ajax({
		type: 'POST', //요청 메소드 방식
		url:'deleteCart',
		async: false, // ajax 통신이 끝날때까지 기다리기
		data:{
			"cartId" : cartIdNm
		}, //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			if(result  == 1){
				location.reload();
			}else{
				alert('실패');
			}
		}	
	});

}



function CartdeleteAll(){

		$.ajax({
		type: 'POST', //요청 메소드 방식
		url:'deleteAllCart',
		async: false, // ajax 통신이 끝날때까지 기다리기
		data:{
			"memId" : $('#deleteAll').val()
		}, //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			if(result  == 1){
				location.reload();
			}else{
				alert('실패');
			}
		}	
	});

}


function insertCart(){
	
		$.ajax({
		type: 'POST', //요청 메소드 방식
		url:'insertCart',
		async: false, // ajax 통신이 끝날때까지 기다리기
		data:{
			"amount" : $('#topQuantitySpinner').val(),
			"goodsNo" : $('#goodsNo').val()
		}, //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			if(result  == 1){
				alert('상품이 장바구니에 담겼습니다.');
				count();
			}else{
				alert('실패');
			}
		}	
	});
}	

function count(){
	var count;
	
	$.ajax({
		type: 'POST', //요청 메소드 방식
		url:'count',
		async: false, // ajax 통신이 끝날때까지 기다리기
		 //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			count = result;
			$('#cartCount2').text(count);
		}	
	});
	return count;

}


function submit(){
	$('#cartOrderSubmit').submit();
}

function submit2(){
	$('#orderPro').submit();
}

