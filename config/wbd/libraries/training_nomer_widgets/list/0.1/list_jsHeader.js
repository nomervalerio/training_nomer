
var List = function() {
	return {
		myVariable: null,

		init: function() {
			alert("List.init()");

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

//jQuery(List.init()); // Run after page loads