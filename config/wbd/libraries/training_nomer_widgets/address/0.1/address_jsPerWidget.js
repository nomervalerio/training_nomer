
var Registration_[[widgetId]] = function() {
	return {
		myVariable: null,

		init: function() {
			alert("Registration_[[widgetId]].init");
			
//			// attach an event to an HTML element
//			var self = this;
//			jQuery(".Registration .myElementClass").click(function() {
//				self.myMethod();
//				// do something
//				...
//			});
		},
		
		myMethod: function() {
			alert("Registration.myMethod()");
		}
		// no comma after last method
	};
}();

//jQuery(Registration_[[widgetId]].init()); // Run after page loads