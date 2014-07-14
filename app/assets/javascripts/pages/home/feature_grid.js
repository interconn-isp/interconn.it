(function() {
  function drawFeatures()
  {
    var vPadding = (($(window).height() - $('#features-inner').height()) / 2) + 1;

    if (vPadding < 100) {
      vPadding = 100;
    }

    $('#features').css('padding-top', vPadding + 'px');
    $('#features').css('padding-bottom', vPadding + 'px');
  }

  $(window).load(function() {
    drawFeatures();
  });

  $(function() {
    drawFeatures();
  });
}());
