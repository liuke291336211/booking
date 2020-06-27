


//关注取消医院
function FollowHospital(id) {
    return follow(id,0);
}

//关注取消科室
function FollowDepartment(id) {
    return follow(id, 1);
}

//关注取消医生
function FollowDoctor(id) {
    return follow(id, 2);
}

//关注取消
function follow(id,followType) {

    if (id == null || id == "") {
        alert("参数错误");
        return ;
    }

    $.ajax({
        type: "post",
        dataType: "json",
        url: "/follow/follow",
        data: {
            id: id,
            followType:followType
        },
        success: function (result) {
            if (result.Code > 0) {
                if ($("#btnFollow img").attr("src") == "/Content/images/hollow.png") {
                    $("#btnFollow img").attr("src", "/Content/images/solid.png");
                    $("#btnFollow").attr("title", "已收藏");
                } else {
                    $("#btnFollow img").attr("src", "/Content/images/hollow.png");
                    $("#btnFollow").attr("title", "未收藏");
                }

            }
            else if(result.Code==-1) {
                //未登录
                location.href = "/Passport/PassportLogin";
            } else {
                //alert(result.Message);
                $("#btnFollow img").attr("src", "/Content/images/hollow.png");
                $("#btnFollow").attr("title", "未收藏");
            }
        }
    });
}

