var HBVerify = new function () {
    var verify_configs = {
        verifyurl: "https://gateway.hbjk114.com/gate-way/route/hb/api/",
        createpath: "verify/create",
        viewpath: "verify/get",
        checkpath: "verify/check",
        viewmode: 0,// 0 对话框，1 为嵌入显示,
        viewcontent: null,//要附着的区域
        width: 320,//显示的尺寸（默认 0 自适应宽度)
        height: 160,
        verifyid: "verify",
        onverify: null,
        loadfirst: true
    };
    var current_verifyid = "";//验证码标识
    var current_verifytype = -1;//验证码类型
    var current_path = [];
    var current_startdate = null;
    var current_status = 0;
    this.Set = function (options) {
        $.extend(verify_configs, options || {});
        if (verify_configs.viewmode == 1) {
            createverify();
        }
    }
    function createverify() {
        loadverify();
    }
    function loadverify() {
        $.getJSON(verify_configs.verifyurl + verify_configs.createpath, { VerifyId: verify_configs.verifyid }, function (response) {
            if (HB.IsSucess(response)) {
                current_path.length = 0;
                var datas = response.ResultData;
                current_verifyid = datas.VerifyId;
                current_verifytype = datas.VerifyType;
                showverify();
                verify_configs.loadfirst = true;
            }
            else {
                if (verify_configs.loadfirst) {//创建图像验证码失败
                    verify_configs.loadfirst = false;
                    loadverify();
                }
            }
        });
    }
    function reloadverify() {
        setTimeout(loadverify, 1000);
    }
    function drawcanvas(ctxdest, ctxfrom, x, y) {
        //console.log(x);
        ctxdest.drawImage(ctxfrom, 0, 0, ctxfrom.width, ctxfrom.height, x, y, ctxfrom.width, ctxfrom.height);
        $(ctxfrom).hide();
    }
    function showverify() {
        if (verify_configs.viewcontent == null) {
            verify_configs.viewcontent = $(document.body);
        }
        if ($("#idc_avtive_verify").length > 0) {
            $("#idc_avtive_verify").remove();
        }
        current_path.length = 0;
        current_status = 0;

        var verifypannel = $('<div id="idc_avtive_verify" style="position:relative;"><img src="/Content/Images/m/refresh.png" /></div>');
        if (current_verifytype == 0) {
            var img = new Image();
            img.onload = function () {
                var canvas_back = document.createElement("canvas");
                canvas_back.width = verify_configs.width == 0 ? img.width : verify_configs.width;
                canvas_back.height = verify_configs.height == 0 ? img.height : verify_configs.height;
                $(canvas_back).css("display", "block");
                var ctx = canvas_back.getContext("2d");
                //console.log(img.width);
                ctx.drawImage(img, 0, 0, img.width - 55, img.height, 0, 0, img.width - 55, img.height);
                verifypannel.append(canvas_back);

                var canvas_font = document.createElement("canvas");
                canvas_font.width = 55;
                canvas_font.height = img.height;
                var ctx2 = canvas_font.getContext("2d");
                //console.log(img.width);
                ctx2.drawImage(img, img.width - 55, 0, 55, img.height, 0, 0, 55, img.height);
                $(canvas_font).css("position", "absolute");
                $(canvas_font).css("left", "0");
                $(canvas_font).css("top", "0");
                $(canvas_font).css("zIndex", "999");
                verifypannel.append(canvas_font);
                verifypannel.append(canvas_font);

                //创建轨道
                var track_back = $('<div class="track" style="width:' + canvas_back.width + 'px;">向右拖动滑块填充拼图</div>');
                var track_left = $('<div class="track-left"></div>');
                var track_mask = $('<div class="track-mask"></div>');
                var track_face = $('<div class="track-face">...</div>');
                track_back.append(track_left);
                track_back.append(track_face);
                track_back.append(track_mask);
                var istartmove = false;
                var startmove_x = 0;
                var startmove_mouse_x = 0;
                var startmove_mouse_y = 0;
                var ismobile = /(iphone|android|nokia|symbian|sony|ericsson|mot|samsung|sgh|lg|philips|panasonic|alcatel|lenovo|cldc|midp|wap|mobile|blackberry|windows ce|motorola|mqqbrowser|ucweb)+/.test(navigator.userAgent.toLowerCase());
                if (!ismobile) {
                    //PC
                    track_face.mousedown(function (e) {
                        if (current_status != 0) return;
                        //console.log("mousedown");
                        if (e.button == 0) {
                            istartmove = true;
                            startmove_x = track_left.width();
                            startmove_mouse_x = e.pageX;
                            startmove_mouse_y = e.pageX;

                            var rect = $(canvas_back).offset();

                            track_mask.css("zIndex", 1000);

                            current_startdate = new Date();
                            current_path.length = 0;
                            var rect = $(canvas_back).offset();
                            var offset_x = e.pageX - rect.left;
                            var offset_y = e.pageY - rect.top;
                            current_path.push({ x: Math.floor(offset_x), y: Math.floor(offset_y), t: 0 })
                        }
                    });
                    track_face.mouseup(function (e) {
                        if (current_status != 0 || istartmove == false) return;
                        //console.log("mouseup");
                        if (e.button == 0) {
                            istartmove = false;
                            track_mask.css("zIndex", 1);

                            var t = new Date() - current_startdate;

                            var rect = $(canvas_back).offset();
                            var offset_x = e.pageX - startmove_mouse_x;
                            var offset_y = e.pageY - startmove_mouse_y;
                            if (t > 0) {
                                current_path.push({ x: offset_x, y: offset_y, t: t });
                            }
                            current_status = 1;
                            drawcanvas(ctx, canvas_font, current_path[current_path.length - 1].x, 0);
                            callverify(ctx);
                        }
                    });
                    track_face.mouseout(function (e) {
                        if (current_status != 0 || istartmove == false) return;
                        //console.log("mouseout");
                        istartmove = false;
                        track_mask.css("zIndex", 1);

                        var t = new Date() - current_startdate;
                        if (t > 0) {
                            var rect = $(canvas_back).offset();
                            var offset_x = e.pageX - startmove_mouse_x;
                            var offset_y = e.pageY - startmove_mouse_y;
                            current_path.push({ x: Math.floor(offset_x), y: Math.floor(offset_y), t: t });
                        }
                        current_status = 1;
                        drawcanvas(ctx, canvas_font, current_path[current_path.length - 1].x, 0);

                        callverify(ctx);
                    });
                    track_face.mousemove(function (e) {
                        if (current_status != 0 || istartmove == false) return;
                        //console.log(e.button + "," + istartmove);
                        if (e.button == 0) {
                            var dx = e.pageX - startmove_mouse_x;
                            var posx = startmove_x + dx;
                            if (posx < 0) posx = 0;
                            if (posx > track_back.width() - track_face.width()) {
                                posx = track_back.width() - track_face.width();
                            }
                            track_face.css("left", posx);
                            $(canvas_font).css("left", posx);
                            track_left.width(posx);

                            var t = new Date() - current_startdate;
                            if (t > 100) {//采集最小时间间隔
                                var rect = $(canvas_back).offset();
                                var offset_x = e.pageX - startmove_mouse_x;
                                var offset_y = e.pageY - startmove_mouse_y;
                                current_path.push({ x: Math.floor(offset_x), y: Math.floor(offset_y), t: t });
                            }
                        }
                    });
                }
                else {
                    //Mobile
                    track_face.on('touchstart', function (mevent) {
                        if (current_status != 0) return;
                        var e = mevent.originalEvent.targetTouches[0];
                        istartmove = true;
                        startmove_x = track_left.width();
                        startmove_mouse_x = e.pageX;
                        startmove_mouse_y = e.pageX;

                        var rect = $(canvas_back).offset();
                        //track_mask.css("zIndex", 1000);

                        current_startdate = new Date();
                        current_path.length = 0;
                        var rect = $(canvas_back).offset();
                        var offset_x = Math.floor(e.pageX - rect.left);
                        var offset_y = Math.floor(e.pageY - rect.top);
                        current_path.push({ x: offset_x, y: offset_y, t: 0 });
                        console.log(istartmove);
                    });
                    track_face.on('touchmove', function (mevent) {
                        console.log("touchmove");
                        if (current_status != 0 || istartmove == false) return;
                        var e = mevent.originalEvent.targetTouches[0];
                        var dx = e.pageX - startmove_mouse_x;
                        var posx = startmove_x + dx;
                        if (posx < 0) posx = 0;
                        if (posx > track_back.width() - track_face.width()) {
                            posx = track_back.width() - track_face.width();
                        }
                        track_face.css("left", posx);
                        $(canvas_font).css("left", posx);
                        track_left.width(posx);

                        var t = new Date() - current_startdate;
                        if (t > 100) {//采集最小时间间隔
                            var rect = $(canvas_back).offset();
                            var offset_x = Math.floor(e.pageX - startmove_mouse_x);
                            var offset_y = Math.floor(e.pageY - startmove_mouse_y);
                            current_path.push({ x: offset_x, y: offset_y, t: t });
                        }
                    });
                    track_face.on('touchend', function (mevent) {
                        if (current_status != 0 || istartmove == false) return;
                        istartmove = false;
                        track_mask.css("zIndex", 1);

                        current_status = 1;
                        drawcanvas(ctx, canvas_font, current_path[current_path.length - 1].x, 0);
                        callverify(ctx);
                    });
                }
                verifypannel.append(track_back);
            }
            img.src = verify_configs.verifyurl + verify_configs.viewpath + "?VerifyId=" + current_verifyid;
        }
        else {//==1
            var img = new Image();
            img.onload = function () {
                var canvas_back = document.createElement("canvas");
                canvas_back.width = 320;
                canvas_back.height = img.height;
                var ctx = canvas_back.getContext("2d");
                //console.log(img.width);
                ctx.drawImage(img, 0, 0, img.width, img.height);
                verifypannel.append(canvas_back);
                $(canvas_back).click(function (e) {
                    if (current_status != 0) return;
                    if (current_path.length == 4) { return; }
                    var rect = $(canvas_back).offset();
                    var offset_x = Math.floor(e.pageX - rect.left);
                    var offset_y = Math.floor(e.pageY - rect.top);
                    ctx.beginPath();
                    ctx.lineWidth = 2;
                    var gradient = ctx.createLinearGradient(offset_x, offset_y, offset_x + 10, offset_y + 10);
                    gradient.addColorStop("0", "white");
                    gradient.addColorStop("0.4", "green");
                    gradient.addColorStop("0.7", "yellow");
                    ctx.strokeStyle = gradient;
                    ctx.arc(offset_x, offset_y, 10, 0, 360);
                    ctx.stroke();

                    ctx.beginPath();
                    ctx.lineWidth = 2;
                    var gradient2 = ctx.createLinearGradient(offset_x, offset_y, offset_x + 10, offset_y);
                    gradient2.addColorStop("0", "yellow");
                    gradient2.addColorStop("0.4", "green");
                    gradient2.addColorStop("0.7", "white");
                    ctx.strokeStyle = gradient2;
                    ctx.arc(offset_x, offset_y, 12, 0, 360);
                    ctx.stroke();

                    var text = current_path.length + 1;
                    ctx.font = 'bold 18px Arial';
                    ctx.lineWidth = 1;
                    ctx.textAlign = 'left';
                    ctx.textBaseline = 'top';
                    ctx.fillStyle = '#666666';
                    var size = ctx.measureText(text)
                    ctx.fillText(text, offset_x - (24 - size.width) * 0.5 + 3.5, offset_y - 5);
                    ctx.fillStyle = 'yellow';
                    ctx.fillText(text, offset_x - (24 - size.width) * 0.5 + 1.5, offset_y - 7);


                    if (current_path.length == 0) {
                        current_startdate = new Date();
                        current_path.push({ x: offset_x, y: offset_y, t: 0 })
                    }
                    else {
                        current_path.push({ x: offset_x, y: offset_y, t: new Date() - current_startdate })
                    }

                    if (current_path.length == 4) {
                        current_status = 1;
                        callverify(ctx);
                    }
                });
            }
            img.src = verify_configs.verifyurl + verify_configs.viewpath + "?VerifyId=" + current_verifyid;
        }
        verify_configs.viewcontent.append(verifypannel);
        $("#idc_avtive_verify img").click(function() {
            loadverify();
        });
        //窗体居中
        var ownercontainer = verify_configs.viewcontent;
        var offsetwidth = parseInt(ownercontainer.css("paddingLeft").replace("px", ""));
        if (isNaN(offsetwidth)) {
            offsetwidth = 0;
        }
        var offsetleft = ownercontainer.parent().outerWidth() - (verify_configs.width + offsetwidth * 2);
        if (offsetleft < 0) {
            offsetleft = 0;
        }
        ownercontainer.css("left", offsetleft * 0.5);
    }

    function callverify(context) {
        var verifydata = "";
        if (current_verifytype == 0) {
            var pre = "";
            var tempdatas = new Array(20);
            if (current_path.length > 20) {
                tempdatas[0] = current_path[0];
                for (var i = 1; i < 19; i++) {
                    tempdatas[i] = current_path[Math.floor((i / 20) * current_path.length)];
                }
                tempdatas[19] = current_path[current_path.length - 1];
            }
            else {
                tempdatas = current_path;
            }
            for (var i = 0; i < tempdatas.length; i++) {
                var d = tempdatas[i];
                verifydata += pre;
                verifydata = verifydata + (d.x + "|" + d.y + "|" + d.t);
                pre = ",";
            }
        }
        else {
            var pre = "";
            for (var i = 0; i < current_path.length; i++) {
                var d = current_path[i];
                verifydata += pre;
                verifydata = verifydata + (d.x + "|" + d.y + "|" + d.t);
                pre = ",";
            }
        }
        var totaltimes = current_path[current_path.length - 1].t * 0.001;
        if (current_verifytype == 0) {
            if (totaltimes < 0.3 || totaltimes > 5) {
                drawresult(context, "超时验证时效");
                setTimeout(function () {
                    loadverify();
                }, 500);
                return;
            }
        }
        else {
            if (totaltimes < 0.3 || totaltimes > 7) {
                drawresult(context, "超时验证时效");
                setTimeout(function () {
                    loadverify();
                }, 500);
                return;
            }
        }
        $.getJSON(verify_configs.verifyurl + verify_configs.checkpath, { VerifyId: current_verifyid, VerifyData: verifydata }, function (response) {
            if (HB.IsSucess(response)) {
                var data = response.ResultData;
                if (data.VerifyResult) {
                    //console.log(data.VerifySignal);
                    drawresult(context, totaltimes.toFixed(2) + " S");
                    if (verify_configs.onverify != null && typeof (verify_configs.onverify) == "function") {
                        setTimeout(function () {
                            verify_configs.onverify(current_verifyid, data.VerifySignal);
                        }, 1500);
                    }
                }
                else {
                    drawtext(context, data.VerifySignal);
                    reloadverify();
                }
            }
            else {
                drawtext(context, response.Message);
                reloadverify();
            }
        });

    }
    function drawtext(context, text) {
        context.font = 'bold 30px Arial';
        context.textAlign = 'left';
        context.textBaseline = 'top';
        context.fillStyle = '#666666';
        var size = context.measureText(text)
        context.fillText(text, 0.5 * (320 - size.width), 0.5 * (160 - 35));
        context.fillStyle = 'yellow';
        context.fillText(text, 0.5 * (320 - size.width) + 3, 0.5 * (160 - 35) + 3);
    }
    function drawresult(context, text) {
        context.font = 'bold 50px 黑体';
        context.textAlign = 'left';
        context.textBaseline = 'top';
        context.fillStyle = '#666666';
        var size = context.measureText(text)
        context.fillText(text, 0.5 * (320 - size.width) + 3, 0.5 * (160 - 35) + 3);
        context.fillStyle = 'yellow';
        context.fillText(text, 0.5 * (320 - size.width), 0.5 * (160 - 35));
    }
    this.Show = function () {
        var dialog = $("#idc_verify_dialog");
        if (dialog.length > 0) {
            dialog.remove();
        }
        dialog = $('<div id="idc_verify_dialog"><div class="verify-mask"></div></div>');
        if (verify_configs.viewcontent == null) {
            $(document.body).append(dialog);
            dialog.css("position", "fixed");
        }
        else {
            dialog.css("position", "absolute");
            verify_configs.viewcontent.css("position", "relative");
            verify_configs.viewcontent.append(dialog);
        }
        verify_configs.viewcontent = dialog;
        $("#idc_verify_dialog").show();
        createverify();
    }
    this.Close = function () {
        $("#idc_verify_dialog").hide();
    }
}();
