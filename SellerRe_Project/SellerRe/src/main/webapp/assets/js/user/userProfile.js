$(document).ready(function() {
			$(".del_btn").click(function() {
				var con = confirm("해당 상품을 삭제하시겠습니까?");
				
				if (con == true) {
					this.form.action = "/product/productDelete";
					this.form.submit();
				}
			});	
			
			$(".prod_edit_btn").click(function() {
				this.form.action = "/product/mav_productEdit";
				this.form.submit();
			});
			
			
			$(".score_btn").click(function() {
				var score = this.value;

				document.getElementById("user_score").value = Number(score);
				
				console.log(score);
				var con = confirm(score + "점을 주시겠습니까?");
				
				if (con == true) {
					this.form.submit();
				}
			});
			
			// 거래완료 버튼 클릭
			$(".result_btn").click(function(){
				var result = this.value;
				console.log(result)
				// 1 거래중 2 거래완료
				if(result == "거래완료하기"){
					var con = confirm("거래상태를 변경하시겠습니까?");
					
					if(con == true){
						this.form.action = "/product/updateResult";
						this.form.submit();
					}
				} else if(result == "거래완료"){
					alert("이미 거래가 완료된 상품입니다.");
					return false;
				}
				
			});
			
		});