$(document).ready(function() {
    $("#admin_page_category_product_menu").click(function() {
        var str = `
        <ul class="admin_page_category_product_menu_area">
            <li class="admin_page_category_product_menu_list">
                <div class="admin_page_category_product_menu_list_div">
                    <input type="submit" class="list_button" name="adminPageType" value="상품관리">
                </div>
            </li>
            <li class="admin_page_category_product_menu_list">
                <div class="admin_page_category_product_menu_list_div">
                    <input type="submit" class="list_button" name="adminPageType" value="카테고리관리">
                </div>
            </li>
        </ul>
        `

        $("#print_area").html(str);
    });


    $("#admin_page_category_board_menu").click(function() {
        var str = `
        <ul class="admin_page_category_board_menu_area">
            <li class="admin_page_category_board_menu_list">
                <div class="admin_page_category_board_menu_list_div">
                    <input type="submit" name="adminPageType" value="공지사항">
                </div>
            </li>
            <li class="admin_page_category_board_menu_list">
                <div class="admin_page_category_board_menu_list_div">
                    <input type="submit" name="adminPageType" value="QnA">
                </div>
            </li>
            <li class="admin_page_category_board_menu_list">
                <div class="admin_page_category_board_menu_list_div">
                    <input type="submit" name="adminPageType" value="신고게시판">
                </div>
            </li>
        </ul>
        `

        $("#print_area").html(str);
    });
});