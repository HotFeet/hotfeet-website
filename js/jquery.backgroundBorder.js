(function($) {
	$.fn.backgroundBorder = function(options) {
		opts = jQuery.extend({
			backgroundClass: "background-border",
			dotDistance: 3
		}, options);
	
		return this.each(function() {
			var bg = $(this).css("background-color");
			//TODO: test with IE/Safari/Opera/...
			bg = (bg == "transparent" || bg == "rgba(0, 0, 0, 0)" ? "white" : bg);
			var p;

			if($(this).css("border-right-style") == "dotted") { // all four borders are dotted
				$(this).css("width", parseInt($(this).css("width"), 10) - ($(this).outerWidth() - 1) % opts.dotDistance); 
				$(this).css("height", parseInt($(this).css("height"), 10) - ($(this).outerHeight() - 1) % opts.dotDistance); 
		
				//TODO: remove assumption that all paddings are equal
				p = parseInt($(this).css("padding-top"), 10);
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
				$(this).wrapInner($("<div/>").css({
						width: (w - p - p + opts.dotDistance + 1),
						height: (h - p - p + opts.dotDistance + 1),
						padding: (p - 2),
						backgroundColor: bg
				}));
			} else if($(this).css("border-top-style") == "dotted") { // only top border is dotted
				p = parseInt($(this).css("padding-top"), 10);
				$(this).css({
					paddingTop: opts.dotDistance,
					border: "none"
				});
				$(this).addClass(opts.backgroundClass);
				$(this).wrapInner($("<div/>").css({
					paddingTop: (p + 1 - opts.dotDistance),
					backgroundColor: bg
				}));
			}
		});
	};
})(jQuery);
