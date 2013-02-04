
var PhoneList_[[widgetId]] = function() {
	return {
		myVariable: null,

		init: function() {
			alert("PhoneList_[[widgetId]].init");
			
//			// attach an event to an HTML element
//			var self = this;
//			jQuery(".PhoneList .myElementClass").click(function() {
//				self.myMethod();
//				// do something
//				...
//			});
		},
		
		myMethod: function() {
			alert("PhoneList.myMethod()");
		}
		// no comma after last method
	};
}();

//jQuery(PhoneList_[[widgetId]].init()); // Run after page loads