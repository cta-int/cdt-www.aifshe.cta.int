function loadSelectCriterion() {
    var chapterCounter, paragraphCounter, option,
        chapter, paragraph,
        select = $('select[name="select_criterion"]');
    for (chapterCounter in criterion[translations.language].criterionItems.chapter) {
        chapter = criterion[translations.language].criterionItems.chapter[chapterCounter];
        for (paragraphCounter in chapter.paragraph) {
            paragraph = chapter.paragraph[paragraphCounter];
            option = $('<option></option>', {
                value: chapter.Nr + '-' + paragraph.Nr,
                html: chapter.Nr + '.' + paragraph.Nr + '. ' + paragraph.criterion
            });
            select.append(option);
        }
    }
}


$(document).ready(function () {

    var startNumber;
    var endNumber;
    var active;
    var lastStartNumber;
    var lastEndNumber;


    /**
     * Execute when the hidden field for the current value is ready
     */
    $("#reportItem_currentSituationRating").change(function () {
        var currentValue = $(this).val();
        if (currentValue) {
            startNumber = currentValue;
            var currentClass = currentValue.replace(".0", "").replace(".", "-");
            $(this).find('ul.current_situation li span[name="' + currentClass + '"]').addClass('flag-start');
        }
    });

    /**
     * Execute when the hidden field for the desired value is ready
     */
    $("#reportItem_desiredSituationRating").change(function () {
        var desiredValue = $(this).val();
        if (desiredValue) {
            endNumber = desiredValue;
            var desiredClass = desiredValue.replace(".0", "").replace(".", "-");
            $(this).find('ul.desired_situation li span[name="' + desiredClass + '"]').addClass('flag-end');
        }
    });

    /**
     *
     * @param chapterNr
     * @param paragraphNr
     * @param formData
     * @returns {boolean}
     */
    function updateReport(chapterNr, paragraphNr, formData) {
        var chapter = reportModel.getChapter(chapterNr),
            paragraph = reportModel.getParagraph(chapterNr, paragraphNr);

        if (!chapter) {
            reportModel.addChapter(chapterNr);
            chapter = reportModel.getChapter(chapterNr);
        }
        if (!paragraph) {
            reportModel.addParagraph(chapterNr, paragraphNr);
            paragraph = reportModel.getParagraph(chapterNr, paragraphNr);
        }

        reportModel.paragraphSet(chapterNr, paragraphNr, formData);
        return reportModel.save();
    }

    /**
     * Handle clicks in the flags list
     */
    $('ul#flags.current_situation li span').click(function () {
        active = $(this);
        startNumber = $(this).attr("name");
        startNumber = startNumber.replace("-0", "").replace("-", ".");
        endNumber = $("input#reportItem_desiredSituation").val();
        changeFlag(active);
    });

    $('ul#flags.desired_situation li span').click(function () {
        active = $(this);
        endNumber = $(this).attr("name");
        endNumber = endNumber.replace("-0", "").replace("-", ".");
        startNumber = $("input#reportItem_currentSituation").val();
        changeFlag(active);
    });


    /**
     *
     * @param active
     */
    function changeFlag(active) {
        if (!startNumber || !endNumber || parseFloat(startNumber) <= parseFloat(endNumber)) {

            // Loop over this parent to remove all flags
            $(active).parent().children('span').each(function (i) {
                $(this).removeClass('flag-start flag-end');
            });
            // Add new flag and write value to hidden field
            var value = $(active).attr('name').replace('-', '.');
            var parentClass = $(active).closest('ul').attr('class');
            switch (parentClass) {

                case 'current_situation':
                    startNumber = startNumber.replace(".0", "").replace("-", ".");
                    $(active).addClass('flag-start');
                    $('input#reportItem_currentSituation').val(value);
                    break;
                case 'desired_situation':
                    endNumber = endNumber.replace(".0", "").replace("-", ".");
                    $(active).addClass('flag-end');
                    $('input#reportItem_desiredSituation').val(value);
                    break;
            }

            lastStartNumber = startNumber;
            lastEndNumber = endNumber;
        } else {
            startNumber = lastStartNumber;
            endNumber = lastEndNumber;
            dialog({
                text: 'The start level can not exceed the final level.',
                type: 'error'
            });
        }
    };

    /**
     *
     */
    function loadCriterionData() {

        // clear the form
        $('input[type="text"], input[type="hidden"], textarea').each(function () {
            $(this).val(null);
        });

        $('input[type="checkbox"]').each(function () {
            if ($(this).is(':checked')) {
                $(this).click();
            }
        });

        $('ul#flags.current_situation li span[name="0"]').parent().children().each(function () {
            $(this).removeClass('flag-start flag-end');
        });

        $('ul#flags.desired_situation li span[name="0"]').parent().children().each(function () {
            $(this).removeClass('flag-start flag-end');
        });

        // first make sure the fields are cleared
        var option = getSelectedCriterion(),
            paragraph = reportModel.getParagraph(option.split('-')[0], option.split('-')[1]),
            currentSituation = parseFloat(paragraph.currentSituation),
            currentSituationComment = paragraph.currentSituationComment,
            desiredSituation = parseFloat(paragraph.desiredSituation),
            desiredSituationComment = paragraph.desiredSituationComment,
            hasHighPriority = parseFloat(paragraph.priority),
            name;

        // current situation
        if (currentSituation >= 0) {
            $('input#reportItem_currentSituation').val(currentSituation);
            startNumber = currentSituation.toString();
            endNumber = desiredSituation;
            if (currentSituation % 1 != 0) {
                name = startNumber.replace('.', '-');
            } else {
                name = startNumber;
            }
            changeFlag($('ul#flags.current_situation li span[name="' + name + '"]'));
        }
        $('textarea#reportItem_currentSituationComment').val(currentSituationComment);

        // desired situation
        if (desiredSituation >= 0) {
            $('input#reportItem_desiredSituation').val(desiredSituation);
            endNumber = desiredSituation.toString();
            startNumber = currentSituation;
            if (desiredSituation % 1 != 0) {
                name = endNumber.replace('.', '-');
            } else {
                name = endNumber;
            }
            changeFlag($('ul#flags.desired_situation li span[name="' + name + '"]'));
        }
        $('textarea#reportItem_desiredSituationComment').val(desiredSituationComment);

        if (hasHighPriority) {
            $('input#reportItem_hasHighPriority:not(:checked)').click();// if it is already checked we do not have to set it checked again
        }
    }

    /**
     * submit form with different buttons
     */
    $('button[type=submit]').click(function () {
        event.preventDefault();

        var button = $(event.target).attr('id');
        var formData = {};
        var data = $('form').serializeArray();

        for (var i in data) {
            if (data[i]['name'] == 'select_criterion') {
                var chapterNr = data[i]['value'].split('-')[0];
                var paragraphNr = data[i]['value'].split('-')[1];
            } else {
                formData[data[i]['name']] = data[i]['value'];
            }
        }
        if (button == 'reportItem_saveAndNext') {
            updateReport(chapterNr, paragraphNr, formData);
            // select next option
            $('#select_criterion').val(function () {
                var nextOption = $('#select_criterion').children(':selected').next();
                if ($(nextOption).val() == undefined) {
                    nextOption = $(this).children('option:first');
                }
                $("div.jqTransformSelectWrapper span").text($(nextOption).text());
                return $(nextOption).val();
            }).change();
        } else if (button == 'reportItem_save') {
            if(updateReport(chapterNr, paragraphNr, formData)){
                dialog({
                    type: 'notice',
                    title: 'success',
                    text: translations.getTranslation('offline.report.notice.updated.success')
                });
            }
        }
    });

    function renderCriterionInfo() {
        $('div#info').each(function () {
            $(this).html('');
            var selectedCriterion = getSelectedCriterion();
            var selectedChapter = selectedCriterion.split('-')[0];
            var selectedParagraph = selectedCriterion.split('-')[1];
            var i , ii, iii, chapter, paragraph, stage;
            for (i in criterion[translations.language].criterionItems.chapter) {
                chapter = criterion[translations.language].criterionItems.chapter[i];
                if (chapter.Nr == selectedChapter) {
                    for (ii in chapter.paragraph) {
                        paragraph = chapter.paragraph[ii];
                        if (paragraph.Nr == selectedParagraph) {
                            for (iii in paragraph.stages) {
                                stage = paragraph.stages[iii];
                                $(this).append($('<h3></h3>', {'text': translations.getTranslation('report.stage' + stage.stage) }));
                                $(this).append($('<p></p>', {'text': stage.info}));
                            }
                        }
                    }
                }
            }
        })
    }

    loadCriterionData();
    $('#select_criterion').change(function () {
        loadCriterionData();
        renderCriterionInfo();
    });

    function getSelectedCriterion() {
        return $('#select_criterion').val();
    }

    renderCriterionInfo();
});

