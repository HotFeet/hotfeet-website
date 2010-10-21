/*
 * Fade Slider Toggle plugin
 * 
 * Copyright(c) 2009, Cedric Dugas
 * http://www.position-relative.net
 *	
 * A sliderToggle() with opacity
 * Licenced under the MIT Licence
 */

(function($) {
	$.fn.fadeSliderToggle = function(settings) {
		/* Damn you jQuery opacity:'toggle' that dosen't work!~!!!*/
		settings = jQuery.extend({
			speed:500,
			easing : "swing"
		}, settings);
		
		$(this).animate({
			opacity: ($(this).css("display") == "none" ? 1 : 0),
			height: 'toggle'
		}, settings.speed, settings.easing);
	}
})(jQuery);
 