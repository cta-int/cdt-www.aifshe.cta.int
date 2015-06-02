$(document).ready(function() {
    var startNumber;
    var endNumber;
    var active;
    var lastStartNumber;
    var lastEndNumber;
    /**
     * Execute when the hidden field for the current value is ready
     */
    $("input[id=reportItem_currentSituationRating]").ready(function(){
        var currentValue = $("input[id=reportItem_currentSituationRating]").val();
        if (currentValue) {
            startNumber = currentValue;
            var currentClass = currentValue.replace(".0", "").replace(".", "-");
            $(this).find('ul.current_situation li span[name="' + currentClass + '"]').addClass('flag-start');
        }

    });

    /**
     * Execute when the hidden field for the desired value is ready
     */
    $("input[id=reportItem_desiredSituationRating]").ready(function(){
        var desiredValue =$("input[id=reportItem_desiredSituationRating]").val();
        if (desiredValue) {
            endNumber = desiredValue;
            var desiredClass = desiredValue.replace(".0", "").replace(".", "-");
            $(this).find('ul.desired_situation li span[name="' + desiredClass + '"]').addClass('flag-end');
        }

    });

    /**
     * Handle change in criterion selectbox
     */
    $("select[name=select_criterion]").change(function(e){
        var criterion = $(this).val().split('-');
        var goToUrl = reportEditBaseUrl + '/' + criterion[0] + '/' + criterion[1];
        window.location.replace(goToUrl);
    });

    /**
     * Handle clicks in the flags list
     */
    $('ul#flags.current_situation li span').click(function(){
        active = $(this);
        startNumber = $(this).attr("name");
        startNumber = startNumber.replace("-0", "").replace("-", ".");
        changeFlag(active);
    });

    $('ul#flags.desired_situation li span').click(function(){
        active = $(this);
        endNumber = $(this).attr("name");
        endNumber = endNumber.replace("-0", "").replace("-", ".");
        changeFlag(active);
    });


    function changeFlag(active) {
        if(!startNumber || !endNumber || parseFloat(startNumber) <= parseFloat(endNumber)) {

            // Loop over this parent to remove all flags
            $(active).parent().children('span').each(function(i) {
                $(this).removeClass('flag-start flag-end');
            });
            // Add new flag and write value to hidden field
            var value       = $(active).attr('name').replace('-', '.');
            var parentClass = $(active).closest('ul').attr('class');
            switch (parentClass) {

                case 'current_situation':
                    startNumber = startNumber.replace(".0", "").replace("-", ".");
                    $(active).addClass('flag-start');
                    $('input#reportItem_currentSituationRating').val(value);
                    break;
                case 'desired_situation':
                    endNumber = endNumber.replace(".0", "").replace("-", ".");
                    $(active).addClass('flag-end');
                    $('input#reportItem_desiredSituationRating').val(value);
                    break
            }

            lastStartNumber = startNumber;
            lastEndNumber = endNumber;
        } else {
            startNumber = lastStartNumber;
            endNumber = lastEndNumber;

            $("#dialog").dialog("open");
        }
    };

});