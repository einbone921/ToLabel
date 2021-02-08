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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load"
,function(){
  $('.header-icon').on('click',function(){
    $('.sidebar').css(
      'display', 'block'
    ).animate({
      left:'0'
      },
      300
      );
    $('.sidebar-bg').css(
      'display', 'block'
      ).animate({
        opacity: '0.5'
      },
      300
      );
    $('.sidebar-icon').on('click', function(){
      $('.sidebar').animate({
        left:'-200px'
      },
        300
      );
      setTimeout(function(){
        $('.sidebar').css('display', 'none');
        $('.sidebar-bg').css('display', 'none');
      },
        300
      );
    });
  });
});
