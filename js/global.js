$(document).ready(function(){
	addSeparators($("#MainNavigation li"));
	addSeparators($("#ServiceNavigation li:not(.action)"));
});

function addSeparators(elements) {
	$(elements.not(":last")).append("&nbsp;|&nbsp;");
}

/*
	- read padding => gap
	- read width/height => w,h
	- $('div.box').wrapInner("<div class='xxx' style='margin:" + gap + "px' />");
	- add class to container (cancel padding, add background-image)
*/

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