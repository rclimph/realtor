$(document).ready(function(e) {
  $('.selectpicker').selectpicker();
  $('[data-behaviour~=datepicker]').datepicker({
    "format": "yyyy-mm-dd",
    "weekStart": 1,
    "autoclose": true
  });
});