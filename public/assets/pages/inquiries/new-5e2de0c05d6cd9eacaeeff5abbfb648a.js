var CoverageAutocomplete=function(){return{input:"coverage-address",options:{types:["geocode"],componentRestrictions:{country:"it"}},map:null,autocomplete:null,init:function(t){this.map=t,this.autocomplete=new google.maps.places.Autocomplete(document.getElementById(this.input),this.options),this.map&&this.autocomplete.bindTo("bounds",this.map.map)},onPlaceChanged:function(t){google.maps.event.addListener(this.autocomplete,"place_changed",t)}}}();!function(){function t(){var t=($(window).height()-($("#inquiry-content").height()+$("footer").height()))/2;t-=30,100>t&&(t=100),$("#inquiry-content").css("padding-top",t+"px"),$("#inquiry-content").css("padding-bottom",t+"px")}$(window).load(function(){t()})}(),function(){$(function(){CoverageAutocomplete.input="inquiry_address",CoverageAutocomplete.init(),$("#new_inquiry").bind("keyup keypress",function(t){var e=t.keyCode||t.which;return 13==e?(t.preventDefault(),!1):void 0})})}();