<div id="emoticons" class="clearfix" style="display: none;">
Cargando...
</div>
{literal}
<script type="text/javascript">
    $(document).ready(function(){
        $.ajax({
            url: global_data.url + '/emoticones-load.php',
            success: function(h){
                $('#emoticons').html(h);
                loadRecentEmoticons();
            }
        });
        $('#emoticons .e_tabs li').live('click', function(){
            $('#emoticons .e_tabs li.active, #emoticons .e_container .e_content.active').removeClass('active');
            $(this).addClass('active');
            var id = $(this).data('tab');
            $('#emoticons .e_container .e_content.ec_tab_'+id).addClass('active');
        });
        $('#emoticons .e_nav a').live('click', function(){
            var px = 60,
                obj = $('#emoticons .e_container .e_content.active'),
                mtop = parseInt(obj.css('margin-top')),
                emoticons = obj.children('a').length,
                pages = Math.ceil(emoticons / 44),
                limit = (pages-1) * px;

            if($(this).hasClass('en_up') && mtop < 0) {
                obj.animate({marginTop : (mtop+px)+'px'}, 200);
            } else if($(this).hasClass('en_down') && mtop > -limit) {
                obj.animate({marginTop : (mtop-px)+'px'}, 200);
            }
        });
        $('#emoticons .e_container .e_content a').live('click', function(){
            var code = $(this).data("code"),
                insert = ' ' + code + ' ',
                cookie = $.cookie('emoticons'),
                items = cookie ? cookie.split(/,/) : new Array();

            // MarkItUp
            $.markItUp({ replaceWith:insert });

            // Wysiwyg
            //$('#wysibb, #respuesta, #body_comm').insertAtCursor(insert);

            if($.inArray(code, items) >= 0) {
                items.splice($.inArray(code, items), 1);
            }

            items.push(code);

            $.cookie('emoticons', items.join(','), {expires: 90});

            $("#emoticons .e_container .ec_tab_0 a").each(function(i) {
                if($(this).data('code') == code) $(this).remove();
            });

            $(this).clone().prependTo("#emoticons .e_container .ec_tab_0");

            return false;
        });
        function loadRecentEmoticons() {
            var cookie = $.cookie('emoticons');
            if(cookie) {
                items = cookie.split(/,/);
                for (var i = 0; i <= items.length; i++) {
                    $('#emoticons .e_container a[data-code="' + items[i] + '"]').clone().prependTo("#emoticons .e_container .ec_tab_0");
                };
            }
        }
    });
</script>
{/literal}