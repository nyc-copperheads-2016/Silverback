$(document).ready(function() {
  $('.question').hide();
  $('.question').first().show();

  $('.question-form').on('submit', function(event) {
    event.preventDefault();

    $.ajax({
      method: event.target.method,
      url: event.target.action,
      data: $(event.target).serialize()
    }).done(function (response) {
      $('.question').first().addClass('completed').removeClass('question').hide()
      $('.question').first().show();
    }).fail(function (error) {
      console.log("You got an error: " + error)
    })
  })
});
