(function() {
  function resizeFeatures()
  {
    console.log($(window).height());
    console.log($('#features-inner').height());

    var vMargin = ($(window).height() - $('#features-inner').height()) / 2;

    if (vMargin < 100) {
      vMargin = 100;
    }

    $('#features').css('margin-top', vMargin + 'px');
    $('#features').css('margin-bottom', vMargin + 'px');
  }

  $(window).load(function() {
    resizeFeatures()
  });

  $(window).resize(function() {
    resizeFeatures();
  });
}());
