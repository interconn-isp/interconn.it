var CoverageAutocomplete = (function() {
  return {
    input: 'coverage-address',

    options: {
      types: ['geocode']
    },

    map: null,

    autocomplete: null,

    init: function(coverageMap) {
      this.map = coverageMap;

      this.autocomplete = new google.maps.places.Autocomplete(
        document.getElementById(this.input),
        this.options
      );

      this.autocomplete.bindTo('bounds', this.map.map);
    },

    onPlaceChanged: function(callback) {
      google.maps.event.addListener(this.autocomplete, 'place_changed', callback);
    }
  };
})();
