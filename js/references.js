var refPanel, refSlider, curSlide, screenshot;

$(document).ready(function() {
	refPanel = $("#ReferencePanel");
	refSlider = $("#ReferenceSlider");
	screenshot = $("#ScreenshotLink img");

	// create second copy of reference details panel
	var slide1 = $("#ReferenceSlider div.reference-details");
	var slide2 = slide1.clone().css("display", "none").appendTo("#ReferenceSlider");
	slide1.data("nextSlide", slide2);
	slide2.data("nextSlide", slide1);
	curSlide = slide1;

	refSlider.cycle({
		fx: "scrollHorz",
		timeout: 0,
		speed: 600
	});

	// install click handler for reference links
	$("ul.projects li a.name-link").click(function() {showDetails(this);});

	$("#PrevProj").click(function() { $($(refPanel).data("link")).parent().prev().find("a.name-link").click(); });
	$("#NextProj").click(function() { $($(refPanel).data("link")).parent().next().find("a.name-link").click(); });

	var slideshow = $("#ReferencesSlideshow");
	slideshow.cycle({
		prev: "#PreviousReference",
		next: "#NextReference",
		random: true,
		speed: 500
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
		$(slideshowBox).animate({top: newTop}, {duration: 500, queue: false});
	});
	/* end of TODO */
	
	// if url contains "#ref-[id]", find and open the corresponing reference
	var url = document.location.toString();
	if(url.match("#ref-")) {
      var refId = url.split("#ref-")[1];
      $(".ref-info input[value='" + refId + "']").parent().prev("a.name-link").click();
	}
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

	if($(link).closest("ul").get(0) == refPanel.prev("ul").get(0)) {
		var forward = $(link).parent().index() > $($(refPanel).data("link")).parent().index(); 

		curSlide = curSlide.data("nextSlide");
		populatePanel(link);
		
		refSlider.cycle(forward ? "next" : "prev");
	} else {
		// hide animated, populate, show animated
		refPanel.stop(true, true).toggle("blind", null, "slow", function() {populateAndShowDetailsPanel(link);});
	}
}

function populateAndShowDetailsPanel(link) {
	populatePanel(link);
	$(refPanel).detach();
	$(link).closest("ul").after(refPanel);
	refPanel.stop(true, true).toggle("blind", null, "slow", function() {refPanel.intoViewport();});
	//screenshot.fadeIn();
}

function populatePanel(link) {
	if($(refPanel).data("link") == link)
		return;

	// connect panel to link
	$(refPanel).data("link", link);

	var info = $(link).next(".ref-info");
	var url = $(info).find("a.url");
	$(curSlide).find(".name").html($(url).html());
	$(curSlide).find(".year").html($(info).find(".year").html());

	var href = url.attr("href");
	//FIXME: remove this
	if(href) {
		if(href.length >= 7 && href.substring(7) != "http://")
			href = "http://" + href;

		$(curSlide).find(".url-link").attr("href", href);
		$(curSlide).find(".screenshot-link").attr("href", href);

		// remove "http://" or "https://"
		href = href.replace(/https?:\/\//, "");
		$(curSlide).find(".url-link").html(href);
	}

	$(curSlide).find(".description").html($(info).find("div").html());
	$(curSlide).find(".screenshot-link img").attr("src", $(info).find(".screenshot").attr("href"));
}		
