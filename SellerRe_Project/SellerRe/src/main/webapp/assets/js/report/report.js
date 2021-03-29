
var check;


$(document).ready(function() {
    $(".nickCheck_Btn").click(function() {
		var data = {user_nickname : $('#user_nickname').val()}

			$.ajax({ 
				type : "post", 
				url : "/report/Check", 
				data : data, 
				
				success : function(name_result){ 
					if(name_result != "fail") {
						alert("존재하지 않는 유저입니다.");
					} else { 
						alert("존재하는 유저입니다.");
						$("#user_nickname").attr("readonly",true);
						check = "success";
					}
				}
			}); 	
		}); 

		// 취소 버튼을 누르면 리스트로 돌아간다.
	    $(".cancel_btn").click(function() {

 		    location.href="/report/mav_report_List";
    	});
	    
		// 작성 버튼을 누르면 컨트롤러에 addReport 메소드가 실행된다.
        $(".writing_btn").click(function() {
        			if ($("#report_title").val() == ""){
						alert("제목을 작성 해주세요");
						return false;
					}
        			if ($("#report_reason").val() == "없음"){
						//console.log("test");
						alert("신고사유를 선택 해주세요");
						return false;
        			}
        			if ($("#user_nickname").val() == ""){
						alert("닉네임을 작성 해주세요");
						return false;
        			}
					if ($("#report_content").val() == ""){
						alert("내용을 작성 해주세요");
						return false;
					}
		        	//if ($(".nickCheck_Btn") == "") {
					if (check == "success") {
						alert("작성되었습니다.");
			 			$("#reportWritingForm").attr('action', '/report/Writing');
			 			$("#reportWritingForm").submit();
					} else{
						alert("닉네임 확인을 해주세요");
					} 									
		});
});     	
