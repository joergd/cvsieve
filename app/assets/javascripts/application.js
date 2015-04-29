// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.color
//= require_tree .

alertVideoNotRecorded = function() {
  $('.panel-video').addClass('panel-danger');
  setTimeout(function() {
    $('.panel-danger').animate({
      "border-color":"#ddd"
    }, 1000, function() {
      $('.panel-video').removeClass('panel-danger').removeAttr('style');
      $('.panel-video>.panel-heading').removeAttr('style');
    });
    $('.panel-danger>.panel-heading').animate({
      "color": "#333",
      "background-color":"#f5f5f5",
      "border-color":"#ddd"
    }, 1000, function() {
      $('.panel-video').removeClass('panel-danger').removeAttr('style');
      $('.panel-video>.panel-heading').removeAttr('style');
    });
  },3000);

}
