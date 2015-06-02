$(document).ready(function() {

    /**
     * Execute for each currentSituation hidden field
     */
    $('input[type="hidden"][name="currentSituation"]').each(function(){
        var name = $(this).val().replace('.0', '').replace('.', '-');
        $(this).parent().find('span[name="' + name + '"]').addClass('flag-start flag-end');
    });

    /**
     * Execute for each desiredSituation hidden field
     */
    $('input[type="hidden"][name="desiredSituation"]').each(function(){
        var name = $(this).val().replace('.0', '').replace('.', '-');
        var startField = $(this).parent().find('span.flag-start.flag-end');
        var endField = $(this).parent().find('span[name="' + name + '"]');

        startField.removeClass('flag-end');
        endField.addClass('flag-end');

        if (startField.attr('name') != endField.attr('name')) {
            drawLines($(this));
        }
    });

    /**
     * Handle click in the flags column
     */
    $('ul#flags li span').click(function(){
        // Do nothing whem the column already has a flag
        if ($(this).hasClass('flag-start')
            || $(this).hasClass('flag-end')
            || $(this).attr('name') == undefined) {
            return;
        }

        var name = $(this).attr('name');
        var formData = {};
        if ($(this).parent().find('span.flag-start.flag-end').length) {
            // Second click, add end flag
            // Do nothing when the end flag is smaller than start flag
            if ($(this).attr('name') <= $(this).parent().find('span.flag-start.flag-end').attr('name')) {
                return;
            }

            // remove start+end flag, place start flag instead and add end flag
            $(this).parent().find('span.flag-start.flag-end').removeClass('flag-start flag-end').addClass('flag-start');
            $(this).removeClass('flag-start flag-end').addClass('flag-end');

            // Draw lines between the flags
            drawLines($(this));

            // Data to save by ajax request
            formData = { endflag : name.replace('-', '.') };
        } else {
            // First click, add start+end flag
            if (!$(this).parent().find('span.flag-start').length) {
                $(this).removeClass('flag-start flag-end').addClass('flag-start flag-end');
            }

            // Data to save by ajax request
            formData = { startflag : name.replace('-', '.') };
        }

        // Do ajax save request
        updateReport($(this), formData);
    });

    /**
     * Handle click on the delete button
     */
    $('ul#flags li span.empty img').click(function(){
        var listItem    = $(this).closest('li');
        var title       = listItem.children('span.title');
        var self        = $(this);


        $("#dialog").html(ci_dialog.text + '&nbsp;[' + title.text() + '] ?');
        $("#dialog").dialog("option","title", ci_dialog.title);
        $("#dialog").dialog("option","buttons", [
            {
                text: ci_dialog.confirm,
                click: function() {
                    // clear checkboxes
                    listItem.find('input[type="checkbox"]:checked').each(function(){
                        listItem.find('a').trigger('click');
                    });

                    // clear flags
                    listItem.find('span').each(function(){
                        $(this).removeClass( 'flag-start flag-line flag-end' );
                    });

                    // Do ajax save request
                    updateReport(self, { startflag: null, endflag: null, priority: 0 })

                    // close the window
                    $(this).dialog("close");
                }
            },
            {
                text: ci_dialog.cancel,
                click: function() {
                    $(this).dialog("close");
                }
            }
        ]);

        $("#dialog").dialog("open");
    });

    /**
     * Handle click on priority checkbox
     */
    $('ul#flags li span.priority input[name="ch_priority"]').click(function(){
        var val = null;
        if ($(this).prop('checked')) {
            val = 0;
        } else {
            val = 1;
        }

        // Do ajax save request
        updateReport($(this), { priority : val });
    });

    /**
     * Ajax request to update report
     * @param trigger
     * @param {object}formData
     */
    function updateReport(trigger, formData){
        var ul     = trigger.closest('ul');
        var parent = trigger.closest('li').children('span.title');
        $.ajax({
            type: "POST",
            url: pageUrl + "/" + parent.attr('chapter') + '/' + parent.attr('paragraph'),
            data: { formdata: formData }
        });
    }

    /**
     * Draw lines between the start flag and end flag
     * @param trigger
     */
    function drawLines(trigger){
        var flagStart  = trigger.parent().find('span.flag-start');
        var flagEnd    = trigger.parent().find('span.flag-end');
        var regexEnd   = /[0-9]+-[0-9]+/g;
        var regexStart = /[0-9]+-[0-9]+/g;
        if (!regexStart.test(flagStart.attr('name'))) {
            if (flagStart.attr('name') + '-5' !== flagEnd.attr('name')) {
                trigger.parent().find('span[name="' + flagStart.attr('name') + '-5"]').addClass('flag-line');
            }
        } else {
            var flagStartRegexGetFirst = /^([0-9]*)/g;
            var flagStartName          = flagStart.attr('name').match(flagStartRegexGetFirst);
        }

        if (regexEnd.test(flagEnd.attr('name'))) {
            var flagEndRegexGetFirst = /^([0-9]*)/g;
            var flagEndName          = flagEnd.attr('name').match(flagEndRegexGetFirst);
            if(parseInt(flagEndName) !== parseInt(flagStart.attr('name'))){
                trigger.parent().find('span[name="' + flagEndName + '"]').addClass('flag-line');
            }
        }

        if (flagStart.length && flagEnd.length) {
            for (var i=0; i < 6; i++) {
                if((flagStart.attr('name') < i || flagStartName < i) && (flagEnd.attr('name') > i || flagEndName > i)){
                    trigger.parent().find('span[name="' + i + '"]').addClass('flag-line');
                    trigger.parent().find('span[name="' + i + '-5"]').addClass('flag-line');
                }
            }
        }
    }
});