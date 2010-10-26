$(document).ready(function(){
	if($.browser.msie) {
		$("body").addClass("browser-ie").addClass("browser-ie" + $.browser.version.substring(0, 1));
	}

	// add vertical separator bars to navigation
	addSeparators($("#MainNavigation li"));
	addSeparators($("#MainSubNavigation li"));
	addSeparators($("ServiceNavigation li:not(.action)"));

	// add hover background to links
	$("a.links").wrapInner("<span class='text' />");

	// nice HotFeet-style borders
	$("#Body h2").backgroundBorder();

	// folded texts
	$("a.more-info").click(function() {
		$(this).next("div.details").fadeSliderToggle();
	});

	// textbox watermarks
	$("input[type='text'], textarea").each(function() {
		var title = $(this).attr("title");
		var curValue = $(this).val();
		if(title && (curValue === "" || curValue == title)) {
			$(this).watermark(title);
		}
	});

	//TODO: delay this:
	$.localScroll.hash({easing:'swing'});

	// stripe tables  
	$("table.striped").decorateTable({columnIndex: true}).stripeTable();
	
	setupPopupOverlay();
});

function setupPopupOverlay() {
	var popupLinks = $("a.popup");
	if(popupLinks.length === 0) {
		return;
	}

	// create <div id="Overlay"><iframe frameborder="0" scrolling="no"></iframe></div>
	var iframe = $("<iframe/>").attr({frameborder: 0, scrolling: "no"});
	$("body").append($("<div/>").attr("id", "Overlay").append(iframe));
	
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
			
			// always set the url, so forms get reloaded
			overlay.find("iframe").attr("src", src);
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