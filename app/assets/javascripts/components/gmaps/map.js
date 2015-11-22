var CoverageMap = (function() {
  return {
    options: {
      center: new google.maps.LatLng(41.87, 12.60),
      zoom: 11,
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
        newCoordinates.push(new google.maps.LatLng(set[0], set[1]));
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

