$.getJSON('/statsdata/links', function(json) {
	$.plot("#linkschart", [ json.links ], options);
});
