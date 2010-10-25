/*
 * jQuery HotFeet plugins
 *
 * Copyright 2010 HotFeet GmbH
 * Licensed under GPL Version 3 licenses.
 */
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

(function($) {
	$.fn.fadeSliderToggle = function(settings) {
		settings = jQuery.extend({
			speed: 500,
			easing: "swing"
		}, settings);
		
		return this.animate({
			opacity: (this.css("display") == "none" ? 1 : 0),
			height: 'toggle'
		}, settings.speed, settings.easing);
	};
})(jQuery);

(function($) {
	$.fn.decorateTable = function(options) {
		opts = jQuery.extend({
			rowParity: false,
			rowIndex: false,
			columnParity: false,
			columnIndex: false
		}, options);

		return this.each(function() {
			$(this).find("tr").each(function(rowIdx) {
				if(opts.rowIndex) { $(this).addClass("row" + rowIdx); }
				if(opts.rowParity) { $(this).addClass(rowIdx % 2 === 0 ? "even" : "odd"); }
	
				$(this).find("th, td").each(function(colIdx) {
					if(opts.columnIndex) { $(this).addClass("col" + colIdx); }
					if(opts.columnParity) { $(this).addClass(colIdx % 2 === 0 ? "even" : "odd"); }
				});
			});
		});
	};
})(jQuery);

(function($) {
	$.fn.stripeTable = function(options) {
		opts = jQuery.extend({
			lightnessRatio: 0.95,
			maxLightness: 92,
			saturationRatio: 0.6
		}, options);
		
		var rem = (opts.darkRows == "even" ? 0 : 1);
		
		//TODO: add RGB -> HSL -> RGB conversion from
		//      http://mjijackson.com/2008/02/rgb-to-hsl-and-rgb-to-hsv-color-model-conversion-algorithms-in-javascript
		//      var parts = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/); // parts now should be ["rgb(0, 70, 255", "0", "70", "255"]
		//      http://github.com/jquery/jquery-color/blob/master/jquery.color.js
		
		//TODO: move this into color creation via $.colors(...)
		$.colors.defaultModel = "HSL";
		
		return this.each(function() {
			$(this).find("tr").each(function(rowIdx) {
				if(rowIdx % 2 === rem) {
					$(this).find("th, td").each(function() {
						var c = $(this).css("background-color");
						var color = $.colors($(this).css("background-color"));
						//TODO: handle empty background-colors (i.e. Alpha = 0)
						var l = Math.min(color.get("l") * opts.lightnessRatio, opts.maxLightness);
						color.set("l", l); 
						color.set("s", color.get("s") * opts.saturationRatio);
						$(this).css("background-color", color);

						//var mixedColor = $.colors(originalColor).mixWith(opts.color);
						//$(this).css("background-color", mixedColor);
					});
				}
			});
		});
	};
})(jQuery);
