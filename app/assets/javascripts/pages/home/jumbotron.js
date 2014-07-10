(function() {
  function drawJumbotron()
  {
    var vPadding = ($(window).height() - $('#jumbotron-inner').height()) / 2;

    if (vPadding < 50) {
      vPadding = 50;

      // The jumbotron doesn't fit on screen (potrait mode?)
      // There's no point in displaying the arrow, as the user
      // will already have to scroll to reveal the rest of the
      // jumbotron
      $('.arrow-wrapper').hide();
    }

    $('#jumbotron-presentation-container').css('padding-top', vPadding + 'px');
    $('#jumbotron-presentation-container').css('padding-bottom', vPadding + 'px');
  }

  $(function() {
    drawJumbotron();
  })

  var oldWidth = $(window).width();

  $(window).resize(function() {
    if ($(window).width() == oldWidth) {
      return;
    }

    oldWidth = $(window).width();

    drawJumbotron();
  });
}());
