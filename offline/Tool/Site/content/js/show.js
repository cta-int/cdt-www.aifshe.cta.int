function renderFlagGrid() {
    var i, input, li, span, chapterCounter, paragraphCounter;
    for (chapterCounter in criterion[translations.language].criterionItems.chapter) {
        var chapter = criterion[translations.language].criterionItems.chapter[chapterCounter];
        li = $('<li></li>');
        li.addClass('criterion-row');
        li.css('cursor','auto');
        $('ul#flags').append(li);

        for (paragraphCounter in chapter.paragraph) {
            var paragraph = chapter.paragraph[paragraphCounter];
            var paragraphData = reportModel.getParagraph(chapter.Nr, paragraph.Nr);

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
            span.css('cursor','auto');
            li.append(span);

            /**
             * flag area
             */
            for (i = 0; i <= 5; i++) {
                span = $('<span></span>', {
                    'name': i,
                    'html': '\u00a0'
                });
                span.css('cursor','auto');
                li.append(span);
                if (i > 0 && i < 5) {
                    span = $('<span></span>', {
                        'name': i + "-5",
                        'html': '\u00a0'
                    });
                    span.css('cursor','auto');
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
                'value': chapter.Nr + '.' + paragraph.Nr,
                'checked': paragraphData.priority == 1,
                'disabled': true
            });

            span.append(input);
            li.append(span);

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
            li.css('cursor','auto');
            $('ul#flags').append(li);
        }
        /**
         * and finally append the "li" to the "ul"
         */
        $('ul#flags').append(li);
    }
}


function renderCriterionDetails() {
    var i, chapter, ii , paragraph, divReportItem, divTopShowReport, notYetDecided = translations.getTranslation('report.item.stage.0.0');
    for (i in criterion[translations.language].criterionItems.chapter) {
        chapter = criterion[translations.language].criterionItems.chapter[i];
        $('section#main-content').append($('<h1></h1>', {
            text: chapter.type
        }));
        $('section#main-content').append($('<h2></h2>', {
            text: chapter.Nr + '. ' + chapter.title
        }));
        divReportItem = $('<div></div>', {
            class: 'report-item'
        });
        for (ii in chapter.paragraph) {
            paragraph = chapter.paragraph[ii];
            divTopShowReport = $('<div></div>', {
                class: 'top-show-report'
            });
            divTopShowReport.append('<h3>'+translations.getTranslation('report.item.criterion')+' ' + chapter.Nr + '.' + paragraph.Nr + ' . ' + paragraph.criterion + '</h3>');
            divReportItem.append(divTopShowReport);
            if (reportModel.getParagraph(chapter.Nr, paragraph.Nr)) {
                var paragraphData = reportModel.getParagraph(chapter.Nr, paragraph.Nr);
                if (parseFloat(paragraphData.currentSituation)>=0) {
                    divReportItem.append($('<p></p>', {
                        'html': '<strong>'+translations.getTranslation('report.item.currentSituation')+': '+ translations.getTranslation('report.item.stage.'+parseFloat(paragraphData.currentSituation).toFixed(1)) + '</strong>'
                    }));
                    if (paragraphData.hasOwnProperty('currentSituationComment')) {
                        divReportItem.append($('<p></p>', {'html': paragraphData.currentSituationComment}));
                    }
                } else {
                    divReportItem.append('<p><strong>'+translations.getTranslation('report.item.currentSituation')+':</strong> ' + notYetDecided + '</p>');
                }
                if (parseFloat(paragraphData.desiredSituation)>=0) {
                    divReportItem.append($('<p></p>', {
                        'html': '<strong>'+translations.getTranslation('report.item.desiredSituation')+': '+translations.getTranslation('report.item.stage.'+parseFloat(paragraphData.desiredSituation).toFixed(1)) + '</strong>'
                    }));
                    if (paragraphData.hasOwnProperty('desiredSituationComment')) {
                        divReportItem.append($('<p></p>', {'html': paragraphData.desiredSituationComment}));
                    }
                } else {
                    divReportItem.append('<p><strong>'+translations.getTranslation('report.item.desiredSituation')+':</strong> ' + notYetDecided + '</p>');
                }
            } else {
                divReportItem.append($('<p></p>', {'html': notYetDecided}));
            }
        }
        $('section#main-content').append(divReportItem);
    }
}

