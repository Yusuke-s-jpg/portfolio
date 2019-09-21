// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs

$(function(){
  $('#signup-show').click(function(){
    $('#signup-modal').fadeIn();
  });

  $('#login-show').click(function(){
    $('#login-modal').fadeIn();
  });

  $('#user-show').click(function(){
    $('#user-modal').fadeIn();
  });

  $('#post-show').click(function(){
    $('#post-modal').fadeIn();
    $('#user-modal').fadeOut();
  });

  $('#edit-show').click(function(){
    $('#edit-modal').fadeIn();
    $('#user-modal').fadeOut();
  });

  $('.close-modal').click(function() {
    $('#login-modal').fadeOut();
    $('#signup-modal').fadeOut();
    $('#user-modal').fadeOut();
    $('#edit-modal').fadeOut();
    $('#post-modal').fadeOut();
  });
});

$(function(){
  setTimeout("$('.flash').fadeOut('slow')", 2000)
});

$(function(){
  $('#about-tab-title').click(function(){
    $('.index-tab').fadeOut();
    $('.about-tab').fadeIn();
  });
});

$(function(){
  $('#index-tab-title').click(function(){
    $('.about-tab').fadeOut();
    $('.index-tab').fadeIn();
  });
});

$(function(){
  $('.menu-icon').click(function(){
    if($(this).hasClass('open')){
      $(this).removeClass('open');
      $('.header-right').fadeOut();
      $('.header-left').fadeIn();
    } else {
      $(this).addClass('open');
      $('.header-left').fadeOut();
      $('.header-right').fadeIn();
    }
  });
});
