/*!
 * HotFeet jQuery plugins
 *
 * Copyright 2010 HotFeet GmbH
 * Licensed under GPL Version 3 licenses.
 */
(function(a){function e(c,b){c.each(function(){var d=c.data("attrValueToggle.attrName"),f=c.data("attrValueToggle.values");if(b==undefined)b=(c.data("attrValueToggle.curIndex")+1)%f.length;c.data("attrValueToggle.curIndex",b).attr(d,f[b])})}a.fn.attrValueSwitch=function(c,b){if(c===null||typeof c=="number"){e(a(this),c);return a(this)}b=jQuery.extend({separator:"|",startIndex:0},b);a(this).each(function(){a(this).data("attrValueToggle.attrName",c);var d=a(this).attr(c).split(b.separator);a(this).data("attrValueToggle.values",
d)});e(a(this),b.startIndex);return a(this)}})(jQuery);
(function(a){a.fn.backgroundBorder=function(e){opts=jQuery.extend({backgroundClass:"background-border"},e);return this.each(function(){var c=a(this).css("background-color");c=c=="transparent"||c=="rgba(0, 0, 0, 0)"?"white":c;var b,d,f,g;if(a(this).css("border-right-style")=="dotted"){a(this).css("width",a(this).width()-(a(this).outerWidth()-1)%3+3);a(this).css("height",a(this).height()-(a(this).outerHeight()-1)%3+3);b=parseInt(a(this).css("padding-top"),10);d=a(this).innerWidth()-3;f=a(this).innerHeight()-
2;g={width:d,height:f,paddingLeft:2,paddingRight:1,paddingTop:1,paddingBottom:1,border:"none"};a(this).css(g).addClass(opts.backgroundClass);a(this).wrapInner(a("<div/>").css({width:d-b-b,height:f-b-b-1,paddingLeft:b-1,paddingRight:b,paddingTop:b,paddingBottom:b,backgroundColor:c}))}else if(a(this).css("border-top-style")=="dotted"&&a(this).css("border-bottom-style")=="dotted"){a(this).css("height",a(this).height()-(a(this).outerHeight()-1)%3+3);b=parseInt(a(this).css("padding-top"),10);d=a(this).innerWidth();
f=a(this).innerHeight()-2;g={width:d,height:f,paddingTop:1,paddingBottom:1,border:"none"};a(this).css(g).addClass(opts.backgroundClass);a(this).wrapInner(a("<div/>").css({width:d,height:f-b-b-1,paddingTop:b,paddingBottom:b,backgroundColor:c}))}else if(a(this).css("border-top-style")=="dotted"){b=parseInt(a(this).css("padding-top"),10);a(this).css({paddingTop:1,border:"none"});a(this).addClass(opts.backgroundClass);a(this).wrapInner(a("<div/>").css({paddingTop:b,backgroundColor:c}))}})}})(jQuery);
(function(a){a.fn.decorateTable=function(e){opts=jQuery.extend({rowParity:false,rowIndex:false,columnParity:false,columnIndex:false},e);return this.each(function(){a(this).find("tr").each(function(c){opts.rowIndex&&a(this).addClass("row"+c);if(opts.rowParity)a(this).addClass(c%2===0?"even":"odd");a(this).find("th, td").each(function(b){opts.columnIndex&&a(this).addClass("col"+b);if(opts.columnParity)a(this).addClass(b%2===0?"even":"odd")})})})}})(jQuery);
(function(a){a.fn.fadeSliderToggle=function(e){e=jQuery.extend({speed:500,easing:"swing"},e);return this.animate({opacity:this.css("display")=="none"?1:0,height:"toggle"},e.speed,e.easing)}})(jQuery);
(function(a){a.fn.stripeTable=function(e){opts=jQuery.extend({lightnessRatio:0.95,maxLightness:92,saturationRatio:0.6},e);var c=opts.darkRows=="even"?0:1;a.colors.defaultModel="HSL";return this.each(function(){a(this).find("tr").each(function(b){b%2===c&&a(this).find("th, td").each(function(){a(this).css("background-color");var d=a.colors(a(this).css("background-color")),f=Math.min(d.get("l")*opts.lightnessRatio,opts.maxLightness);d.set("l",f);d.set("s",d.get("s")*opts.saturationRatio);a(this).css("background-color",
d)})})})}})(jQuery);

/*** global scripts ***/
var rootPath;

