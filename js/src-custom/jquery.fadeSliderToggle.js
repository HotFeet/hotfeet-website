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