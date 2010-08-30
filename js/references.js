var refPanel, screenshot, thumbnail;

$(document).ready(function() {
	refPanel = $("#ReferencePanel");
	screenshot = $("#ScreenshotLink img");
	thumbnail = $("#Thumbnail");

	$("ul.projects li a").hover(
		function() {
			thumbnail.attr("src", $(this).next(".ref-info").find(".screenshot").attr("href"));
		},
		null
	);
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
		refPanel.toggle("blind", null, "slow");
		return;
	}

	if($(link).closest("ul").get(0) == refPanel.prev("ul").get(0))
		populatePanel(link);
	else {
		// hide animated, populate, show animated
		refPanel.toggle("blind", null, "slow", function() {populateAndShowDetailsPanel(link);});
	}
}

function populateAndShowDetailsPanel(link) {
	populatePanel(link);
	$("#ReferencePanel").detach();
	$(link).closest("ul").after(refPanel);
	refPanel.toggle("blind", null, "slow");
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
	if(href.substring(7) != "http://")
		href = "http://" + href;

	$("#UrlLink").attr("href", href);
	$("#ScreenshotLink").attr("href", href);

	// remove "http://" or "https://"
	href = href.replace(/https?:\/\//, "");
	$("#UrlLink").html(href);

	$("#Description").html($(info).find(".description").html());
	
	$("#ScreenshotLink img").attr("src", $(info).find(".screenshot").attr("href"));
}		
