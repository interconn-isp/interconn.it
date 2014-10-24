//= require jquery.scrollTo/jquery.scrollTo

$(function() {
  $('a[href*=#]').click(function() {
    if (
      location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
      && location.hostname == this.hostname
      && $(this.hash).length > 0
    ) {
      var offset = -59;
      offset -= parseInt($(this.hash).css('margin-top')) + parseInt($(this.hash).css('padding-top'));

      offset -= parseInt($(this.hash).data('scroll-offset'));

      $.scrollTo(this.hash, {
        duration: 500,
        offset: offset
      });

      return false;
    }
  });
});
