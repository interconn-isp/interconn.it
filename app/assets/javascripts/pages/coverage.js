//= require pages/coverage/map
//= require pages/coverage/autocomplete
//= require pages/coverage/checker
//= require pages/coverage/overlay

(function() {
  $(function() {
    CoverageMap.init();
    CoverageAutocomplete.init(CoverageMap);
    CoverageChecker.init(CoverageMap, CoverageAutocomplete);
  });
}());
