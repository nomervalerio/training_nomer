
var List_[[widgetId]] = function() {
	return {
		myVariable: null,

		init: function() {
			alert("List_[[widgetId]].init");
			
//			// attach an event to an HTML element
//			var self = this;
//			jQuery(".List .myElementClass").click(function() {
//				self.myMethod();
//				// do something
//				...
//			});
		},
		
		myMethod: function() {
			alert("List.myMethod()");
		}
		// no comma after last method
	};
}();

//jQuery(List_[[widgetId]].init()); // Run after page loads