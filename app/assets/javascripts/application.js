// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function remove_me(elem) {
    $(elem).click(function () {
        $(elem).remove();
        var elem_string = 'input[value="' + elem.innerHTML + '"]'
        $(elem_string).remove();
    });
}

function add_to_staging_area(elem){
    var hashtag = elem;
    var staging_area = document.getElementById('staging_area');
    staging_area.innerHTML = staging_area.innerHTML + '<p id="search_term" onclick="remove_me(this)">'+hashtag.innerHTML+'</p>';
    var form = document.getElementById('search_form');
    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'query[]';
    input.value = hashtag.innerHTML;
    form.appendChild(input)
}

// Source: http://jsfiddle.net/timur/47a7A/
$(document).ready(function() {
    var text_max = 240;
    $('#character_counter').html(text_max + ' characters remaining');

    $('#message').keyup(function() {
        var text_length = $('#message').val().length;
        var text_remaining = text_max - text_length;

        $('#character_counter').html(text_remaining + ' characters remaining');
    });
});