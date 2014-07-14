//= require jquery-scrollTo/jquery.scrollTo

$(function() {
  $('a[href*=#]').click(function() {
    if (
      location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
      && location.hostname == this.hostname
      && $(this.hash).length > 0
    ) {
      $.scrollTo(this.hash, {
        duration: 500,
        offset: -30
      });
      return false;
    }
  });
});
