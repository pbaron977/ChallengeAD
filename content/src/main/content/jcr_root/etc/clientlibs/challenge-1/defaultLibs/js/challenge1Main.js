
$(document).ready(function() {
    $('#ext-comp-1050').ColorPicker({
        onSubmit: function (hsb, hex, rgb, el) {
            $(el).val(hex);
            $(el).ColorPickerHide();
        },
        onBeforeShow: function () {
            $(this).ColorPickerSetColor(this.value);
        }
    }).bind('keyup', function () {
        $(this).ColorPickerSetColor(this.value);
    });
});