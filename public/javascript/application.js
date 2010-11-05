$(function () {
    console.log("DOM Ready");
    $("#submit_entry").click(function(e){
      e.preventDefault();
      var entry = $("#add_entry").val();
      if(entry.length) {
        $.ajax({
          type: 'post',
          url: '/add_entry',
          datatype: 'json',
          data: {entry: entry},
          success: function (result) {
            console.log("Successfully added entry", result);
            $("<p>",{
              text: result.entry,
              "class": 'entry'
            }).appendTo("#entries");
          }  
        });
      }
    });
});
