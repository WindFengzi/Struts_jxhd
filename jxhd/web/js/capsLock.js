//=============== ��д����������ʾ ============================================//
/*
ʹ�ã�$("#txtPWD").capsLockTip(); //ע�ⲻҪ��Щ�������$(document).ready()���档
*/
(function ($) {
    $.fn.extend({
        capsLockTip: function () {
            return this.each(function () {
                //��������ʵ�������档
                //��ȡʵ������var api = $("#txtPWD").data("txtPWD");
                var ins = new $.CapsLockTip($(this));
                $(this).data(this.id, ins);
            });
        }
    });


    //����һ��ʵ����
    //___target jqĿ�����
    //___divTipID   ��ʾ��ʾ�ı���div��
    $.CapsLockTip = function (___target) {
        //���õ�ǰʵ�������ò�����
        this.target = ___target;
        var _this = this;

        $(document).ready(function () {         
            _this.target.bind("keypress", function (_event) {
                var e = _event || window.event;
                var kc = e.keyCode || e.which;
                var isShift = e.shiftKey || (kc == 16) || false; // shift���Ƿ�ס
                $.fn.capsLockTip.capsLockActived = false;
                if ((kc >= 65 && kc <= 90 && !isShift) || (kc >= 97 && kc <= 122 && isShift))
                    $.fn.capsLockTip.capsLockActived = true;
                _this.showTips($.fn.capsLockTip.capsLockActived);
            });

            _this.target.bind("keydown", function (_event) {
                var e = _event || window.event;
                var kc = e.keyCode || e.which;
                if (kc == 20 && null != $.fn.capsLockTip.capsLockActived){
                    $.fn.capsLockTip.capsLockActived = !$.fn.capsLockTip.capsLockActived;
                    _this.showTips($.fn.capsLockTip.capsLockActived);
                }
            });

            _this.target.bind("focus", function (_event) {
                if (null != $.fn.capsLockTip.capsLockActived)
                    _this.showTips($.fn.capsLockTip.capsLockActived);
            });

            _this.target.bind("blur", function (_event) {
                _this.showTips(false);
            });
        });

        //������ʾ��д������div��
        this.createTooltip = function(){
            if(null != $.fn.capsLockTip.divTip)
                return $.fn.capsLockTip.divTip;

            $("body").append("<div id='divTip__985124855558842555' style='width:100px; height:15px; padding-top:3px; display:none; position:absolute; z-index:9999999999999; text-align:center; background-color:#FDF6AA; color:Red; font-size:12px; border:solid 1px #DBC492; border-bottom-color:#B49366; border-right-color:#B49366;'>��д�����Ѵ�</div>");
            $.fn.capsLockTip.divTip = $("#divTip__985124855558842555");

            return $.fn.capsLockTip.divTip;
        };

        //��ʾ�����ش�д������ʾ��
        this.showTips = function (display) {
            var divTip = _this.createTooltip();
            if (display) {
                var offset = _this.target.offset();
                divTip.css("left", offset.left + "px");
                divTip.css("top", offset.top + _this.target[0].offsetHeight + 3 + "px");
                divTip.show();
            }
            else {
                divTip.hide();
            }
        };

        //jq�ؼ����þ�̬����

        //��ʾ��
        $.fn.capsLockTip.divTip = null;
        //��д������״̬
        $.fn.capsLockTip.capsLockActived = null;
    };
})(jQuery);