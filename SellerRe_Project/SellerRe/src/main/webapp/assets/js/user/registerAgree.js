
$(document).ready(function(){
    //최상단 체크박스 
    // #All_Check -> .All_Check로 수정
    
    $(".All_Check").click(function(){
        if($(".All_Check").prop("checked")){//클릭
            $("input[type=checkbox]").prop("checked",true);
        }else{//클릭 해제
            $("input[type=checkbox]").prop("checked",false);
        }
    });
});

$(document).ready(function() {
    $("#cancel").click(function() {
    	var exit = confirm("회원가입을 취소하시겠습니까?");
    	
    	if (exit == true) {
    		alert("회원가입이 취소되었습니다");
    		location.href="/index";	
    	}
    		
    });
    
    // 만 14세 이상입니다 input -> class 명 Service_Check로 수정
    $("#All_Agree").click(function() {
    	 var c = $("input[class=Service_Check]:checked").length;
    	 console.log(c)
    	 if(c>2){
    		location.href="/user/registerForm";
		}else{
			alert("필수항목이 체크되지 않았습니다");
		}
    });
});

