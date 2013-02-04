
var AddressList_[[widgetId]] = function() {
	return {
		myVariable: null,

		init: function() {
			alert("AddressList_[[widgetId]].init");
			
//			// attach an event to an HTML element
//			var self = this;
//			jQuery(".AddressList .myElementClass").click(function() {
//				self.myMethod();
//				// do something
//				...
//			});
		},
		
		myMethod: function() {
			alert("AddressList.myMethod()");
		}
		// no comma after last method
	};
}();

//jQuery(AddressList_[[widgetId]].init()); // Run after page loads