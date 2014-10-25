(function() {
  var drawOverlay = function() {
    var vPadding = (($(window).height() - $('#map-overlay-inner').height()) / 2) + 1;

    if (vPadding < 100) {
      vPadding = 100;
    }

    $('#map-overlay').css('padding-top', vPadding + 'px');
    $('#map-overlay').css('padding-bottom', vPadding + 'px');
  };

  $(drawOverlay);
  $(window).load(drawOverlay);
  $(window).resize(drawOverlay);
}());
