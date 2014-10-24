//= require within-viewport/withinViewport
//= require within-viewport/jquery.withinViewport

$(function() {
  var updateContractView = function() {
    var contractView = $('input[name="contract-view"]:checked').val();

    if (contractView == 'complete') {
      $('.terms-long').show();
      $('.terms-short').addClass('hidden-xs');
    } else {
      $('.terms-short').removeClass('hidden-xs');
      $('.terms-long').hide();
    }
  };

  $('input[name="contract-view"]').change(updateContractView);

  $(window).resize(function() {
    if ($(window).width() >= 768) {
      $('.terms-short').removeClass('hidden-xs');
      $('.terms-long').show();
    }
  });

  $('#contract-nav > .nav > li > a > span').tooltip({
    placement: 'left',
    container: 'body',
    delay: 250
  });

  $(window).scroll(function() {
    updateCurrentArticle();
  });

  function getCurrentArticle()
  {
    var currentArticle;

    $('.article h4:visible').each(function() {
      if ($(this).withinViewport({
        top: $('.navbar').height() + $('.toolbar-subnav').height()
      }).length > 0) {
        currentArticle = $(this).parents('.article').first();;
        return false;
      }
    });

    if (!currentArticle) {
      var lastArticle = $('.article:visible').last();

      if ($(window).scrollTop() > lastArticle.offset().top) {
        currentArticle = lastArticle;
      }
    }

    currentArticle = parseInt(currentArticle.attr('id').split('-')[1])

    return currentArticle;
  }

  function updateCurrentArticle()
  {
    var currentArticle = getCurrentArticle();

    var previousArticle = $('#art-' + (currentArticle - 1));
    var nextArticle = $('#art-' + (currentArticle + 1));

    $('#current-article').text(currentArticle);

    if (previousArticle.length == 0) {
      $('#previous-article').attr('disabled', true);
    } else {
      $('#previous-article').attr('disabled', false);
      $('#previous-article').attr('href', '#' + previousArticle.attr('id'))
    }

    if (nextArticle.length == 0) {
      $('#next-article').attr('disabled', true);
    } else {
      $('#next-article').attr('disabled', false);
      $('#next-article').attr('href', '#' + nextArticle.attr('id'))
    }
  }

  updateCurrentArticle();
});
