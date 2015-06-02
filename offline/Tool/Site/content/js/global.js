if (navigator.userAgent.indexOf('Chrome') == -1 || !parseFloat(navigator.userAgent.substring(navigator.userAgent.indexOf('Chrome') + 7).split(' ')[0]) >= 25) {//Chrome
    //Allow
    alert('this application is built to run on chrome.')
    window.location = 'https://www.google.com/intl/nl/chrome/browser/';
}

// initiate data, so we can use it whenever we need to
var reportModel = new reportModel();
var online = setInterval(runFunction, 500);

function runFunction() {
    $('div#icons a.online-offline span.text p').html(navigator.onLine ? 'Online' : 'Offline');
    $('div#icons a.online-offline img').attr('src', navigator.onLine ? '../../css/img/icon-online.png' : '../../css/img/icon-offline.png');
    if (navigator.onLine && !settings.version.checked) {
        $.ajax({
            type: 'GET',
            url: settings.host + 'version',
            async: true,
            jsonpCallback: 'callback',
            contentType: "application/json",
            dataType: 'jsonp',
            success: function (data) {
                if (data.version > settings.version.id) {
                    dialog({
                        'type': 'notice',
                        //@todo: add translation
                        'title': translations.getTranslation('offline.version.notice.new.title'),
                        'text': translations.getTranslation('offline.version.notice.new.text')+'<br/><br/>'+translations.getTranslation('offline.version.yourVersion')+' '+ settings.version.id + '<br/>'+translations.getTranslation('offline.version.newVersion')+' ' + data.version,
                        buttons: [
                            {
                                text: translations.getTranslation("notice.buttons.yesDownload"),
                                click: function () {
                                    window.location = settings.host + 'download';
                                }
                            },
                            {
                                text: translations.getTranslation("notice.buttons.no"),
                                click: function () {
                                    $(this).dialog("close")
                                }
                            }
                        ]
                    });
                }
            }
        });
        settings.version.checked = true;
    }
}

function median(values) {
    if (values.length) {
        values.sort(function (a, b) {
            return a - b;
        });

        var half = Math.floor(values.length / 2);

        if (values.length % 2)
            return values[half];
        else
            return (values[half - 1] + values[half]) / 2.0;
    } else {
        return 0;
    }
}
function dialog(options) {
    var el;
    el = $('<div id="dialog"></div>');

    switch (options.type) {
        case 'error':
            el.html(options.text);
            //@todo: add translation
            el.attr('title', options.hasOwnProperty('title') ? options.title : 'Error');
        case 'notice':
            el.html(options.text);
            //@todo: add translation
            el.attr('title', options.hasOwnProperty('title') ? options.title : 'Notice');
    }
    el.dialog(options);
    el.dialog("open");
}

function deleteReport(event) {
    event.preventDefault();
    var el = $('#dialog');
    //@todo: add translation
    el.html(translations.getTranslation('offline.report.notice.delete.confirmation.text'));

    el.dialog({
        title: translations.getTranslation('offline.report.notice.delete.confirmation.title'),
        buttons: [
            {
                text: translations.getTranslation('offline.report.notice.delete.confirmation.buttons.confirm'),
                click: function () {
                    localStorage.clear();
                    location.reload();
                }
            },
            {
                text: translations.getTranslation('offline.report.notice.delete.confirmation.buttons.cancel'),
                click: function () {
                    $(this).dialog("close")
                }

            }
        ]
    });
    el.dialog("open");
}

/**
 * render side-menu
 */
function renderSideMenu() {
    var menuItem, a, p, img, span, i, attr, options;
    for (i in sideMenu.a) {
        menuItem = sideMenu.a[i];
        var title = translations.getTranslation(menuItem.title);
        a = $('<a></a>', {
            href: menuItem.href,
            title: title
        });
        if (menuItem.hasOwnProperty('class')) {
            a.addClass(menuItem.class);
        }
        span = $('<span></span>', {
            class: 'text'
        });
        p = $('<p></p>', {
            'html': title
        });
        img = $('<img/>', {
            src: menuItem.icon
        });
        span.append(p);
        a.append(img);
        a.append(span);
        $('#side-menu').append(a);
    }
}