$(document).ready(function(){
	// pick path from link to entry page
	rootPath = $("#Header a").attr("href");
	if(!rootPath) {
		rootPath = "/";
	}

	if($.browser.msie) {
		$("body").addClass("browser-ie").addClass("browser-ie" + $.browser.version.substring(0, 1));
	}

	/*** first do all adjustments which are immediately visible: ***/
	// add vertical separator bars to navigation
	addSeparators($("#MainNav li"));
	addSeparators($("#MainSubNav li"));
	addSeparators($("ServiceNav li:not(.action)"));

	// nice HotFeet-style borders
	$("#Body h2:not(.custom)").backgroundBorder();

	// stripe tables  
	$("table.striped").decorateTable({columnIndex: true}).stripeTable();


	/*** now do the remaining adjustments: ***/
	// add target="_blank" for external links
	$("a.external, a[href^='http://'], a[href^='https://']").not("a.internal").attr("target", "_blank"); 

	// add hover background to links
	$("a.links").wrapInner("<span class='text' />");

	// folded texts
	$("a.more-info").click(function() {
		$(this).next("div.details").fadeSliderToggle();
	});

	// textbox watermarks
	/*
	// TODO: done with AjaxCtrlToolkit for now...
	$("input[type='text'], textarea").each(function() {
		var title = $(this).attr("title");
		var curValue = $(this).val();
		if(title && (curValue === "" || curValue == title)) {
			$(this).watermark(title);
		}
	});
	*/
	
	setupEmailRecommendationUrl();
	setupPopupOverlay();

	//TODO: delay this:
	$.localScroll.hash({easing:'swing'});
	
	//Testing only:
	//$("a:not(.links)").css("border", "1px solid green");
	//$("ul.links a").css("border", "none");
});

function setupEmailRecommendationUrl() {
	var url =
		"mailto:?subject=" +
		encodeURIComponent("HotFeet - developing the web") +
		"&body=" + encodeURIComponent(document.title) + "%0A%0A" +
		encodeURIComponent($(location).attr("href"));
	$("a#EmailRecommendation").attr("href", url);
}

function getScreenshotLink(id, small) {
	var suffix = (small ? "_small" : "");
	return rootPath + "ref_imgs_test/new_references_" + id + suffix + ".png";
}

function setupReferencesSlideshow(effect, speed, random) {
	var slideshow = $("#RefSlides");
	var container = slideshow.parent();
	var arrows = $(".prev-next");

	slideshow.cycle({
		containerResize: 0,
		fx: effect,
		prev: "#PreviousReference",
		next: "#NextReference",
		speed: speed,
		random: random,
		before: onBefore
	});

	if(slideshow.children("li").length < 2) {
		return;
	}

	container.hover(
		function() { slideshow.cycle("pause"); arrows.fadeIn(); },
		function() {
			clearSlideshowTimeout();
			slideshowTimeout = window.setTimeout(function() {
				arrows.fadeOut(); slideshow.cycle("resume");
			}, 200);
		}
	);
	
	function onBefore(urr, next, opts) {
		if($(next).find(".ref-link img").length === 0) {
			var refLink = $(next).find(".ref-link");
			var id = /\[(\d+)\]/.exec($(refLink).children("span").html())[1];
			var img = $("<img class='spin'>").attr("src", getScreenshotLink(id, true));
			$(refLink).append(img);
		}
	}
}

var slideshowTimeout;	
function clearSlideshowTimeout() {
	if(!slideshowTimeout)
		return;
	
	window.clearTimeout(slideshowTimeout);
	slideshowTimeout = null;
}


function setupPopupOverlay() {
	var popupLinks = $("a.popup");
	if(popupLinks.length === 0) {
		return;
	}

	// create <div id="Overlay"><iframe frameborder="0" scrolling="no"></iframe></div>
	var iframe = $("<iframe/>").attr({frameborder: 0, scrolling: "no"});
	var overlay = $("<div/>").attr("id", "Overlay").append(iframe);
	overlay.css("-moz-box-shadow", "0 0 20px 0 #404040");
	overlay.css("-webkit-box-shadow", "0 0 20px #404040");
	$("body").append(overlay);
	
	popupLinks.overlay({
		target: "#Overlay",
		top: "center",
		mask: {
			color: '#202020',
			loadSpeed: 500,
			opacity: 0.2
		},
		onBeforeLoad: function() {
			var trigger = this.getTrigger();
			var overlay = this.getOverlay();

			var src = trigger.attr("href");
			// extract size from url (e.g. "demo.aspx?oid=12#w900h600")
			var w = /#.*w(\d+)/.exec(src);
			var h = /#.*h(\d+)/.exec(src);
			
			overlay.css({
				width: (w && w[1] ? parseInt(w[1], 10) : null),
				height: (h && h[1] ? parseInt(h[1], 10) : null)
			});
			
			var iframe = overlay.find("iframe");
			// set the url only if it's not been done yet
			if(iframe.attr("src") != src) {
				iframe.attr("src", src);
			}
		}
	});
}

function addSeparators(elements) {
	$(elements.not(":first")).prepend("<span>|</span>");

	// Workaround for WebKit bug:
	// Change the margin slightly to force a refresh  	
	var margin = parseInt($(elements).css("margin-left"), 10); 
	$(elements).css("margin-left", margin + 1);
}

$(window).load(function() {
	positionFooter();
});

$(window).resize(function() {
	positionFooter();
});

var footer;
var lowerEdge;
var lastResult;
 
function positionFooter() {
	if(!footer) {
		footer = $("#Footer");
		if(footer.length === 0)
			return;
		lowerEdge = $(footer).offset().top + $(footer).outerHeight(true);
	}

	var result = ($(window).height() > lowerEdge);
	if(result == lastResult) {
		return;
	}

	if(result) {
		$(footer).addClass("sticking");
	} else {
		$(footer).removeClass("sticking");
	}
	
	lastResult = result;	
}