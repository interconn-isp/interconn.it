(function() {
  $(window).load(function() {
    $('.partner-list img').lazyload();

    $('.partner-list').marquee({
      duration: 10000,
      duplicated: true,
      gap: 0
    });
  });
}());
