// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


//= require jquery/dist/jquery.js
//= require turbolinks
//= require_tree


import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


$(document).ready(function() {
	// jQuery code
  $(".addpromote").click(function(){
      $(this).hide();
    });
  $(".addfollow").click(function(){
        $(this).hide();
    });

	///////////////// fixed menu on scroll for desctop
    if ($(window).width() > 780) {

        var navbar_height =  $('.menu').outerHeight();

        $(window).scroll(function(){
            if ($(this).scrollTop() > 0) {
				 $('.menu').css('height', navbar_height + 'px');
                 $('#menu').addClass("fixed-top");

            }else{
                $('#menu').removeClass("fixed-top");
                $('.menu').css('height', 'auto');
            }
        });
    } // end if
    setTimeout(function() {
    $('.flash').fadeOut('fast');
}, 3000);

});
