% include('graphscommon.tpl')

$.getJSON('/statsdata/ratio', function(json) {
	$.plot("#linksratiochart", [ json.ratio ], options);
});
