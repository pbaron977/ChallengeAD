$(document).ready(function(){

    $('#btnAll').click(function(){
        todos = '';
        $('ul li').each(function(i) {
            $("[rel='1']").click();
        });
    });

    $('#btnActive').click(function(){

        $('ul li').each(function(i) {
            if($(this).closest('li').find('label').attr('data') === 'done'){
                $(this).css('display', 'none');
            }else{
                $(this).css('display', '');
            }
        });
    });

    $('#btnCompleted').click(function(){
        $('ul li').each(function(i) {
            if($(this).closest('li').find('label').attr('data') === ''){
                $(this).css('display', 'none');
            }else{
                $(this).css('display', '');
            }
        });
    });

    $('#btnClearCompleted').click(function(){
        $('ul li').each(function(i) {
            if($(this).closest('li').find('label').attr('data') === 'done'){
                $(this).remove();
            }
        });
    });

});

var manageTabs = function(tabPanel, tab) {
    var tabs=['content','pagination'];
    var index = tab ? tabs.indexOf(tab) : -1;
    if (index == -1) return;

    var dlg = tabPanel.findParentByType("dialog");
    var checkboxx = dlg.getField("./enablePagination");

    for (var i = 1; i != tabs.length; i++) {
        if (index == i && (checkboxx.value === 'true')) {
            tabPanel.unhideTabStripItem(i);
        } else {
            tabPanel.hideTabStripItem(i);
        }
    }
    tabPanel.doLayout();
};

hideTab = function(tab) {
    var tabPanel = tab.findParentByType('tabpanel');
    var index = tabPanel.items.indexOf(tab);
    tabPanel.hideTabStripItem(index);
};

showTab = function(field) {
    manageTabs(field.findParentByType('tabpanel'), field.getValue());
};

showTabPanel = function (comp, val, isChecked) {
    var tabPanel = comp.findParentByType("tabpanel");
    isChecked ? tabPanel.unhideTabStripItem(1) : tabPanel.hideTabStripItem(1);
}

hideField = function(comp, isChecked){
    var dlg = comp.findParentByType("dialog");
    var textfield = dlg.getField("./maxNumberTasks");
    isChecked ? textfield.enable() : textfield.disable();
}


