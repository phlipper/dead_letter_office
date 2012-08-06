jQuery(function($) {
  $("#dead_letters").dataTable({
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "oLanguage": {
      "sLengthMenu": "_MENU_ records per page"
    },
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 4 ] }  // don't sort 'Actions'
    ]
  });

  $(document).on("click", "a[data-message-id]", function() {
    var messageId = $(this).data("message-id");
    $("#details_dead_letter_" + messageId).modal();
  });
});
