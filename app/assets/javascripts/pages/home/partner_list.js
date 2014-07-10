//= require jquery-marquee/jquery.marquee
//= require jquery-lazyload/jquery.lazyload

(function() {
  $(window).load(function() {
    $('.partner-list img').lazyload({
      threshold: 400,
      container: $('.partner-list')
    });

    var $marquee = $('.partner-list').marquee({
      duration: 10000,
      gap: 0
    });
  });
}());
