
var Information = function() {
	return {
		myVariable: null,

		init: function() {
			alert("Information.init()");

//			// attach an event to an HTML element
//			var self = this;
//			jQuery(".Information .myElementClass").click(function() {
//				self.myMethod();
//				// do something
//				...
//			});
		},
		
		myMethod: function() {
			alert("Information.myMethod()");
		}
		// no comma after last method
	};
}();

//jQuery(Information.init()); // Run after page loads