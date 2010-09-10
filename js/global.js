$(document).ready(function(){
	addSeparators($("#MainNavigation li"));
	addSeparators($("#ServiceNavigation li:not(.action)"));
});

function addSeparators(elements) {
	$(elements.not(":last")).append("|");

	// Workaround for WebKit bug:
	// Change the margin slightly to force a refresh  	
	var margin = parseInt($(elements).css("margin-right")); 
	$(elements).css("margin-right", margin + 1);
}

function beautifyBorder(el) {
	$(el).each(function() {
		var p = parseInt($(this).css("padding-top"));
		//TODO: check if "- 6" is really needed...
		var w = $(this).innerWidth() - 6 - (($(this).outerWidth() - 1) % 3);
		var h = $(this).innerHeight() - 6 - (($(this).outerHeight() - 1) % 3);
		
		var bg = $(this).css("background-color");
		bg = (bg == "transparent" ? "white" : bg);

		$(this).css({
			width: w,
			height: h - 1,
			padding: 3,
			border: "none",
			backgroundImage: "url(images/line.png)"
		});
		$(this).wrapInner(
			"<div style='width:" + (w - p - p + 4) + "px;height:" + (h - p - p + 4) + "px;padding:" + (p - 2) + "px;background-color:" + bg + "' />"
		);
	});
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
		lowerEdge = $(footer).offset().top + $(footer).outerHeight(true);
	}

	var result = ($(window).height() > lowerEdge);
	if(result == lastResult)
		return;

	if(result)
		$(footer).addClass("sticking");
	else
		$(footer).removeClass("sticking");
	
	lastResult = result;	
}