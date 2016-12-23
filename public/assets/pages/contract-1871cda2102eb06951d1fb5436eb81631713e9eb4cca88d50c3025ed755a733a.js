$(function() {
  var updateContractView = function() {
    var contractView = $('input[name="contract-view"]:checked').val();

    if (contractView == 'complete') {
      $('.terms-long').show();
      $('.terms-short').addClass('hidden-xs');
    } else {
      $('.terms-short').removeClass('hidden-xs');
      $('.terms-long').hide();
    }
  };

  $('input[name="contract-view"]').change(updateContractView);
});

$(window).resize(function() {
  if ($(window).width() >= 768) {
    $('.terms-short').removeClass('hidden-xs');
    $('.terms-long').show();
  }
});
