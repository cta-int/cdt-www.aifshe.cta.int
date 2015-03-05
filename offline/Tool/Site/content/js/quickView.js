var ci_dialog = {
    //@todo: add translation
    title: translations.getTranslation('offline.report.item.criterion.notice.clear.title'),
    text: translations.getTranslation('offline.report.item.criterion.notice.clear.text'),
    confirm: translations.getTranslation('notice.buttons.confirm'),
    cancel: translations.getTranslation('notice.buttons.cancel')
};

function renderFlagGrid() {
    var i, img, input, li, span, chapterCounter, paragraphCounter;
    for (chapterCounter in criterion[translations.language].criterionItems.chapter) {
        var chapter = criterion[translations.language].criterionItems.chapter[chapterCounter];
        li = $('<li></li>');
        li.addClass('criterion-row');
        $('ul#flags').append(li);

        for (paragraphCounter in chapter.paragraph) {
            var paragraph = chapter.paragraph[paragraphCounter];

            /**
             * check if reportItem exists in cache to load existing data
             */

            li = $('<li></li>');

            /**
             * title, chapter, paragraph
             */
            span = $('<span></span>', {
                'class': 'title',
                'chapter': chapter.Nr,
                'paragraph': paragraph.Nr,
                'html': chapter.Nr + '.' + paragraph.Nr + ' . ' + paragraph.criterion
            });
            li.append(span);

            /**
             * flag area
             */
            for (i = 0; i <= 5; i++) {
                span = $('<span></span>', {
                    'name': i,
                    'html': '\u00a0'
                });
                li.append(span);
                if (i > 0 && i < 5) {
                    span = $('<span></span>', {
                        'name': i + "-5",
                        'html': '\u00a0'
                    });
                    li.append(span);
                }
            }
            /**
             * priority
             */

            span = $('<span></span>', {
                'class': 'priority'
            });

            input = $('<input/>', {
                'type': 'checkbox',
                'name': 'ch_priority',
                'value': chapter.Nr + '.' + paragraph.Nr
            });

            span.append(input);
            li.append(span);

            /**
             * empty
             * @type {*|jQuery|HTMLElement}
             */
            span = $('<span></span>', {
                'class': 'empty'
            });
            img = $('<img/>', {
                'src': '../../css/img/icon-delete-black.png'
            });
            span.append(img);
            li.append(span);

            var paragraphData = reportModel.getParagraph(chapter.Nr, paragraph.Nr);
            if (paragraphData != false) {
                if (paragraphData['currentSituation'] && paragraphData['currentSituation'] != undefined) {
                    input = $('<input/>', {
                        'type': 'hidden',
                        'name': 'currentSituation',
                        'value': paragraphData['currentSituation']
                    });
                    li.append(input);
                }
                if (paragraphData['desiredSituation'] && paragraphData['desiredSituation'] != undefined) {
                    input = $('<input/>', {
                        'type': 'hidden',
                        'name': 'desiredSituation',
                        'value': paragraphData['desiredSituation']
                    });
                    li.append(input);
                }
            }
            $('ul#flags').append(li);
        }
        /**
         * and finally append the "li" to the "ul"
         */
        $('ul#flags').append(li);
    }
}

