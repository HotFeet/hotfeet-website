var curLink, curSlide;
var panel, slider;

$(document).ready(function() {
	/*** Content ***/
	/*** setup ReferenceSlider ***/
	slider = $("#ReferenceSlider");

	// create second copy of reference details panel
	var slide1 = $("#ReferenceSlider div.reference-details");
	var slide2 = slide1.clone().css("display", "none").appendTo("#ReferenceSlider");
	slide1.data("nextSlide", slide2);
	slide2.data("nextSlide", slide1);
	curSlide = slide1;

	slider.cycle({
		fx: "scrollHorz",
		timeout: 0,
		speed: 600
	});

	// install click handler for reference links
	$("ul.projects a.name-link").click(function() {refLinkClicked(this); return false;});
	$("ul.projects a.name-link").attrValueSwitch("title");

	$("ul.projects li").each(function() {
		$(this).children(".screenshot-link").attr("href", $(this).find(".website-link").attr("href"));
	}); 

	$("ul.projects").backgroundBorder();


	/*** setup ReferencePanel ***/
	panel = $("#ReferencePanel");
	
	$("#PrevProj").click(function() { $($(panel).data("link")).parent().prev().find("a.name-link").click(); });
	$("#NextProj").click(function() { $($(panel).data("link")).parent().next().find("a.name-link").click(); });

	/*** Sidebar ***/
	var slideshow = $("#RefSlides");
	$("ul.projects li a.name-link").each(function(idx) {
		$(this).hover(
			function() {
				slideshow.cycle(idx).cycle("pause");
				slideshow.parents(".sidebox").addClass("selected");
			},
			function() {
				slideshow.cycle("resume");
				slideshow.parents(".sidebox").removeClass("selected");
			}
		);
	});

	/* TODO: turn this into a plugin */
	/*** slide sidebar into view after scrolling ***/
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
	
	slideshow.find("a.external").each(function() {
		var anchor = $(this).attr("href").substring(1);
		var href = getReferenceLinkByUrl(anchor).next("div.info").children("a.website-link").attr("href");
		$(this).attr("href", href);
	});

	// install click handler for slides in sidebar
	slideshow.find("a.ref-link").click(function() {
		getReferenceLinkByUrl($(this).attr("href")).click();
	});

	
	/*** anchor handling ***/
	var loc = document.location.toString();
	if(loc.match(/#ref-\d+/)) {
		setTimeout(function() {getReferenceLinkByUrl(loc).click();}, 500);
	}
});

// extract "1234" from "references.aspx#ref-1234" and open reference with given id
function getReferenceLinkByUrl(url) {
	var anchorName = /(ref-\d+)$/.exec(url)[1];
	return $("a[name='" + anchorName + "']");	
}

function refLinkClicked(link) {
	// if the panel still hidden, populate and show it
	if(panel.css("display") == "none") {
		populateAndShowDetailsPanel(link);
		return;
	}
	
	// we know the panel is visible at this point

	// the active link was clicked again => hide
	if($(panel).data("link") == link) {
		//screenshot.fadeOut();
		panel.stop(true, true).toggle("blind", null, "slow");
		//TODO: fold this with identical code in populatePanel() below
		$(curLink).removeClass("selected");
		$(curLink).attrValueSwitch(0);
		return;
	}

	if($(link).closest("ul").get(0) == panel.prev("ul").get(0)) {
		var forward = $(link).parent().index() > $($(panel).data("link")).parent().index(); 

		curSlide = curSlide.data("nextSlide");
		populatePanel(link);

		slider.cycle(forward ? "next" : "prev");
	} else {
		// hide animated, populate, show animated
		panel.stop(true, true).toggle("blind", null, "slow", function() {populateAndShowDetailsPanel(link);});
	}
}

function populateAndShowDetailsPanel(link) {
	populatePanel(link);
	$(panel).detach();
	$(link).closest("ul").after(panel);
	panel.stop(true, true).toggle("blind", null, "slow", function() {panel.intoViewport();});
}

function populatePanel(link) {
	if(link == curLink) {
		return;
	}

	// de-select old link
	$(curLink).removeClass("selected");
	$(curLink).attrValueSwitch(0);

	var oldLink = curSlide.data("link");
	if(oldLink) {
		var oldInfo = curSlide.children();
		oldInfo.detach();
		$(oldLink).after(oldInfo);
	}

	
	$(curLink).append($(curLink).data("info"));
	curLink = link;

	var info = $(link).nextAll();
	var mid = info.find("span.mid").html();
	info.find("img.screenshot").attr("src", getScreenshotLink(mid));
	info.detach();
	curSlide.append(info);
	curSlide.data("link", link);

	// connect panel to link 
	$(panel).data("link", link); 
	$(link).addClass("selected");
	$(link).attrValueSwitch(1);
}		
