$(function(){var e=function(){var e=$('input[name="contract-view"]:checked').val();"complete"==e?($(".terms-long").show(),$(".terms-short").addClass("hidden-xs")):($(".terms-short").removeClass("hidden-xs"),$(".terms-long").hide())};$('input[name="contract-view"]').change(e)}),$(window).resize(function(){$(window).width()>=768&&($(".terms-short").removeClass("hidden-xs"),$(".terms-long").show())});