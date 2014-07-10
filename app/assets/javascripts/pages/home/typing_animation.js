(function() {
  $(function() {
    if ($("#home-title-animated").is(":visible")) {
      $("#home-slogan").typed({
        strings: ["la tua famiglia.", "la tua azienda.", "le tue idee.", "te."],
        typeSpeed: 30,
        backSpeed: 30,
        startDelay: 1000,
        backDelay: 1000,
      });
    }
  });
}());
