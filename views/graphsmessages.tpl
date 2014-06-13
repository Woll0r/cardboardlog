% include('graphscommon.tpl')

$.getJSON('/statsdata/messages', function(json) {
	$.plot("#messageschart", [ json.messages ], options);
});
