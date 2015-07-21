var EnterKey = 13;
var countTodos = 0;
$todoList = $('ul.pagination1');
var todos = $todoList.html();
var nextUrl = '';
var pagination;
var maxItemsPage;
var url = '';

$.fn.isBound = function (type, fn) {
    var data = this.data('events')[type];

    if (data === undefined || data.length === 0) {
        return false;
    }

    return (-1 !== $.inArray(fn, data));
};

$(document).ready(function () {

    $('#new-todo').keypress(function (e) {
        if (e.which === EnterKey) {
            url ='https://api.instagram.com/v1/users/search?q='+$('#new-todo').val()+'&access_token=510573486.ab7d4b6.d8b155be5d1a47c78f72616b4d942e8d&count='+maxItemsPage;
            requestCall(url, 1);
        }
    }); // end if
});

function count(operand){
    if(operand == '+'){
        countTodos += 1;
    }
    if(operand == '-'){
        countTodos -= 1;
    }
    $('#total').html(countTodos + ' ' + textLeft);
}

function runBind() {
    $('.destroy').on('click', function (e) {
        $currentListItem = $(this).closest('li');

        $currentListItem.remove();
    });

    $('.toggle').on('click', function (e) {
        var $currentListItemLabel = $(this).closest('li').find('label');
        /*
         * Do this or add css and remove JS dynamic css.
         */
        if ($currentListItemLabel.attr('data') == 'done') {
            count('+');
            $currentListItemLabel.attr('data', '');
            $currentListItemLabel.css('text-decoration', 'none');
            $currentListItemLabel.closest('li').css('background-color', '#9de2a8');
        }
        else {
            count('-');
            $currentListItemLabel.attr('data', 'done');
            $currentListItemLabel.css('text-decoration', 'line-through');
            $currentListItemLabel.closest('li').css('background-color', '#c4c4c4');
        }
    });
}

function userDetail(id){
    url = 'https://api.instagram.com/v1/users/'+id+'/media/recent?access_token=510573486.ab7d4b6.d8b155be5d1a47c78f72616b4d942e8d&count='+maxItemsPage;
    requestCall(url,2);
}

function requestCall(url, type){
    todos = '';
    countTodos = 0;
    $.ajax({
        url: url,
        dataType: 'jsonp',
    })
        .done(function (data) {
            $.each(data.data, function (key, value) {
                buildListItems(value, type);
            });
            $(this).val('');
            $todoList.html(todos);
            runBind();
            $('#main').show();

            $("ul.pagination1").quickPagination({pageSize: pagination});
        });
}

function buildListItems(value, type){
    switch (type){
        case 1:
            todos += "" +
                "<li>" +
                "<div class='view'>" +
                "<input class='toggle' type='checkbox'>" +
                "<div>"+ value.full_name +"</div>" +
                "<hr />" +
                "<label data=''>" + " <img onclick='userDetail("+value.id+")' src='" + value.profile_picture + "' /> </label>" +
                "<hr />" +
                "<a class='destroy'></a>" +
                "</div>" +
                "</li>";
            break;
        case 2:
            todos += "" +
                "<li>" +
                "<div class='view'>" +
                "<input class='toggle' type='checkbox'>" +
                "<div>" + ((value.caption !== null) ? value.caption.text : '') + "</div>" +
                "<hr />" +
                "<label data=''>" + " <img src='" + value.images.thumbnail.url + "' /></label> <br />" +
                "<hr />" +
                "<a href='" +value.link+ "' target='_blank' >See more.. </a>" +
                "<a class='destroy'></a>" +
                "</div>" +
                "</li>";
            break;
    }
    count('+');
}

