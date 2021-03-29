    $(document).ready(function() {
    	
    	// 수정
        $("#QnA_Content_Edit_btn").click(function() {
			$("#QnA_Content_View_Form").attr('action', '/qna/mav_qna_edit');
			$("#QnA_Content_View_Form").submit();
		});
	    
    	// 삭제
        $("#QnA_Content_del_btn").click(function() {
			$("#QnA_Content_View_Form").attr('action', '/qna/qna_delete');
			$("#QnA_Content_View_Form").submit();
		});
	});