/*$('#file_object').change(function(){
 $(this).parent().ajaxSubmit({
  beforeSubmit: function(a,f,o) {
   o.dataType = 'json';
  },
  complete: function(XMLHttpRequest, textStatus) {
   // XMLHttpRequest.responseText will contain the URL of the uploaded image.
   // Put it in an image element you create, or do with it what you will.
   // For example, if you have an image elemtn with id "my_image", then
   $('#my_image').attr('src', XMLHttpRequest.responseText);
   // Will set that image tag to display the uploaded image.
  },
 });
  alert("KKK");
});


*/


$(() => {
  $file = $('#managed_file_file_object');
  $file.click(function() {
    $('#upload').show(10);
  });

  $response = $('#response');
    $('#uploadForm button[id="upload"]').click(function() {
      if ($file.val().length != 0){
        $('#progress_bar').css('width', '0px');
        $('#uploadForm').ajaxSubmit({
          beforeSubmit: function(a,f,o) {
            o.dataType = 'json';
            $response.hide(0, function() {
              $('progress').show(1).delay(2000);
            });
              //.animate({width: "+0px"}, 3000)
            // $('#progress_bar').show(1)
            //   .animate({width: "+500px"}, 3000)
          },
          complete: function(XMLHttpRequest, textStatus) {
            // $('#progress_bar').hide(1)
            //   .animate({width: "-500px"}, 1);
            $('progress').hide(0, 1, function() {
                $response.show(1000, function() {
                  $('#upload').hide(1000);
                });
              });
            $response.html(XMLHttpRequest.responseText);
          },
        });
      } else {
        alert(":::Please select a file");
      }
    });
  

  // function progressHandlingFunction(e){
  //   if(e.lengthComputable){
  //     $('progress').attr({value:e.loaded,max:e.total});
  //   }
  // }  
});


