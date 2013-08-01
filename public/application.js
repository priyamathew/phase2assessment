$(document).ready(function() {
  $('#new_event_button').on("click", function(event) {
    event.preventDefault();
    url = $(this).closest('form').attr('action');
    data = $(this).closest('form').serialize();
    $.post(url, data, function(response) {
      $("#created_events").append(response);
    });
  })
});



