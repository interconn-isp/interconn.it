var CoverageMap = (function() {
  return {
    options: {
      center: new google.maps.LatLng(41.87, 12.60),
      zoom: 10,
      disableDefaultUI: true,
      draggable: false,
      scrollwheel: false,
      navigationControl: false,
      mapTypeControl: false,
      scaleControl: false,
      disableDoubleClickZoom: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    },

    coordinatesUrl: '/data/coverage.json',

    mapCanvas: 'map-canvas',

    map: null,

    polygons: [],

    init: function() {
      this.map = new google.maps.Map(
        document.getElementById(this.mapCanvas),
        this.options
      );

      this.drawPolygons();
    },

    drawPolygons: function() {
      var self = this;

      $.getJSON(this.coordinatesUrl, function (data) {
        var key;

        for (key in data) {
          self.drawPolygon(self.parseCoordinates(data[key]));
        }
      });
    },

    drawPolygon: function(coordinates) {
      var polygon = new google.maps.Polygon({
        paths: coordinates,
        strokeColor: '#cc7a00',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#FF9900',
        fillOpacity: 0.35
      });

      polygon.setMap(this.map);

      this.polygons.push(polygon);
    },

    parseCoordinates: function(coordinates) {
      var key, set, newCoordinates = [];

      for (key in coordinates) {
        set = coordinates[key];
        newCoordinates.push(new google.maps.LatLng(set[1], set[0]));
      }

      return newCoordinates;
    },

    polygonsContain: function(latLng) {
      var key, polygon;

      for (key in this.polygons) {
        polygon = this.polygons[key];

        if (google.maps.geometry.poly.containsLocation(latLng, polygon)) {
          return true;
        }
      }

      return false;
    }
  };
})();

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
var CoverageChecker = (function() {
  return {
    map: null,

    autocomplete: null,

    result: 'check-status',

    inquiry_path: '/inquiries/new',

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
        .removeClass('check-status-no')
        .attr('href', '#');

      if (!place.geometry) {
        result
          .addClass('check-status-standby')
          .html('<i class="fa fa-arrow-left"></i> In attesa...');

        return;
      }

      if (this.map.polygonsContain(place.geometry.location)) {
        result
          .addClass('check-status-yes')
          .html('<i class="fa fa-check"></i> Sei coperto!')
          .attr('href', this.inquiry_path);
      } else {
        result
          .addClass('check-status-no')
          .html('<i class="fa fa-times"></i> Non sei coperto');
      }
    }
  };
})();
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






(function() {
  $(function() {
    CoverageMap.init();
    CoverageAutocomplete.init(CoverageMap);
    CoverageChecker.init(CoverageMap, CoverageAutocomplete);
  });
}());
