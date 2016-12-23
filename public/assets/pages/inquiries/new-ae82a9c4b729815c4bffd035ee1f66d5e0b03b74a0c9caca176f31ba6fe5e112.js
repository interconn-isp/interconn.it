var CoverageAutocomplete = (function() {
  return {
    input: 'coverage-address',

    options: {
      types: ['geocode'],
      componentRestrictions: { country: 'it' }
    },

    map: null,

    autocomplete: null,

    init: function(coverageMap) {
      this.map = coverageMap;

      this.autocomplete = new google.maps.places.Autocomplete(
        document.getElementById(this.input),
        this.options
      );

      if (this.map) {
        this.autocomplete.bindTo('bounds', this.map.map);
      }
    },

    onPlaceChanged: function(callback) {
      google.maps.event.addListener(this.autocomplete, 'place_changed', callback);
    }
  };
})();

(function() {
  $(function() {
    CoverageAutocomplete.input = 'inquiry_address';
    CoverageAutocomplete.init();

    $('#new_inquiry #inquiry_address').bind('keyup keypress', function(e) {
      var code = e.keyCode || e.which;
      if (code  == 13) {
        e.preventDefault();
        return false;
      }
    });
  });
}());
