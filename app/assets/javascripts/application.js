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

function installClickListener(){
    var hashtags = document.getElementsByClassName("hash_link");
    for (var i = 0; i < hashtags.length; i++){
        hashtags[i].onclick = function() {
            var staging_area = document.getElementById('staging_area');
            staging_area.innerHTML = staging_area.innerHTML + this.innerHTML + '<br>';
            var form = document.getElementById('search_form');
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'query[]';
            input.value = this.innerHTML;
            form.appendChild(input)
        }
    }
}