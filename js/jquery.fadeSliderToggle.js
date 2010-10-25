(function($) {
	$.fn.fadeSliderToggle = function(settings) {
		/* Damn you jQuery opacity:'toggle' that dosen't work!~!!!*/
		settings = jQuery.extend({
			speed: 500,
			easing: "swing"
		}, settings);
		
		return this.animate({
			opacity: (this.css("display") == "none" ? 1 : 0),
			height: 'toggle'
		}, settings.speed, settings.easing);
	}
})(jQuery);
 