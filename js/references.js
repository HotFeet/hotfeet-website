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

	processReferenceData();

	// if url contains "#ref-[id]", find and open the corresponing reference
	var url = document.location.toString();
	if(url.match("#ref-")) {
      var refId = url.split("#ref-")[1];
      $(idToLink[refId]).click();
	}
});

var idToLink = {};

function processReferenceData() {
	$("ul.projects li a.name-link").each(function(idx) {
		$(this).data("info", referenceData[idx]);
		idToLink[referenceIDs[idx]] = this;
	});
}

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
	var curLink = $(refPanel).data("link");
	if(curLink == link) {
		return;
	}

	// de-select old link
	$(curLink).toggleClass("selected");

	// connect panel to link
	$(refPanel).data("link", link);
	$(link).toggleClass("selected");		

	var info = $(link).data("info");
	$(curSlide).find(".name").html(info.Name);
	if(info.WentLiveOn.getFullYear() != 1) {
		$(curSlide).find(".name").append(" (" + info.WentLiveOn.getFullYear() + ")");
	}

	urlLink = $(curSlide).find(".website-link");

	var href = info.Url;
	if(href) {
		// remove "http://" or "https://"
		urlLink.html(href.replace(/https?:\/\//, ""));
		urlLink.attr("href", href);
		urlLink.show();
	} else {
		href = "javascript:;";
		urlLink.hide();
	}

	$(curSlide).find(".screenshot-link").attr("href", href);
	// FIXME: replace with new path and datastore id
	$(curSlide).find(".screenshot-link img").attr("src", getScreenshotLink(info.MigrationID));

	$(curSlide).find(".description").html(info.Description);
	var features = info.Features;
	if(features) {
		var list = $(curSlide).find(".features ul");
		$(list).empty();
		var items = info.Features.split("\n");
		for(var i = 0; i < items.length; i++) {
			$(list).append("<li>" + items[i] + "</li");
		}
		$(curSlide).find(".features").show();
	} else {
		$(curSlide).find(".features").hide();
	}

	if(info.DesignerName) {
		var designerLink = $(curSlide).find(".design a");
		$(designerLink).html(info.DesignerName);
		$(designerLink).attr("href", (info.DesignerUrl ? info.DesignerUrl : "javascript:;"));

		$(curSlide).find(".design").show();
	} else {
		$(curSlide).find(".design").hide();
	}
}		

function getScreenshotLink(id) {
	return "ref_imgs_test/new_references_" + id + ".png";
}
