//= require components/gmaps/autocomplete
//= require pages/inquiries/shared/padding

(function() {
  $(function() {
    CoverageAutocomplete.input = 'inquiry_address';
    CoverageAutocomplete.init();

    $('#new_inquiry').bind('keyup keypress', function(e) {
      var code = e.keyCode || e.which;
      if (code  == 13) {
        e.preventDefault();
        return false;
      }
    });
  });
}());