% include('graphscommon.tpl')

$.getJSON('/statsdata/user/{{user}}', function(json) {
	$.plot("#domainschart", [ json.domains ], options);
});
