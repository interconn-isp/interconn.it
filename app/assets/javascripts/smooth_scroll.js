$(function() {
  $('a').click(function() {
    var elem = $($.attr(this, 'href'));
    var position = elem.position().top;

    $('html, body').animate({
      scrollTop: position + 1
    }, 500);
    return false;
  });
});
