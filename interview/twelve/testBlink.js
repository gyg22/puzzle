(function( $ ){

  $.fn.testBlink = function(num) {
    for(var i = 0; i < num; i++){
      this.fadeOut().fadeIn();
    }
    return this;
  };

})( jQuery );
