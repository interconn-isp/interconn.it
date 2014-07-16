var CoverageMap=function(){return{options:{center:new google.maps.LatLng(41.85,12.6),zoom:11,disableDefaultUI:!0,draggable:!1,scrollwheel:!1,navigationControl:!1,mapTypeControl:!1,scaleControl:!1,disableDoubleClickZoom:!0,mapTypeId:google.maps.MapTypeId.ROADMAP},coordinatesUrl:"/data/coverage.json",mapCanvas:"map-canvas",map:null,polygons:[],init:function(){this.map=new google.maps.Map(document.getElementById(this.mapCanvas),this.options),this.drawPolygons()},drawPolygons:function(){var o=this;$.getJSON(this.coordinatesUrl,function(e){var t;for(t in e)o.drawPolygon(o.parseCoordinates(e[t]))})},drawPolygon:function(o){var e=new google.maps.Polygon({paths:o,strokeColor:"#cc7a00",strokeOpacity:.8,strokeWeight:2,fillColor:"#FF9900",fillOpacity:.35});e.setMap(this.map),this.polygons.push(e)},parseCoordinates:function(o){var e,t,a=[];for(e in o)t=o[e],a.push(new google.maps.LatLng(t[0],t[1]));return a},polygonsContain:function(o){var e,t;for(e in this.polygons)if(t=this.polygons[e],google.maps.geometry.poly.containsLocation(o,t))return!0;return!1}}}(),CoverageAutocomplete=function(){return{input:"coverage-address",options:{types:["geocode"]},map:null,autocomplete:null,init:function(o){this.map=o,this.autocomplete=new google.maps.places.Autocomplete(document.getElementById(this.input),this.options),this.autocomplete.bindTo("bounds",this.map.map)},onPlaceChanged:function(o){google.maps.event.addListener(this.autocomplete,"place_changed",o)}}}(),CoverageChecker=function(){return{map:null,autocomplete:null,result:"check-status",init:function(o,e){this.map=o,this.autocomplete=e;var t=this;this.autocomplete.onPlaceChanged(function(){t.checkPlace()})},checkPlace:function(){var o=this.autocomplete.autocomplete.getPlace(),e=$(document.getElementById(this.result));return e.removeClass("check-status-standby").removeClass("check-status-yes").removeClass("check-status-no"),o.geometry?void(this.map.polygonsContain(o.geometry.location)?e.addClass("check-status-yes").html('<i class="fa fa-check"></i> Sei coperto!'):e.addClass("check-status-no").html('<i class="fa fa-times"></i> Non sei coperto')):void e.addClass("check-status-standby").html('<i class="fa fa-spinner"></i> In attesa...')}}}();!function(){function o(){var o=($(window).height()-$("#map-overlay-inner").height())/2+1;100>o&&(o=100),$("#map-overlay").css("padding-top",o+"px"),$("#map-overlay").css("padding-bottom",o+"px")}$(window).load(function(){o()}),$(function(){o()})}(),function(){$(function(){CoverageMap.init(),CoverageAutocomplete.init(CoverageMap),CoverageChecker.init(CoverageMap,CoverageAutocomplete)})}();