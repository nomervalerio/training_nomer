
var Login_[[widgetId]] = function() {
	return {
		myVariable: null,

		init: function() {
			alert("Login_[[widgetId]].init");
			
//			// attach an event to an HTML element
//			var self = this;
//			jQuery(".Login .myElementClass").click(function() {
//				self.myMethod();
//				// do something
//				...
//			});
		},
		
		myMethod: function() {
			alert("Login.myMethod()");
		}
		// no comma after last method
	};
}();

//jQuery(Login_[[widgetId]].init()); // Run after page loads