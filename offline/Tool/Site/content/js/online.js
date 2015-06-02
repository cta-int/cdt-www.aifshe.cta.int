$(document).ready(function () {
    $('form').attr('action',settings.host + 'report/import/offline');
    $('textarea').each(function () {
        $(this).val(reportModel.toJson());
    });
    $('form').submit();
});