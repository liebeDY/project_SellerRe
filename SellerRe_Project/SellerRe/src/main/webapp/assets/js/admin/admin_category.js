function changeColor(tr_form) {

    $(tr_form).attr("id", "selected_tr");

    // 전체 항목
    var tr_all = $(tr_form).attr("class");
    tr_all = document.getElementsByClassName(tr_all)
    console.log(tr_all)

    $(tr_all).css({
        "background-color": "transparent",
        "color": "black",
        "cursor": "pointer",
        "width": "100%"
    });

    $("#selected_tr").css({
        "background-color": "#9de792",
        "color": "white",
        "cursor": "pointer",
        "width": "100%"
    });

    $(tr_form).removeAttr("id");
    console.log("------------------------------------------")
}




$(document).ready(function() {
    var category1_num = 0
    var category2_num = 0
    var category3_num = 0;

    var category_type = 0

    // 대분류 전체 출력
    $.post("/admin/getCategory", {
            category_type: 1,
            parent_category_num: 0
        })
        .done(function(data) {
            var category_data = eval("(" + data + ")")
            for (i = 0; i < category_data.length; i++) {

                var str = "<tr class='category1_table' onClick='changeColor(this);select_category1(" + category_data[i].num + ")'>"
                str += "<td><input type='button' class='category1_input' id='category1_" + category_data[i].num + "' value='" + category_data[i].name + "' />"
                str += "</td>"
                str += "</tr>"
                $("#category1_print").prepend(str)
            }
        });


    // 대분류에서 카테고리를 선택 → 중분류 카테고리 전체 출력
    window.select_category1 = function(parent_category_num) {

        var category1_name = document.getElementById("category1_" + parent_category_num).value;
        document.getElementById("selected_category").value = category1_name;

        category1_num = parseInt(parent_category_num);
        document.getElementById("category2_num").value = category1_num;
        $.post("/admin/getCategory", {
                category_type: 2,
                parent_category_num: Number(category1_num)
            })
            .done(function(data) {
                var category_data = eval("(" + data + ")")
                $(".category2_table").empty();
                $(".category3_table").empty();
                for (i = 0; i < category_data.length; i++) {
                    var str = "<tr class='category2_table' onClick='changeColor(this); select_category2(" + category_data[i].num + ")'>"
                    str += "<td><input type='button' class='category2_input' id='category2_" + category_data[i].num + "' value='" + category_data[i].name + "' />"
                    str += "</td>"
                    str += "</tr>"
                    $("#category2_print").prepend(str)
                }
                category_type = 1
            });
    }

    // 중분류에서 카테고리를 선택 → 소분류 카테고리 전체 출력
    window.select_category2 = function(parent_category_num) {

        var category2_name = document.getElementById("category2_" + parent_category_num).value;
        document.getElementById("selected_category").value = category2_name;

        category2_num = parseInt(parent_category_num);
        document.getElementById("category3_num").value = category2_num;

        $.post("/admin/getCategory", {
                category_type: 3,
                parent_category_num: Number(category2_num)
            })
            .done(function(data) {
                var category_data = eval("(" + data + ")")
                $(".category3_table").empty();
                for (i = 0; i < category_data.length; i++) {
                    var str = "<tr class='category3_table' onClick='select_category3(" + category_data[i].num + "); changeColor(this)'>"
                    str += "<td><input type='button' class='category3_input' id='category3_" + category_data[i].num + "' value='" + category_data[i].name + "' />"
                    str += "</td>"
                    str += "</tr>"
                    $("#category3_print").prepend(str)
                }
                category_type = 2
            });
    }

    window.select_category3 = function(parent_category_num) {

        var category3_name = document.getElementById("category3_" + parent_category_num).value;
        document.getElementById("selected_category").value = category3_name;
        category3_num = parseInt(parent_category_num)
        category_type = 3
    }

    // 대분류 추가하기
    $("#add_category1_btn").click(function() {
        var category1_name = document.getElementById("category1_name").value;
        // 공백 체크
        if (category1_name == "") {
            alert("추가할 값을 입력하세요");
            $("#category1_name").val("");
            return false;
        }

        // 중복 체크
        var inputs = document.getElementsByClassName("category1_input")
        for (i = 0; i < inputs.length; i++) {
            if (category1_name == inputs[i].value) {
                alert("이미 존재하는 카테고리명입니다.");
                return false;
            }
        }

        $.post("/admin/addCategory", {
                category_name: category1_name,
                parent_category_num: 0,
                category_type: 1
            })
            .done(function(data) {
                var category_data = eval("(" + data + ")")
                $(".category1_table").empty();
                $(".category2_table").empty();
                $(".category3_table").empty();
                for (i = 0; i < category_data.length; i++) {
                    var str = "<tr class='category1_table' onClick='select_category1(" + category_data[i].num + "); changeColor(this)'>"
                    str += "<td><input type='button' class='category1_input' id='category1_" + category_data[i].num + "' value='" + category_data[i].name + "' />"
                    str += "</td>"
                    str += "</tr>"
                    $("#category1_print").prepend(str)
                }
                $("#category1_name").val("");
            });
    });


    // 중분류 추가하기
    $("#add_category2_btn").click(function() {
        var category2_name = document.getElementById("category2_name").value;
        category2_num = document.getElementById("category2_num").value;

        if (document.getElementById("category2_num").value == "") {
            alert("대분류를 선택하세요");
            return false;
        }

        // 공백 체크
        if (category2_name == "") {
            alert("추가할 값을 입력하세요");
            $("#category2_name").val("");
            return false;
        }

        // 중복 체크
        var inputs = document.getElementsByClassName("category2_input")
        for (i = 0; i < inputs.length; i++) {
            if (category2_name == inputs[i].value) {
                alert("이미 존재하는 카테고리명입니다.");
                return false;
            }
        }

        $.post("/admin/addCategory", {
                category_name: category2_name,
                parent_category_num: category2_num,
                category_type: 2
            })
            .done(function(data) {
                var category_data = eval("(" + data + ")")
                $(".category2_table").empty();
                $(".category3_table").empty();
                for (i = 0; i < category_data.length; i++) {
                    var str = "<tr class='category2_table' onClick='select_category2(" + category_data[i].num + "); changeColor(this)'>"
                    str += "<td><input type='button' class='category2_input' id='category2_" + category_data[i].num + "' value='" + category_data[i].name + "' />"
                    str += "</td>"
                    str += "</tr>"
                    $("#category2_print").prepend(str)
                }
                $("#category2_name").val("");
            });
    });

    // 소분류 추가하기
    $("#add_category3_btn").click(function() {

        var category3_name = document.getElementById("category3_name").value;
        var category3_num = document.getElementById("category3_num").value;

        if (document.getElementById("category2_num").value == "" || document.getElementById("category3_num").value == "") {
            alert("상위 분류를 선택하세요");
            return false;
        }

        // 공백 체크
        if (category3_name == "") {
            alert("추가할 값을 입력하세요");
            return false;
        }

        // 중복 체크
        var inputs = document.getElementsByClassName("category3_input")
        for (i = 0; i < inputs.length; i++) {
            if (category3_name == inputs[i].value) {
                alert("이미 존재하는 카테고리명입니다.");
                $("#category3_name").val("");
                return false;
            }
        }

        $.post("/admin/addCategory", {
                category_name: category3_name,
                parent_category_num: category3_num,
                category_type: 3
            })
            .done(function(data) {
                var category_data = eval("(" + data + ")")
                $(".category3_table").empty();
                for (i = 0; i < category_data.length; i++) {
                    var str = "<tr class='category3_table' onClick='select_category3(" + category_data[i].num + "); changeColor(this)'>"
                    str += "<td><input type='button' class='category3_input' id='category3_" + category_data[i].num + "' value='" + category_data[i].name + "' />"
                    str += "</td>"
                    str += "</tr>"
                    $("#category3_print").prepend(str)
                }
                $("#category3_name").val("");
            });
    });

    // 수정하기
    $("#edit_btn").click(function() {
        var selected_category = document.getElementById("selected_category").value;
        var selected_category_num = 0
            // 공백체크
        if (selected_category == "") {
            alert("선택된 카테고리가 없습니다");
            return false
        }

        if (category_type == 1) {
            selected_category_num = category1_num
        } else if (category_type == 2) {
            selected_category_num = category2_num
        } else if (category_type == 3) {
            selected_category_num = category3_num
        }

        $.post("/admin/updateCategory", {
                category_type: category_type,
                category_num: selected_category_num,
                category_name: selected_category

            })
            .done(function(data) {
                var category_data = eval("(" + data + ")")
                var table_class_name = "";

                if (category_type == 1) {
                    $(".category1_table").empty();
                    $(".category2_table").empty();
                    $(".category3_table").empty();
                } else if (category_type == 2) {
                    $(".category2_table").empty();
                    $(".category3_table").empty();
                } else if (category_type == 3) {
                    $(".category3_table").empty();
                }

                for (i = 0; i < category_data.length; i++) {
                    var str = "<tr class='category" + category_type + "_table' onClick='select_category" + category_type + "(" + category_data[i].num + "); changeColor(this)'>"
                    str += "<td><input type='button' class='category" + category_type + "_input' id='category" + category_type + "_" + category_data[i].num + "' value='" + category_data[i].name + "' />"
                    str += "</td>"
                    str += "</tr>"
                    $("#category" + category_type + "_print").prepend(str)
                }
                $("#selected_category").val("");
            })
    });

    // 삭제하기
    $("#del_btn").click(function() {
        var selected_category = document.getElementById("selected_category").value;
        var selected_category_num = 0
            // 공백체크
        if (selected_category == "") {
            alert("선택된 카테고리가 없습니다")
            return false
        }

        if (category_type == 1) {
            selected_category_num = category1_num
        } else if (category_type == 2) {
            selected_category_num = category2_num
        } else if (category_type == 3) {
            selected_category_num = category3_num
        }

        $.post("/admin/deleteCategory", {
                category_type: category_type,
                category_num: selected_category_num,
            })
            .done(function(data) {
                var category_data = eval("(" + data + ")")
                var table_class_name = "";

                if (category_type == 1) {
                    $(".category1_table").empty();
                    $(".category2_table").empty();
                    $(".category3_table").empty();
                } else if (category_type == 2) {
                    $(".category2_table").empty();
                    $(".category3_table").empty();
                } else if (category_type == 3) {
                    $(".category3_table").empty();
                }

                for (i = 0; i < category_data.length; i++) {
                    var str = "<tr class='category" + category_type + "_table' onClick='select_category" + category_type + "(" + category_data[i].num + "); changeColor(v)'>"
                    str += "<td><input type='button' class='category" + category_type + "_input' id='category" + category_type + "_" + category_data[i].num + "' value='" + category_data[i].name + "' />"
                    str += "</td>"
                    str += "</tr>"
                    $("#category" + category_type + "_print").prepend(str)
                }
                $("#selected_category").val("");
            });
    });
});