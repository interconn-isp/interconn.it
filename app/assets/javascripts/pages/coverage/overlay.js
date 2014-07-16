(function() {
  function drawOverlay()
  {
    var vPadding = (($(window).height() - $('#map-overlay-inner').height()) / 2) + 1;

    if (vPadding < 100) {
      vPadding = 100;
    }

    $('#map-overlay').css('padding-top', vPadding + 'px');
    $('#map-overlay').css('padding-bottom', vPadding + 'px');
  }

  $(window).load(function() {
    drawOverlay();
  });

  $(function() {
    drawOverlay();
  });
}());