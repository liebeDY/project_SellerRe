$(document).ready(function() {
                $(".slider").bxSlider({
                    auto : true,
                    speed : 300,
                    mode : 'fade',
                    infiniteLoop : true,
                    pager : true,
                    slideWidth : 1500
                });
                
             // 상품 수정
                $("#prod_detail_edit_btn").click(function(){
	                	$("#action_from").attr("action","/product/mav_productEdit");
	                	$("#action_from").submit();
                });
                
                // 상품 삭제
                $("#prod_detail_del_btn").click(function(){
        			var con = confirm("해당 제품을 삭제하시겠습니까?");
        			var login_user_id = $("#login_user_id").val();
        			console.log(login_user_id);
        			
        			if(con == true) {
	                	$("#action_from").attr("action","/product/productDelete");
	                	$("#action_from").submit();
	                	alert("제품이 삭제되었습니다");
        			} 
                });
                
                // 리뷰 작성 버튼
                $(".review_writing_btn").click(function() {
                	var writer_id = $("#writer_id").val();
                	
                	if (writer_id == "") {
                		alert("로그인 후 이용가능합니다");
                		return false;
                	}
                	
                	if($('.review_writing').val() == "") {
                		alert("댓글을 입력 해주세요");
                		return false;
                	}
                	
                	$(".review_form").attr('action', '/review/insertReview');
                	$(".review_form").submit();
                });
                
                // 리뷰 수정
                $(".review_edit").click(function() {
					var con = confirm("댓글을 수정하시겠습니까?");
                	
                	if (con == true) {
	                	this.form.action="/review/updateReview";
	                	this.form.submit();
                	}
                });
                
             	// 리뷰 삭제
                $(".review_del").click(function() {
                	var con = confirm("댓글을 삭제하시겠습니까?");
                	
                	if (con == true) {
	                	this.form.action="/review/deleteReview";
	                	this.form.submit();
	                }
                });
            });