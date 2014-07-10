(function() {
  $(window).load(function() {
    $('.partner-list img').lazyload({
      threshold: 400,
      container: $('.partner-list')
    });

    $('.partner-list').marquee({
      duration: 10000,
      duplicated: true,
      gap: 0
    });
  });
}());
