jQuery.fn.backgroundBorder = function(target, options) {
 	 options = jQuery.extend({
 	 	backgroundClass: "background-border"
	}, options);

	$(this).each(function() {
		var p = parseInt($(this).css("padding-top"));
		//TODO: check if "- 6" is really needed...
		var w = $(this).innerWidth() - 6 - (($(this).outerWidth() - 1) % 3);
		var h = $(this).innerHeight() - 5 - (($(this).outerHeight() - 1) % 3);
		
		var bg = $(this).css("background-color");
		//TODO: test with IE/Safari/Opera/...
		bg = (bg == "transparent" || bg == "rgba(0, 0, 0, 0)" ? "white" : bg);

		$(this).css({
			width: w,
			height: h - 1,
			padding: 3,
			border: "none"
		});
		$(this).addClass(options.backgroundClass);
		$(this).wrapInner(
			"<div style='width:" + (w - p - p + 4) + "px;height:" + (h - p - p + 4) + "px;padding:" + (p - 2) + "px;background-color:" + bg + "' />"
		);
	});

};