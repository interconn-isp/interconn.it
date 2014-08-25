//= require components/gmaps/map
//= require components/gmaps/autocomplete
//= require components/gmaps/checker

//= require pages/coverage/overlay

(function() {
  $(function() {
    CoverageMap.init();
    CoverageAutocomplete.init(CoverageMap);
    CoverageChecker.init(CoverageMap, CoverageAutocomplete);
  });
}());
