// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require filterrific/filterrific-jquery
//= require turbolinks
//= require bootstrap
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .

var navbar = $('#bs-example-navbar-collapse-1');

$('button.navbar-toggle').click(function() {
    navbar.toggleClass('in');
});

$('ul.nav li').click(function() {
    navbar.removeClass('in');
});

$(document).ready(function(){
    $('.datepicker').datepicker();
});

$('#dob-field input').datepicker({
});