$(function(){$("#call-rates-modal").on("shown.bs.modal",function(){$("#call-rate-search").focus()}),$("#call-rate-search-form").submit(function(a){a.preventDefault(),$("#call-rates-table > tbody > tr.call-rate:visible").remove(),$("#call-rates-empty").hide(),$("#call-rates-instructions").hide(),$("#call-rate-search").val().trim().length<3?$("#call-rates-instructions").show():($("#call-rates-loading").show(),$.getJSON("/call-rates.json",{q:$("#call-rate-search").val()},function(a){$.each(a,function(a,e){var t=$("#call-rate-template").clone();switch(t.find(".call-rate-traffic-direction").text(e.traffic_direction),t.find(".call-rate-rate").text("\u20ac"+e.rate+"/min"),e.time_slot){case"flat":t.addClass("info");break;case"peak":t.addClass("warning");break;case"off_peak":t.addClass("success")}t.appendTo("#call-rates-table > tbody").show()}),$("#call-rates-loading").hide(),0==a.length&&$("#call-rates-empty").show()}))})});