% include('graphscommon.tpl')

$.getJSON('/statsdata', function(json) {
	$.plot("#messageschart", [ json.messages ], options);
	$.plot("#linkschart", [ json.links ], options);
	$.plot("#linksratiochart", [ json.ratio ], options);
	$.plot("#domainschart", [ json.domains ], options);
});