function renderGeneralData() {
    var generalData = [];

    var currentRatings = [];
    var currentTotal = 0;
    var currentPlanTotal = 0;
    var currentDoTotal = 0;

    var desiredRatings = [];
    var desiredTotal = 0;
    var desiredPlanTotal = 0;
    var desiredDoTotal = 0;

    var i, ii, chapter, paragraph;
    for (i in reportModel.reportItems) {
        chapter = reportModel.reportItems[i];
        for (iii in criterion[translations.language].criterionItems.chapter) {
            var criterionChapter = criterion[translations.language].criterionItems.chapter[iii];
            if (criterionChapter.Nr == chapter.chapterNr) {
                var chapterType = criterionChapter.type;
                break;
            }
        }
        for (ii in chapter.children) {
            paragraph = chapter.children[ii];
            if (parseFloat(paragraph.currentSituation) >= 0) {
                currentRatings.push(parseFloat(paragraph.currentSituation));
                currentTotal += parseFloat(paragraph.currentSituation);
            } else {
                currentRatings.push(0);
            }
            if (parseFloat(paragraph.desiredSituation) >= 0) {
                desiredRatings.push(parseFloat(paragraph.desiredSituation));
                desiredTotal += parseFloat(paragraph.desiredSituation);
            } else {
                desiredRatings.push(0);
            }

            switch (chapterType) {
                case 'Plan':
                    if (parseFloat(paragraph.currentSituation) >= 0) {
                        currentPlanTotal += parseFloat(paragraph.currentSituation);
                    }
                    if (parseFloat(paragraph.desiredSituation) >= 0) {
                        desiredPlanTotal += parseFloat(paragraph.desiredSituation);
                    }
                    break;
                case 'Do':
                    if (parseFloat(paragraph.currentSituation) >= 0) {
                        currentDoTotal += parseFloat(paragraph.currentSituation);
                    }
                    if (parseFloat(paragraph.desiredSituation) >= 0) {
                        desiredDoTotal += parseFloat(paragraph.desiredSituation);
                    }
                    break;
            }
        }
    }

    var certificationTotals = [];
    for (i in criterion[translations.language].criterionItems.chapter) {
        chapter = criterion[translations.language].criterionItems.chapter[i];
        for (ii in chapter.paragraph) {
            paragraph = chapter.paragraph[ii];
            for (property in paragraph.certification) {
                if (!certificationTotals.hasOwnProperty(property)) {
                    certificationTotals[property] = 0;
                }
                certificationTotals[property] += parseFloat(paragraph.certification[property]);
            }
        }
    }

    generalData = {
        'Median': {
            current: median(currentRatings),
            desired: median(desiredRatings)
        },
        'Plan Do Balance': {
            current: currentDoTotal - currentPlanTotal,
            desired: desiredDoTotal - desiredPlanTotal
        },
        'Policy ambition': {
            current: '',
            desired: desiredTotal - currentTotal
        }
    }
//    Disable certifications
//    for (i in certificationTotals) {
//        //@todo: add translation
//        generalData['Distance to DHO ' + i] = {
//            'current': currentTotal - certificationTotals[i],
//            'desired': desiredTotal - certificationTotals[i]
//        }
//    }
    var table = $('<table></table>');
    var tableBody = $('<tbody></tbody>');
    tableBody.append($('<tr></tr>', {
        'class': 'toprow',
        'html': '<td>Global Indicators</td>' +
            '<td>Present Situation</td>' +
            '<td>Desired Situation</td>'
    }));
    for (var property in generalData) {
        tableBody.append($('<tr></tr>', {
            'html': '<td>' + property + '</td>' +
                '<td>' + generalData[property]['current'] + '</td>' +
                '<td>' + generalData[property]['desired'] + '</td>'
        }));
    }

    table.append(tableBody);
    $('section#main-content').append(table);
}

function renderExplanation() {
    var table = $('<table></table>');
    var tableBody = $('<tbody></tbody>');
    tableBody.append($('<tr></tr>', {
        'class': 'toprow',
        'html': '<td>'+translations.getTranslation('lbl_criterion')+'</td><td>'+translations.getTranslation('lbl_certification')+' *</td><td>'+translations.getTranslation('lbl_certification')+' **</td><td>'+translations.getTranslation('lbl_certification')+' ***</td><td>'+translations.getTranslation('lbl_certification')+' ****</td>'
    }));

    var i, ii, chapter, paragraph;
    for (i in criterion[translations.language].criterionItems.chapter) {
        chapter = criterion[translations.language].criterionItems.chapter[i];
        for (ii in chapter.paragraph) {
            paragraph = chapter.paragraph[ii];
            tableBody.append($('<tr></tr>', {
                    'html': '<td>' + chapter.Nr + '.' + paragraph.Nr + '</td>' +
                        '<td>' + paragraph.certification['certification *'] + '</td>' +
                        '<td>' + paragraph.certification['certification **'] + '</td>' +
                        '<td>' + paragraph.certification['certification ***'] + '</td>' +
                        '<td>' + paragraph.certification['certification ****'] + '</td>'
                }
            ));
        }
    }
    table.append(tableBody);
    $('section#main-content').append(table);
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
})