$(document).ready(function(){
	addSeparators($("#MainNavigation li"));
	addSeparators($("#ServiceNavigation li:not(.action)"));

	$("#Body h2").backgroundBorder();

	$("a.more-info").click(function() {
		$(this).next("div.details").fadeSliderToggle();
	});
	
	//TODO: delay this:
	$.localScroll.hash({easing:'swing'});
});

function addSeparators(elements) {
	$(elements.not(":last")).append("|");

	// Workaround for WebKit bug:
	// Change the margin slightly to force a refresh  	
	var margin = parseInt($(elements).css("margin-right")); 
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