var translations = {
    language: "en",
    /**
     * initializes the language
     */
    init: function () {
        var me = this;
        if (localStorage.hasOwnProperty('language')) {
            me.language = localStorage.language;
        } else {
            localStorage.language = me.language;
        }
        me.loadLanguages();
        // loops over all texts to translate them
        $(".translate").each(function () {
            me = this;
            if ($(me).prop('tagName') == 'INPUT') {
                var text = $(me).val();
            } else {
                var text = $(me).text();
            }
            var translation = translations.getTranslation(text);

            if ($(me).hasClass('required')) {
                translation += ' *';
            }

            if ($(me).prop('tagName') == 'INPUT') {
                $(me).val(translation);
            } else {
                $(me).html(translation);
            }
        });
    },
    /**
     * returns translation of specified text for the current language set
     * @param text
     */
    getTranslation: function (str) {
        var language = this.language;
        var keys = str.split(".");
        if (languages.hasOwnProperty(language)) {
            if (languages[language].hasOwnProperty('translations')) {
                var translation = languages[language]['translations'];
                for (var key in keys) {
                    if (keys.hasOwnProperty(key)) {
                        key = keys[key];
                        if (translation.hasOwnProperty(key)) {
                            translation = translation[key];
                        } else {
                            translation = false;
                        }
                    }
                }
                if(translation != false){
                    return translation;
                }
            }
        }
        // if there is no translation, return the text original text
        return str;
    },
    /**
     *
     */
    loadLanguages: function () {
        for (lang in languages) {
            var language = languages[lang];
            var langSpan = $('<span></span>', {
                html: '<a lang="' + lang + '" href="#">' + language.settings.name + '</a>'
            });
            $('#language').append(langSpan);
        }
    },
    changeLanguage: function (language) {
        localStorage.language = language;
        location.reload();
    }
}
// init languages early
translations.init();

$(document).ready(function () {

    $('body').append('<div id="dialog" title="Confirmation"></div>');

    $('a.online-offline').attr('href', 'online.html');

    $('a').click(function (event) {
        if ($(this).attr('title') == translations.getTranslation('security.base.delete')) {
            deleteReport(event);
        }
        if ($(this).hasClass('online-offline') && !navigator.onLine) {
            event.preventDefault();
            dialog({
                'type': 'notice',
                'text': translations.getTranslation('offline.notice.noInternetConnection')
            })
        }
        if ($(this).hasClass('onlyOnline')) {
            event.preventDefault();
            if (navigator.onLine) {
                dialog({
                    'type': 'notice',
                    'text': translations.getTranslation('offline.notice.onlyOnline.internetConnection'),
                    buttons: [
                        {
                            //@todo: add translation
                            text: translations.getTranslation("notice.buttons.yes"),
                            click: function () {
                                window.location = 'online.html';
                            }
                        },
                        {
                            //@todo: add translation
                            text: translations.getTranslation("notice.buttons.no"),
                            click: function () {
                                $(this).dialog("close")
                            }
                        }
                    ]
                });
            } else {
                dialog({
                    'type': 'notice',
                    'text': translations.getTranslation('offline.notice.onlyOnline.noInternetConnection'),
                    buttons: [
                        {
                            text: translations.getTranslation("notice.buttons.ok"),
                            click: function () {
                                $(this).dialog("close")
                            }
                        }
                    ]
                });
            }
        }
    });

    $("#dialog").dialog({
        autoOpen: false,
        modal: true
    });

    $(".datepicker").datepicker({
        dateFormat: 'yy-mm-dd'
    });
    $(".datepicker").prop('readonly', true);
    $("#block-content, span.priority").jqTransform();
    translations.init();

    $('#language a').click(function () {
        translations.changeLanguage($(this).prop('lang'));
    });
});