var CoverageChecker = (function() {
  return {
    map: null,

    autocomplete: null,

    result: 'check-status',

    init: function(map, autocomplete) {
      this.map = map;
      this.autocomplete = autocomplete;

      var self = this;

      this.autocomplete.onPlaceChanged(function() {
        self.checkPlace();
      });
    },

    checkPlace: function() {
      var place = this.autocomplete.autocomplete.getPlace();

      var result = $(document.getElementById(this.result));

      result
        .removeClass('check-status-standby')
        .removeClass('check-status-yes')
        .removeClass('check-status-no');

      if (!place.geometry) {
        result
          .addClass('check-status-standby')
          .html('<i class="fa fa-spinner"></i> In attesa...');

        return;
      }

      if (this.map.polygonsContain(place.geometry.location)) {
        result
          .addClass('check-status-yes')
          .html('<i class="fa fa-check"></i> Sei coperto!');
      } else {
        result
          .addClass('check-status-no')
          .html('<i class="fa fa-times"></i> Non sei coperto');
      }
    }
  };
})();
