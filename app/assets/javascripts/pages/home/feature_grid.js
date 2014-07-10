(function() {
  function drawFeatures()
  {
    var vMargin = ($(window).height() - $('#features-inner').height()) / 2;

    if (vMargin < 100) {
      vMargin = 100;
    }

    $('#features').css('margin-top', vMargin + 'px');
    $('#features').css('margin-bottom', vMargin + 'px');
  }

  $(function() {
    drawFeatures();
  });

  $(window).resize(function() {
    drawFeatures();
  });
}());
