var refPanel, screenshot;

$(document).ready(function() {
	refPanel = $("#ReferencePanel");
	screenshot = $("#ScreenshotLink img");

	var slideshow = $("#ReferencesSlideshow");

	slideshow.cycle({
		prev: "#PreviousReference",
		next: "#NextReference",
		random: true
	});

	$("ul.projects li a.name-link").each(function(idx) {
		$(this).hover(
			function() { slideshow.cycle(idx).cycle("pause"); },
			function() { slideshow.cycle("resume"); }
		);
	});

	/* TODO: turn this into a plugin */
	var slideshowBox = slideshow.parents(".sidebox");
	var initialRelTop = slideshowBox.position().top;
	var initialAbsTop = slideshowBox.offset().top;
	slideshowBox.css("position", "absolute");
	
	$(window).scroll(function() {
		var winTop = $(document).scrollTop();
		var newTop = initialRelTop + (winTop > initialAbsTop ? (winTop - initialAbsTop) + 15 : 0);
		$(slideshowBox).animate({top: newTop}, {duration: 200, queue: false});
	});
	/* end of TODO */
});

function showDetails(link) {
	// if the panel still hidden, populate and show it
	if(refPanel.css("display") == "none") {
		populateAndShowDetailsPanel(link);
		return;
	}
	
	// we know the panel is visible at this point

	// the active link was clicked again => hide
	if($(refPanel).data("link") == link) {
		//screenshot.fadeOut();
		refPanel.stop(true, true).toggle("blind", null, "slow");
		return;
	}

	if($(link).closest("ul").get(0) == refPanel.prev("ul").get(0))
		populatePanel(link);
	else {
		// hide animated, populate, show animated
		refPanel.stop(true, true).toggle("blind", null, "slow", function() {populateAndShowDetailsPanel(link);});
	}
}

function populateAndShowDetailsPanel(link) {
	populatePanel(link);
	$(refPanel).detach();
	$(link).closest("ul").after(refPanel);
	refPanel.stop(true, true).toggle("blind", null, "slow");
	//screenshot.fadeIn();
}

function populatePanel(link) {
	if($(refPanel).data("link") == link)
		return;

	// connect panel to link
	$(refPanel).data("link", link);

	var info = $(link).next(".ref-info");
	var url = $(info).find("a.url");
	$("#Name").html($(url).html());
	$("#Year").html($(info).find(".year").html());

	var href = url.attr("href");
	//FIXME: remove this
	if(href) {
		if(href.length >= 7 && href.substring(7) != "http://")
			href = "http://" + href;

		$("#UrlLink").attr("href", href);
		$("#ScreenshotLink").attr("href", href);

		// remove "http://" or "https://"
		href = href.replace(/https?:\/\//, "");
		$("#UrlLink").html(href);
	}

	$("#Description").html($(info).find(".description").html());
	
	$("#ScreenshotLink img").attr("src", $(info).find(".screenshot").attr("href"));
}		
