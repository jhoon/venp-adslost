 function showMonitoreo(id) {
	var obj = $(id);
	if(obj.style.display == "none") {
		new Effect.SlideDown(obj);
	} else {
		new Effect.SlideUp(obj);
	}
 }
 
 var watcher = {
 	init: function() {
 		new PeriodicalExecuter(function(pe) {
	  		if(watcher.count() > 0){
	  			if(!watcher.details) watcher.details = $$('div.detalleMonitoreo');
				watcher.cycle();
	  		} else {
	  			watcher.details = null;
	  			pe.stop();
	  		}
		}, 10) // request every X seconds 
 	},
 	details: null,
 	counter: 0,
 	cycle: function() {
 		this.counter++;
 		new Ajax.Request('locacionMonitoreo.do', { method: 'post',
			parameters: 'cmd=ajax', 
			asynchronous: true, 
			onSuccess: function(response) { 
				var htmlUpdate = response.responseText.split("[#############]");
				htmlUpdate.each(function(s, index) {
					if(!s.blank()) {
						watcher.details[index].innerHTML = s;
					}
				});
			} 
		});
 	},
 	count: function() {
 		return $$('div.detalleMonitoreo').length;
 	}
 }
 
window.onload = watcher.init;