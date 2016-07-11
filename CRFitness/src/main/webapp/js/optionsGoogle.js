// create closure
(function($) {
  //
  // plugin definition
  //
  $.fn.optionsGoogle = function(options) {
    debug(this);
    // build main options before element iteration
    var opts = $.extend({}, $.fn.optionsGoogle.defaults, options);
    // iterate and reformat each matched element
    return this.each(function() {
      $this = $(this);
      $(this).addClass('optionable');
      // build element specific options
      var o = $.meta ? $.extend({}, opts, $this.data()) : opts;
      var $shadow = build(o);
      
      $this.mouseenter(function() {
          $shadow.show();
      })
      .mouseleave(function() {
          $shadow.hide();
      });

      $this.append($shadow);
    });
  };
  //
  // private function for debugging
  //
  function debug($obj) {
    if (window.console && window.console.log)
      window.console.log('hilight selection count: ' + $obj.size());
  };

  function build(o) {
    var $shadow = $('<div></div>');
    $shadow.addClass('shadow');
    var $content = $('<div class="clearfix"></div>');
    if (o.bottom == true) {
      $content.attr('style', 'bottom:'+o.margin+'%');
    } else {
      $content.attr('style', 'bottom:0;');
    }

    var width= (100 - ((o.options.length+1)*o.margin)) / o.options.length;
    var height = width;
    var marginRight = o.margin/2;
    var marginLeft = o.margin/2;

    $.each(o.options,function(key, value){

      var $option = $('<div class="button '+value.class+'"></div>');
      $option.on('click', value.callable);
      if (key == 0) {
        marginRight = o.margin/2;
        marginLeft=o.margin;
      } else{
        if (key == o.options.length-1) {
          marginRight = o.margin;
          marginLeft = o.margin/2;
        } else {
          marginRight = o.margin/2;
          marginLeft = o.margin/2;
        }
      }
      $option.attr('style', 'float:left;width:'+width+'%;height:'+height+'%;margin:'+o.margin+'% '+marginRight+'% 0 '+marginLeft+'%;');
      $bubble = $('<div class="bubble">'+value.text+'</div>');
    
      $option.append($bubble);
      $content.append($option);
    });
    $shadow.html($content);
    return $shadow;
  };
  //
  // plugin defaults
  //
  $.fn.optionsGoogle.defaults = {
    options:[],
    margin: 5,
    bottom:true
  };
//
// end of closure
//
})(jQuery);