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
//= require jquery
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require toastr
//= require_tree .

const scrollBottom = () => {
  messagesSelector = $('#messages');

  if (messagesSelector.length > 0) {
    messagesSelector.scrollTop(messagesSelector[0].scrollHeight);
  }
}

const submitMessage = () => {
  messageBodySelector = $('#message_body');

  messageBodySelector.on('keydown', (e) => {
    if (e.keyCode == 13) {
      $('button').click();
      e.target.value = "";
    }
  });
}

$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();

  // move chat scroll to the bottom
  scrollBottom();

  // listen input from chat to press enter
  submitMessage();
});
