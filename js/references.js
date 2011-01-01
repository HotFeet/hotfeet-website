var refPanel, refSlider, curSlide, screenshot;
var infoTemplate;

$(document).ready(function() {
	$.get("reference-info-template.html", function(data) {infoTemplate = data;});

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
		speed: 600,
		after: function() {
			// set hidden img to blank picture, otherwise the old image might be shown
			// for a moment when sliding to the next one
			var hiddenImg = curSlide.data("nextSlide").find(".screenshot-link img");
			hiddenImg.attr("src", "images/empty.gif");
		}
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
	
	// install click handler for slides in sidebar
	$("#ReferencesSlideshow a.ref-link").click(function() {
		openReferenceByAnchor($(this).attr("href"));
	});
	
	$("ul.projects").backgroundBorder();

	setTimeout(function() {openReferenceByAnchor(document.location.toString());}, 500);
});

// extract "1234" from "references.aspx#ref-1234" and open reference with given id
function openReferenceByAnchor(url) {
	// if url contains "#ref-[id]", find and open the corresponing reference
	if(url.match("#ref-")) {
      var refId = url.split("#ref-")[1];
      $(idToLink[refId]).click();
	}
}

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

function __getYearString(year) {
	return (year == 1 ? "" : "(" + year + ")");
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
	$(curSlide).empty();
	$(curSlide).append($.tmpl(infoTemplate, info));

	if(!info.Url) {
		$(curSlide).find(".website-link").hide();
		$(curSlide).find(".screenshot-link img").unwrap();
	}

	if(!info.Feat) {
		$(curSlide).find(".features").hide();
	}

	var design = $(curSlide).find(".design");
	if(info.DName) {
		// show link if designer URL is given, otherwise show span
		if(!info.DUrl) {
			design.find("a span").unwrap();
		}
	} else {
		design.hide();
	}
	
	$(curSlide).find("a.links").wrapInner("<span class='text' />");
}		

function getScreenshotLink(id) {
	return "ref_imgs_test/new_references_" + id + ".png";
}
