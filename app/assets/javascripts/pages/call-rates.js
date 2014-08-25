$(function() {
  $('#call-rate-search-form').submit(function(e) {
    // Prevent default submit behaviour
    e.preventDefault();

    // Remove all rates from the table
    $('#call-rates-table > tbody > tr.call-rate:visible').remove();

    // Hide the "No Rates" message and the instructions
    $('#call-rates-empty').hide();
    $('#call-rates-instructions').hide();

    // If no valid value is given for the search, display the instructions
    if ($('#call-rate-search').val().trim().length < 3) {
      $('#call-rates-instructions').show();
      return;
    }

    // Search begins: Show the spinner
    $('#call-rates-loading').show();

    $.getJSON('/call-rates.json', {
      q: $('#call-rate-search').val()
    }, function(rates) {
      $.each(rates, function(key, rate) {
        // Clone the rate row template
        var rateRow = $('#call-rate-template').clone();

        // Insert the correct traffic direction and rate into the row
        rateRow.find('.call-rate-traffic-direction').text(rate.traffic_direction);
        rateRow.find('.call-rate-rate').text('€' + rate.rate + '/min');

        // Add the correct time slot class to the row
        switch (rate.time_slot) {
          case 'flat':
            rateRow.addClass('info');
            break;

          case 'peak':
            rateRow.addClass('warning');
            break;

          case 'off_peak':
            rateRow.addClass('success');
            break;
        }

        // Append the row to the table's body and display it
        rateRow.appendTo('#call-rates-table > tbody').show();
      });

      // Search ends: Hide the spinner
      $('#call-rates-loading').hide();

      // If no rates have been found, display the "No Rates" message
      if (rates.length == 0) {
        $('#call-rates-empty').show();
      }
    });
  });
});
