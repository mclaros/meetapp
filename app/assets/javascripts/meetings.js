// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.

String.prototype.rjust = function (length, padding) {
	var paddedString = this.slice();
	while (paddedString.length < length) {
		paddedString = padding + paddedString;
	}
	return paddedString;
};

function setDefaultInputDate (dateInputSelector) {
	var input = $(dateInputSelector);
	if (input.length > 0) {
		var localDate = new Date().toLocaleDateString().split('/');
		localDate[0] = localDate[0].rjust(2, '0');
		localDate[1] = localDate[1].rjust(2, '0');
		var formattedDate = localDate[2] + '-' + localDate[0] + '-' + localDate[1];
		input.val(formattedDate);
	}
}

$(document).ready(function () {
	setDefaultInputDate('.date-input');
});