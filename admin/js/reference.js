var origImg;
var clearButton, cropCoordinates;
var jCrop;
var scale;

$(document).ready(function() {
	setTimeout(initCropping, 500);
});

function initCropping() {
	clearButton = $("#ClearButton");
	cropCoordinates = $("#CropCoordinates");
	origImg = $("#Image img");
	if(origImg.length == 0 || !origImageDimensions)
		return;
	
	scale = parseFloat(origImg.width()) / origImageDimensions[0];
	
	jCrop = $.Jcrop("#Image img", {
		onChange: updateCropping,
		onSelect: updateCropping,
		aspectRatio: 1,
		minSize: [
			Math.round(545 * scale),
			Math.round(545 * scale)
		] 
	});


	var rect = curCropRectangle;
	if(rect[2] > 0) {
		var selection = [
			Math.round(rect[0] * scale),
			Math.round(rect[1] * scale),
			Math.round((rect[0] + rect[2]) * scale),
			Math.round((rect[1] + rect[3]) * scale)
		];
		jCrop.setSelect(selection);
	}
}

function updateCropping(coords) {
	if(coords.w == 0 || coords.h == 0) {
		clearCropping();
		return;
	}

	clearButton.show();
	cropCoordinates.val(
		Math.round(coords.x / scale) + "/" + 
		Math.round(coords.y / scale) + "/" + 
		Math.round(coords.w / scale) + "/" + 
		Math.round(coords.h / scale)
	);
}

function clearCropping() {
	jCrop.release();
	clearButton.hide();
	cropCoordinates.val("");
}
