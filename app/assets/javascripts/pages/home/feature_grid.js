(function() {
  function drawFeatures()
  {
    var vMargin = (($(window).height() - $('#features-inner').height()) / 2) + 1;

    if (vMargin < 100) {
      vMargin = 100;
    }

    $('#features').css('margin-top', vMargin + 'px');
    $('#features').css('margin-bottom', vMargin + 'px');
  }

  $(window).load(function() {
    drawFeatures();
  });

  $(function() {
    drawFeatures();
  });
}());
