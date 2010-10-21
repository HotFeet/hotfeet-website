(function($) {
	$.fn.decorateTable = function(target, options) {
		opts = jQuery.extend({
			rowParity: true,
			rowIndex: false,
			columnParity: true,
			columnIndex: true
		}, options);
	
		$(this).each(function() {
			$(this).find("tr").each(function(rowIdx) {
				if(opts.rowIndex) { $(this).addClass("row" + rowIdx); }
				if(opts.rowParity) { $(this).addClass(rowIdx % 2 === 0 ? "even" : "odd"); }
	
				$(this).find("th, td").each(function(colIdx) {
					if(opts.columnIndex) { $(this).addClass("col" + colIdx); }
					if(opts.columnParity) { $(this).addClass(colIdx % 2 === 0 ? "even" : "odd"); }
				});
			});
		});
	};
})(jQuery);
