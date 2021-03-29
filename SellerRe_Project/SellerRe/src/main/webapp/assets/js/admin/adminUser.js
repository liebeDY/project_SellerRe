$(document).ready(function(){
      
      // 검색버튼 클릭 
      $("#search_user_btn").click(function(){
         // 초기화
         $("#id").text("");
         $("#name").text("");
         $("#nickname").text("");
         $("#type").text("");
         
         // 검색한 회원 id
         var user_id = $("#search_user_id").val() ;
         
         // 공백체크
         if(user_id == ""){
            alert("검색할 id를 입력하세요");
            return false;
         }
         
         $.post("/admin/selectUser", {
            user_id : user_id
         })
         .done(function(data) {
            var u = eval("("+data+")");
            
            // 회원이 존재하지 않을 때
            if(u.user_type == 3){
               alert("존재하지 않는 회원입니다.");
               return false;
            }
            
            var str = "<input type='submit' value='"+ u.user_id +"'/>";
            str += "<input type='hidden' name='user_id' value='"+ u.user_id +"'>";
            
            //회원이 존재할 때
            $("#id").append(str);
            $("#name").text(u.user_name);
            $("#nickname").text(u.user_nickname);
            
            if (u.user_type == 1) {
               $("#type").text("회원");
            } else if (u.user_type == 2) {
               $("#type").text("관리자");
            } 
         });
      });
            
      
      // 회원 삭제
      $("#del_btn").click(function() {
         
         // 검색한 회원 id
         var user_id = $("#search_user_id").val() ;
         console.log(user_id);
         
         var del_confirm = confirm("정말 삭제하시겠습니까?");
         if (del_confirm == false) {
            return false;
         }
         
         $.post("/admin/deleteUser", {
            user_id : user_id
         })
         .done(function(data) {
            var u = eval("(" + data + ")");
            
            if (u.user_type == 3) {
               alert("존재하지 않는 회원입니다.");
               return false;
            } else if (u.user_type == 2) {
               alert("관리자는 삭제할 수 없습니다.");
               return false;
            }
            alert(u.user_id + "님이 삭제되었습니다.");
            
            // 삭제 후 초기화
            $("#id").text("");
            $("#name").text("");
            $("#nickname").text("");
            $("#type").text("");
         });
      });
      
      
   });