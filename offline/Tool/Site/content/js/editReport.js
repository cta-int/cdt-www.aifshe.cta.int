$(document).ready(function () {
    /**
     * if key "report" exists in the "localStorage" object
     */
    if (localStorage.hasOwnProperty("reportModel")) {
        for (property in reportModel.data) {
            // for each field in the "report" , fill the input fields from the form with existing data.
            if (reportModel.data.hasOwnProperty(property)) {
                $('input[name="' + property + '"], textarea[name="' + property + '"]').val(reportModel.data[property]);
            }
        }
    }

    /**
     * triggered when the form has been submitted
     */
    $('form').submit(function (event) {
        event.preventDefault();

        var formData = $(this).serializeArray();
        for (var field in formData) {
            if (formData.hasOwnProperty(field)) {
                reportModel.set(formData[field]['name'], formData[field]['value']);
            }
        }
        if (reportModel.save()) {
            dialog({
                type: 'notice',
                title: translations.getTranslation('offline.report.notice.updated.success.title'),
                text: translations.getTranslation('offline.report.notice.updated.success.text')
            });
        }
    });
});

