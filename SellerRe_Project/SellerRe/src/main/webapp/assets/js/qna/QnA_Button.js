	$(document).ready(function() {
		$("#QnA_btn_1").click(function() {
			$("#qna_type").val(1);
			$("#QnA_Button_Form").attr('action', '/qna/mav_qna_list');
			$("#QnA_Button_Form").submit();
		});
		
		$("#QnA_btn_2").click(function() {
			$("#qna_type").val(2);
			$("#QnA_Button_Form").attr('action', '/qna/mav_qna_list');
			$("#QnA_Button_Form").submit();
		});
		
		$("#QnA_btn_3").click(function() {
			$("#qna_type").val(3);
			$("#QnA_Button_Form").attr('action', '/qna/mav_qna_list');
			$("#QnA_Button_Form").submit();
		});
		
		$("#QnA_btn_4").click(function() {
			$("#qna_type").val(4);
			$("#QnA_Button_Form").attr('action', '/qna/mav_qna_list');
			$("#QnA_Button_Form").submit();
		});
		
		$("#QnA_btn_5").click(function() {
			$("#qna_type").val(5);
			$("#QnA_Button_Form").attr('action', '/qna/mav_qna_list');
			$("#QnA_Button_Form").submit();
		});
	});