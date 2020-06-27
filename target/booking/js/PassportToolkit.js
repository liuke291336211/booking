var HBPassport = function () {
    return new (function () {
        var loginWidth = 640;
        var loginHeight = 480;
        this.LoginOut = function (url) {
            console.log("local LoginOut");
            var frame = $('<iframe class="dialogframe" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="display:none"></iframe>');
            frame.attr("src", "../Passport/PassportLoginOut");
            $(document.body).append(frame);
        },
            this.ShowLogin = function (url) {
                this.ShowMask();
                var loginPanel = $('<div id="IDC_Passport_Panel"></div>');
                loginPanel.css("overflow", "hidden");
                loginPanel.css("z-index", "50100");
                loginPanel.css("position", "fixed");
                loginPanel.css("display", "none");
                loginPanel.width(loginWidth);
                loginPanel.height(loginHeight);
                $(document.body).append(loginPanel);
                var frame = $('<iframe class="dialogframe" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>');
                loginPanel.append(frame);
                frame.load(function () {
                });
                frame.width(loginWidth);
                frame.height(loginHeight);
                var fw = $(document.body).width();
                loginPanel.css("top", "100px");
                loginPanel.css("left", (fw - loginWidth) * 0.5);
                frame.attr("src", url);
                loginPanel.slideDown(500);

                //close
                var closeHtml = $('<img src="/Content/images/sub/colse.png" height="30" onclick="window.location.reload()" />');
                closeHtml.css("cursor", "pointer");
                closeHtml.css("z-index", "50101");
                closeHtml.css("position", "fixed");
                closeHtml.css("top", "120px");
                closeHtml.css("left", (fw - loginWidth) * 0.5 + 590);
                $(document.body).append(closeHtml);
                //close

                $("#IDC_Passport_Mask").click(function () { $("#IDC_Passport_Mask,#IDC_Passport_Panel").remove() })
            }
        this.ShowMask = function () {
            var mask = $("#IDC_Passport_Mask");
            if (mask.length == 0) {
                mask = $('<div id="IDC_Passport_Mask"></div>');
                mask.css("background-color", "gray");
                mask.css("opacity", "0.3");
                mask.css("z-index", "50000");
                mask.css("position", "fixed");
                mask.css("top", "0");
                mask.css("left", "0");
                mask.css("width", "100%");
                mask.css("height", "100%");
                $(document.body).append(mask);
            }
            mask.fadeIn(100);
        }
        this.CloseLogin = function (url) {
            $("#IDC_Passport_Panel").fadeOut(100);
            $("#IDC_Passport_Mask").hide();

            $.ajax({
                type: "POST",
                async: true,
                url: "/Passport/GetPassport",
                data: null,
                success: function (response) {
                    if (response.PassportId != null) {
                        if (typeof (OnPassportLogin) == "function") {
                            OnPassportLogin(response);
                        }
                    }
                },
                error: function (e) {

                },
                beforeSend: function () {

                },
                complete: function () {

                }
            });
        },
            this.PassportCenter = function (url) {
                console.log("passport center begin!")
                var frame = $('<iframe class="dialogframe" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="display:none"></iframe>');
                frame.load(function () {
                    console.log("passport center loaded!")
                });
                frame.attr("src", url);
                console.log(url);
                $(document.body).append(frame);
            }
    })();
}();
function OnPassportCenterLoaded(passportname) {
    if (passportname != null) {
        console.log("OnPassportCenterLoaded!" + passportname);
        $.ajax({
            type: "POST",
            async: true,
            url: "/Passport/GetPassport",
            data: null,
            success: function (response) {
                if (response.PassportId != null) {
                    if (typeof (OnPassportLogin) == "function") {
                        OnPassportLogin(response);
                    }
                }
            },
            error: function (e) {

            },
            beforeSend: function () {

            },
            complete: function () {

            }
        });
    }
}
//外接登陆框关闭
function CloseLogin(url) {
    HBPassport.CloseLogin(url);
}
//账户登录挂接
function OnPassportLogin(data) {
    $("#idc_passportpanel")
        .html("欢迎，")
        .append('<a class="textBlue" name="mulu" href="/Personal/P_registeredorder">' + data.PassportName + '</a>')
        .append('<a class="register" href="javascript:HBPassport.LoginOut();">退出</a>');
}
//退出登录逻辑触发
function OnPassportLoginOut() {
    console.log("账户登出:OnPassportLoginOut");
    //重写本地退出逻辑
    var url = document.location.toString();
    var arrUrl = url.split("//")[1];
    if (arrUrl) {
        var controlstr = arrUrl.split("/")[1];
        if (controlstr) {
            if (controlstr.toUpperCase() == "PERSONAL") {
                top.location.href = "../Home/Index";
                return;
            }
        }
    }
    window.location.reload();
}
$(function () {
    $("#IDC_LOGIN_COMMAND").attr("href", "javascript:void(0);");
    $("#IDC_LOGIN_COMMAND").click(function () {
        HBPassport.ShowLogin("/Passport/PassportLogin");
        return false;
    });
    $("#IDC_LOGINOUT_COMMAND").attr("href", "javascript:void(0);");
    $("#IDC_LOGINOUT_COMMAND").click(function () {
        HBPassport.LoginOut();
    });
});
