% include('graphscommon.tpl')

$.getJSON('/statsdata/domains', function(json) {
	$.plot("#domainschart", [ json.domains ], options);
});
