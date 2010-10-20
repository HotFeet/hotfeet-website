(function($) {
	$.fn.backgroundBorder = function(options) {
		// forget IE 6 and 7
		if($.browser.msie && $.browser.version < 8)
			return;

		opts = jQuery.extend({
			backgroundClass: "background-border",
			dotDistance: 3, 
		}, options);
	
		$(this).each(function() {
			var bg = $(this).css("background-color");
			//TODO: test with IE/Safari/Opera/...
			bg = (bg == "transparent" || bg == "rgba(0, 0, 0, 0)" ? "white" : bg);
	
			if($(this).css("border-right-style") == "dotted") { // all four borders are dotted
				$(this).css("width", parseInt($(this).css("width")) - ($(this).outerWidth() - 1) % opts.dotDistance); 
				$(this).css("height", parseInt($(this).css("height")) - ($(this).outerHeight() - 1) % opts.dotDistance); 
		
				//TODO: remove assumption that all paddings are equal
				var p = parseInt($(this).css("padding-top"));
				//TODO: check if "- 6" is really needed...
				var w = $(this).innerWidth() - opts.dotDistance * 2;
				var h = $(this).innerHeight() - opts.dotDistance * 2;
		
				var newCss = {
					width: w,
					height: h,
					padding: opts.dotDistance,
					border: "none"
				};
				$(this).css(newCss);
				$(this).addClass(opts.backgroundClass);
				$(this).wrapInner(
					"<div style='" +
						"width:" + (w - p - p + opts.dotDistance + 1) + "px;" +
						"height:" + (h - p - p + opts.dotDistance + 1) + "px;" +
						"padding:" + (p - 2) + "px;" +
						"background-color:" + bg + 
					"'/>"
				);
			} else if($(this).css("border-top-style") == "dotted") { // only top border is dotted
				var p = parseInt($(this).css("padding-top"));
				$(this).css({
					paddingTop: opts.dotDistance,
					border: "none"
				});
				$(this).addClass(opts.backgroundClass);
				$(this).wrapInner(
					"<div style='" +
						"padding-top:" + (p + 1 - opts.dotDistance) + "px;" +
						"background-color:" + bg +
					"'/>"
				);
			}
		});
	};
})(jQuery);
