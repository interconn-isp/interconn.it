$(window).load(function() {
  $('.navbar-fixed-top')
    .removeClass('navbar-fixed-top')
    .addClass('navbar-static-top')
  ;

  $('#navbar-affix')
    .affix({
      offset: {
        top: $('#home-jumbotron').outerHeight(true)
      }
    })
  ;
});
