(function() {
  function drawJumbotron()
  {
    var vPadding = ($(window).height() - $('#home-jumbotron-content').height()) / 2;
    vPadding -= 30;

    if (vPadding < 50) {
      vPadding = 50;

      // The jumbotron doesn't fit on screen (potrait mode?)
      // There's no point in displaying the arrow, as the user
      // will already have to scroll to reveal the rest of the
      // jumbotron
      $('.jumbotron-arrow-wrapper').hide();
    }

    $('#home-jumbotron-container').css('padding-top', vPadding + 'px');
    $('#home-jumbotron-container').css('padding-bottom', vPadding + 'px');
  }

  $(window).load(function() {
    drawJumbotron();
  });

  $(function() {
    drawJumbotron();
  });
}());
