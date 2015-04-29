jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();

  setTimeout(function() {
    $('.alert-success').animate({ "opacity":0 }, 1000, function(){
        $(this).remove();
      }
    );
  },5000);
});
