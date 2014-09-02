(function() {
  function drawInquiryContainer()
  {
    var vPadding = ($(window).height() - ($('#inquiry-content').height() + $('footer').height())) / 2;
    vPadding -= 30;

    if (vPadding < 100) {
      vPadding = 100;
    }

    $('#inquiry-content').css('padding-top', vPadding + 'px');
    $('#inquiry-content').css('padding-bottom', vPadding + 'px');
  }

  $(window).load(function() {
    drawInquiryContainer();
  });
}());
