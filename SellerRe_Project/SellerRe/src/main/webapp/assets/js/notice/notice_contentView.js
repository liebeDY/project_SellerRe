$(document).ready(function() {
	
	$("#edit").click(function() {
		$("#contentForm").attr('action', '/notice/notice_edit');
		$("#contentForm").submit();
	});
	
	$("#del").click(function() {
		$("#contentForm").attr('action', '/notice/notice_delete');
		$("#contentForm").submit();
	});
	
	$("#reset").click(function() {
		$("#contentForm").attr('action', '/notice/notice_board');
		$("#contentForm").submit();
	});
	
	$("#list").click(function(){
		$("#contentForm").attr('action', '/notice/notice_board')
		$("#contentForm").submit();
	});
});