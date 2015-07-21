
var Fs2TextField = {};

var Datasource = {};

var Toogle = {};

//Show or Hide related components according to service data source combo box
Toogle.manageFields = function manageFields(field) {

    //Get the panel of the tab our drop down menu on
    var panel = field.findParentByType('panel');

    // Our text fields are stored in widgets of type dialogfieldset
    // and we get their reference 
    var fieldSets = panel.findByType('dialogfieldset');
    var fLength = fieldSets.length;

    // Get value of selected option in out select box
    var fieldValue = field.getValue();
    for (var i = 0; i < fLength ; i++) {
        var fieldSet = fieldSets[i];

        // Values of options in our drop down menu correspond to
        // respective properties in dialogfieldsets we will set next,
        // so if value of selected options matches itemId we show this widget,
        // otherwise - hide.
        if (fieldValue === fieldSet.getItemId()){
            fieldSet.show();        
        } else {
            fieldSet.hide();
        }
    }    
};

// If datasource changed, localStorage has to be cleaned.
Datasource.validateChanges = function validateChanges(dialog){
    if(cleanLocalStorage == true){
		localStorage.removeItem('todos-jquery');
    }
    return true;
};


// In case of value changed, modify global flag for localSforage clean-up
Fs2TextField.validateChange = function validateChange(field, newValue, oldValue){
    if(newValue != oldValue) {
		cleanLocalStorage = true;
    } else {
		cleanLocalStorage = false;
    }
};