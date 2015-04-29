jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();

  setTimeout(function() {
    $('.alert-success').animate({ "opacity":0 }, 1000, function(){
        $(this).remove();
      }
    );
  },5000);

  setTimeout(function() {
    $('.panel-success').animate({
      "border-color":"#ddd"
    }, 1000);
    $('.panel-success>.panel-heading').animate({
      "color": "#333",
      "background-color":"#f5f5f5",
      "border-color":"#ddd"
    }, 1000);
  },3000);
});
