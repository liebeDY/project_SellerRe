$(document).ready(function() {
    var user_id = $("#login_user_id").val();

    console.log(user_id)
    $(".wish_icon").click(function() {

	 	if (user_id === null || user_id === "") {
            alert("로그인을 하세요")
            return
        }
        
        var wish_icon = $(this);
        console.log(wish_icon)
            // var a = $(this).parent();
            // console.log(a)

        var product_num = $("#product_num").val();
        // 빈 하트 -> 클릭시 : 
        // 찜하기 실행

        console.log("제이쿼리" + product_num)

        if ($(wish_icon).attr("src") == "/assets/img/wish_0.png") {

            $.post("/wish/wishInsert", {
                    product_num: product_num,
                    user_id: user_id

                })
                .done(function(data) {
                    var result_data = eval("(" + data + ")")

                    if (result_data.result == 1) {
                        $(wish_icon).attr("src", "/assets/img/wish_1.png");
                        alert("찜목록에 추가되었습니다.")
                    }

                });



        } else if ($(wish_icon).attr("src") == "/assets/img/wish_1.png") {
            $.post("/wish/wishDel", {
                    product_num: product_num,
                    user_id: user_id
                })
                .done(function(data) {
                    var result_data = eval("(" + data + ")")

                    if (result_data.result == 0) {
                        $(wish_icon).attr("src", "/assets/img/wish_0.png");
                        alert("찜목록에서 삭제되었습니다.")
                    }
                });
        }
    });
});