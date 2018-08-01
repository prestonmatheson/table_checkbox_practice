function updateIndex() {
  $.ajax({
    url: '/add_polls',
    type: 'POST',
  })
  .done(function() {
    console.log("success")
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });
}