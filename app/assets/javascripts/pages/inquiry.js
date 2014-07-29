(function() {
  var addChangeEventFor = function(fieldOne, fieldTwo) {
    $('#inquiry_' + fieldOne).keyup(function() {
      switchMandatoryAbbr(fieldOne, fieldTwo);
    });
  }

  var switchMandatoryAbbr = function(fieldOne, fieldTwo) {
    var abbr = $('#inquiry_' + fieldTwo).parents('.form-group').find('label abbr');

    if ($('#inquiry_' + fieldOne).val() != '') {
      abbr.hide();
    } else {
      abbr.show();
    }
  }

  $(function() {
    switchMandatoryAbbr('email', 'telephone');
    switchMandatoryAbbr('telephone', 'email');

    addChangeEventFor('telephone', 'email');
    addChangeEventFor('email', 'telephone');
  });
}());
