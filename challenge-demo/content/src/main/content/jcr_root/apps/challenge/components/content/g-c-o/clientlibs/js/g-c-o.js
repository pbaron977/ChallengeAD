var Toogle = {};

Toogle.manageFields = function manageFields(field) {

    //Get the panel of the tab our drop down menu on
    var panel = field.findParentByType('panel');

    var fieldValue = field.getValue();

    alert(fieldValue);
}
