$(function () {
    console.log("DOM Ready");
    $("#submit_entry").click(function(e){
      e.preventDefault();
      if($("#add_entry").val().length > 0) {
        console.log("You will submit ", $("#add_entry").val());
      }

    });
});
