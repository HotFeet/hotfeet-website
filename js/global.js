/*
 * jQuery HotFeet plugins
 *
 * Copyright 2010 HotFeet GmbH
 * Licensed under GPL Version 3 licenses.
 */
(function(a){a.fn.backgroundBorder=function(b){opts=jQuery.extend({backgroundClass:"background-border"},b);return this.each(function(){var d=a(this).css("background-color");d=(d=="transparent"||d=="rgba(0, 0, 0, 0)"?"white":d);var f,c,e,g;if(a(this).css("border-right-style")=="dotted"){a(this).css("width",a(this).width()-(a(this).outerWidth()-1)%3+3);a(this).css("height",a(this).height()-(a(this).outerHeight()-1)%3+3);f=parseInt(a(this).css("padding-top"),10);c=a(this).innerWidth()-3;e=a(this).innerHeight()-2;g={width:c,height:e,paddingLeft:2,paddingRight:1,paddingTop:1,paddingBottom:1,border:"none"};a(this).css(g).addClass(opts.backgroundClass);a(this).wrapInner(a("<div/>").css({width:(c-f-f),height:(e-f-f-1),paddingLeft:(f-1),paddingRight:f,paddingTop:f,paddingBottom:f,backgroundColor:d}))}else{if(a(this).css("border-top-style")=="dotted"&&a(this).css("border-bottom-style")=="dotted"){a(this).css("height",a(this).height()-(a(this).outerHeight()-1)%3+3);f=parseInt(a(this).css("padding-top"),10);c=a(this).innerWidth();e=a(this).innerHeight()-2;g={width:c,height:e,paddingTop:1,paddingBottom:1,border:"none"};a(this).css(g).addClass(opts.backgroundClass);a(this).wrapInner(a("<div/>").css({width:c,height:(e-f-f-1),paddingTop:f,paddingBottom:f,backgroundColor:d}))}else{if(a(this).css("border-top-style")=="dotted"){f=parseInt(a(this).css("padding-top"),10);a(this).css({paddingTop:1,border:"none"});a(this).addClass(opts.backgroundClass);a(this).wrapInner(a("<div/>").css({paddingTop:f,backgroundColor:d}))}}}})}})(jQuery);(function(a){a.fn.fadeSliderToggle=function(b){b=jQuery.extend({speed:500,easing:"swing"},b);return this.animate({opacity:(this.css("display")=="none"?1:0),height:"toggle"},b.speed,b.easing)}})(jQuery);(function(a){a.fn.decorateTable=function(b){opts=jQuery.extend({rowParity:false,rowIndex:false,columnParity:false,columnIndex:false},b);return this.each(function(){a(this).find("tr").each(function(c){if(opts.rowIndex){a(this).addClass("row"+c)}if(opts.rowParity){a(this).addClass(c%2===0?"even":"odd")}a(this).find("th, td").each(function(d){if(opts.columnIndex){a(this).addClass("col"+d)}if(opts.columnParity){a(this).addClass(d%2===0?"even":"odd")}})})})}})(jQuery);(function(a){a.fn.stripeTable=function(b){opts=jQuery.extend({lightnessRatio:0.95,maxLightness:92,saturationRatio:0.6},b);var c=(opts.darkRows=="even"?0:1);a.colors.defaultModel="HSL";return this.each(function(){a(this).find("tr").each(function(d){if(d%2===c){a(this).find("th, td").each(function(){var g=a(this).css("background-color");var f=a.colors(a(this).css("background-color"));var e=Math.min(f.get("l")*opts.lightnessRatio,opts.maxLightness);f.set("l",e);f.set("s",f.get("s")*opts.saturationRatio);a(this).css("background-color",f)})}})})}})(jQuery);

var rootPath;

$(document).ready(function(){
	// pick path from link to entry page
	rootPath = $("#Header a").attr("href");
	if(!rootPath)
		rootPath = "/";

	if($.browser.msie) {
		$("body").addClass("browser-ie").addClass("browser-ie" + $.browser.version.substring(0, 1));
	}

	/*** first do all adjustments which are immediately visible: ***/
	// add vertical separator bars to navigation
	addSeparators($("#MainNav li"));
	addSeparators($("#MainSubNav li"));
	addSeparators($("ServiceNav li:not(.action)"));

	// nice HotFeet-style borders
	$("#Body h2").backgroundBorder();

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
	var container = $("#RefSlidesContainer");
	var slideshow = $("#RefSlides");
	var arrows = $(".prev-next");

	slideshow.cycle({
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
			var img = $("<img class='block-element spin'>").attr("src", getScreenshotLink(id, true));
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
	$(elements.not(":last")).append("|");

	// Workaround for WebKit bug:
	// Change the margin slightly to force a refresh  	
	var margin = parseInt($(elements).css("margin-right"), 10); 
	$(elements).css("margin-right", margin + 1);
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