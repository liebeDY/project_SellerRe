
$(document).ready(function(){
	$('#user_id').on("propertychange change keyup paste input", function(){
	
		var Id=$("#user_id").val(); 
		var data = {user_id : $('#user_id').val()}
		
// 	 		var checkid = $('.userid').val(); 
// 	 		var data = 'user_id='+checkid

			$.ajax({ 
				type : "post", 
				url : "/user/IdCheck", 
				data : data, 
				
				success : function(id_result){ 
					if(Id.length<4){
						$("#idResult").css("color","red")
						$("#idResult").text("아이디는 4자 이상으로 설정해야 합니다.")
						$("#btn2").attr("disabled", "disabled");
					} else if(id_result != "success"){
						$("#idResult").css("color","red")
						$("#idResult").text("이미 사용중인 아이디입니다")
						$("#btn2").attr("disabled", "disabled");
					} else{ 
 					//console.log("test"+result)
						$("#idResult").css("color","green")
						$("#idResult").text("사용가능한 아이디입니다")
						$("#btn2").removeAttr("disabled"); 
					}
				}// success 종료
			}); // ajax 종료
		}); 

	$('#user_pw_re').on("propertychange change keyup paste input", function(){
	
			var pwd1=$("#user_pw").val(); 
			var pwd2=$("#user_pw_re").val(); 
			//console.log("pw1"+pwd1)
			
 			if(pwd1 != "" || pwd2 != ""){
					if(pwd1.length<8 || pwd2.length<8){ 
						$("#pwdResult_re").css("color","red")
						$("#pwdResult_re").text("비밀번호는 8자 이상으로 설정해야 합니다.")
						$("#btn2").attr("disabled", "disabled"); 
		 			} else if(pwd1 != pwd2){ 
						$("#pwdResult_re").css("color","red")
						$("#pwdResult_re").text("비밀번호가 일치하지 않습니다.")
						$("#pwdResult").text("")
						$("#btn2").attr("disabled", "disabled"); 
					} else{ 
			 			$("#pwdResult_re").css("color","green")
						$("#pwdResult_re").text("비밀번호가 일치 합니다.")
						$("#pwdResult").text("")
						$("#btn2").removeAttr("disabled");
	 				}
		}
	});
	
	$('#user_pw').on("propertychange change keyup paste input", function(){
	
		var pwd1=$("#user_pw").val(); 
		var pwd2=$("#user_pw_re").val(); 
		//console.log("pw1"+pwd1)
		
			if(pwd1 != "" || pwd2 != ""){
				if(pwd1.length<8 || pwd2.length<8){ 
						$("#pwdResult").css("color","red")
						$("#pwdResult").text("비밀번호는 8자 이상으로 설정해야 합니다.")
						if(pwd1.length>8){
							$("#pwdResult").text("")
						}
						$("#btn2").attr("disabled", "disabled");
	 			} else if(pwd1 != pwd2){ 
					$("#pwdResult_re").css("color","red")
					$("#pwdResult_re").text("비밀번호가 일치하지 않습니다.")
					$("#pwdResult").text("")
					$("#btn2").attr("disabled", "disabled"); 
				} else{ 
		 			$("#pwdResult_re").css("color","green")
					$("#pwdResult_re").text("비밀번호가 일치 합니다.")
					$("#pwdResult").text("")
					$("#btn2").removeAttr("disabled");
 				}
		}
	});

	$('#user_nickname').on("propertychange change keyup paste input", function(){
	
		console.log("test")
		var data = {user_nickname : $('#user_nickname').val()}

			$.ajax({ 
				type : "post", 
				url : "/user/nicknameCheck", 
				data : data, 
				
				success : function(name_result){ 
					if(name_result != "fail"){
						$("#nickResult").css("color","green")
						$("#nickResult").text("사용가능한 닉네임입니다")
						$("#btn2").removeAttr("disabled"); 
					} else{ 
	 					$("#nickResult").css("color","red")
						$("#nickResult").text("이미 사용중인 닉네임입니다")  
						$("#btn2").attr("disabled", "disabled");
					}
				}
			}); 	
		}); 
	
	$('#user_email').on("propertychange change keyup paste input", function(){ 
	
		var data = {user_email : $('#user_email').val()}
		
			$.ajax({ 
				type : "post", 
				url : "/user/emailCheck", 
				data : data, 
				
				success : function(id_result){ 
					if(id_result != "success"){
						$("#emailResult").css("color","red")
						$("#emailResult").text("이미 사용중인 이메일 입니다.")
						$("#btn2").attr("disabled", "disabled");
					} else{ 
						$("#emailResult").css("color","green")
						$("#emailResult").text("사용가능한 이메일입니다")						
						$("#btn2").removeAttr("disabled"); 
					}
				}// success 종료
			}); // ajax 종료
		}); 
	
	$(function(){
	    $('#user_birthday').prop('max', function(){
	       return new Date().toISOString().split('T')[0];
	    });
	}); 
});