$(document).ready(function () {
        /**
         * Execute for each currentSituation hidden field
         */
        $('input[type="hidden"][name="currentSituation"]').each(function () {
            var name = $(this).val().replace('.0', '').replace('.', '-');
            $(this).parent().find('span[name="' + name + '"]').addClass('flag-start flag-end');
        });

        /**
         * Execute for each desiredSituation hidden field
         */
        $('input[type="hidden"][name="desiredSituation"]').each(function () {
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
         *
         */
        $('input[name="ch_priority"]').each(function () {
            var chapter = $(this).closest('li').find('span').attr('chapter');
            var paragraph = $(this).closest('li').find('span').attr('paragraph');
            for (i in reportModel.reportItems) {
                for (ii in reportModel.reportItems[i]['children']) {
                    if (reportModel.reportItems[i]['chapterNr'] == chapter && reportModel.reportItems[i]['children'][ii]['paragraphNr'] == paragraph) {
                        if (reportModel.reportItems[i]['children'][ii]['priority']) {
                            $(this).click();
                        }
                    }
                }
            }
        });

        /**
         * Handle click in the flags column
         */
        $('ul#flags li span').click(function () {
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

                // remove start+end flag, place start flag instead and add end flagn
                $(this).parent().find('span.flag-start.flag-end').removeClass('flag-start flag-end').addClass('flag-start');
                $(this).removeClass('flag-start flag-end').addClass('flag-end');

                // Draw lines between the flags
                drawLines($(this));

                // Data to save by ajax request
                formData = { desiredSituation: name.replace('-', '.') };
            } else {
                // First click, add start+end flag
                if (!$(this).parent().find('span.flag-start').length) {
                    $(this).removeClass('flag-start flag-end').addClass('flag-start flag-end');
                }

                // Data to save by ajax request
                formData = { currentSituation: name.replace('-', '.') };
            }

            // Do ajax save request
            updateReport($(this), formData);
        });

        /**
         * Handle click on the delete button
         */
        $('ul#flags li span.empty img').click(function () {
            var listItem = $(this).closest('li');
            var title = listItem.children('span.title');
            var self = $(this);


            $("#dialog").html(ci_dialog.text + '&nbsp;[' + title.text() + '] ?');
            $("#dialog").dialog("option", "title", ci_dialog.title);
            $("#dialog").dialog("option", "buttons", [
                {
                    text: ci_dialog.confirm,
                    click: function () {
                        // clear checkboxes
                        listItem.find('input[type="checkbox"]:checked').each(function () {
                            listItem.find('a').trigger('click');
                        });

                        // clear flags
                        listItem.find('span').each(function () {
                            $(this).removeClass('flag-start flag-line flag-end');
                        });

                        // Do ajax save request
                        updateReport(self, { currentSituation: null, desiredSituation: null, priority: 0 })

                        // close the window
                        $(this).dialog("close");
                    }
                },
                {
                    text: ci_dialog.cancel,
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ]);

            $("#dialog").dialog("open");
        });

        /**
         * Handle click on priority checkbox
         */
        $('ul#flags li span.priority input[name="ch_priority"]').click(function () {
            var val = ($(this).is(':checked') ? 1 : 0);
            // Do ajax save request
            updateReport($(this), { priority: val });
        });

        /**
         * Ajax request to update report
         * @param trigger
         * @param {object}formData
         */
        function updateReport(trigger, formData) {
            var ul = trigger.closest('ul');
            var parent = trigger.closest('li').children('span.title');
            var chapter = reportModel.getChapter(parent.attr('chapter')),
                paragraph = reportModel.getParagraph(parent.attr('chapter'), parent.attr('paragraph'));

            if (!chapter) {
                reportModel.addChapter(parent.attr('chapter'));
                chapter = reportModel.getChapter(parent.attr('chapter'));
            }
            if (!paragraph) {
                reportModel.addParagraph(parent.attr('chapter'), parent.attr('paragraph'));
                paragraph = reportModel.getParagraph(parent.attr('chapter'), parent.attr('paragraph'));
            }

            reportModel.paragraphSet(parent.attr('chapter'), parent.attr('paragraph'), formData);
            reportModel.save();
        }

        /**
         * Draw lines between the start flag and end flag
         * @param trigger
         */
        function drawLines(trigger) {
            var flagStart = trigger.parent().find('span.flag-start');
            var flagEnd = trigger.parent().find('span.flag-end');
            var regexEnd = /[0-9]+-[0-9]+/g;
            var regexStart = /[0-9]+-[0-9]+/g;
            if (!regexStart.test(flagStart.attr('name'))) {
                if (flagStart.attr('name') + '-5' !== flagEnd.attr('name')) {
                    trigger.parent().find('span[name="' + flagStart.attr('name') + '-5"]').addClass('flag-line');
                }
            } else {
                var flagStartRegexGetFirst = /^([0-9]*)/g;
                var flagStartName = flagStart.attr('name').match(flagStartRegexGetFirst);
            }

            if (regexEnd.test(flagEnd.attr('name'))) {
                var flagEndRegexGetFirst = /^([0-9]*)/g;
                var flagEndName = flagEnd.attr('name').match(flagEndRegexGetFirst);
                if (parseInt(flagEndName) !== parseInt(flagStart.attr('name'))) {
                    trigger.parent().find('span[name="' + flagEndName + '"]').addClass('flag-line');
                }
            }

            if (flagStart.length && flagEnd.length) {
                for (var i = 0; i < 6; i++) {
                    if ((flagStart.attr('name') < i || flagStartName < i) && (flagEnd.attr('name') > i || flagEndName > i)) {
                        trigger.parent().find('span[name="' + i + '"]').addClass('flag-line');
                        trigger.parent().find('span[name="' + i + '-5"]').addClass('flag-line');
                    }
                }
            }
        }
    }

)
;