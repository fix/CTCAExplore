var ritems = Lungo.dom("#resultItems").html();
var aeitems = Lungo.dom("#aeItems").html();
var aeitem = Lungo.dom("#aeItem").html();
var caitems = Lungo.dom("#categoryItems").html();


Lungo.Service.Settings.success = function() {};
Lungo.Service.Settings.error = function() {};

Lungo.Data.Storage = (function() {
	return {
		persistent : Device.Storage.local,
		session : Device.Storage.session
	};
})();

Lungo.init({
	name : 'CTCAEv4',
	version : '1.0',
});

var evalOffline = function(onlineCallback, offlineCallback) {
	return function(result) {
		eval(result);
		if (offline) {
			Lungo.dom("#offline").show();
			if (offlineCallback)
				offlineCallback();
		} else {
			Lungo.dom("#offline").hide();
			applicationCache.update();
			if (onlineCallback)
				onlineCallback();
		}
		return offline;
	}
};


var parseAE = function(ae) {
	Lungo.dom("#ae").empty();
	Lungo.dom("#ae").append(Mustache.render(aeitem, ae));
};

applicationCache.addEventListener('progress', function(event) {
	if (event.loaded == event.total) Lungo.dom("#updatebutton").hide();
	else Lungo.dom("#updatebutton").show();
	Lungo.Element.progress("#cache-loading", 100 * (event.loaded / event.total), false);
}, false);

function handleAppCache() {
	if (applicationCache == undefined) return;
	if (applicationCache.status == applicationCache.UPDATEREADY) {
		applicationCache.swapCache();
		location.reload();
		return;
	}
}