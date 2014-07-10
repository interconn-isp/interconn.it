(function() {
  $(function() {
    if ($("#home-title-animated").is(":visible")) {
      $("#home-slogan").typed({
        strings: ["la tua famiglia.", "^1000 la tua azienda.", "^1000 le tue idee.", "^1000 te."],
        typeSpeed: 50,
        backSpeed: 50,
        startDelay: 1000,
        backDelay: 1000,
      });
    }
  });
}());
