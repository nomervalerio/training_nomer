
var PersonFilter = function() {
	return {
		myVariable: null,

		init: function() {
			alert("PersonFilter.init()");

//			// attach an event to an HTML element
//			var self = this;
//			jQuery(".PersonFilter .myElementClass").click(function() {
//				self.myMethod();
//				// do something
//				...
//			});
		},
		
		myMethod: function() {
			alert("PersonFilter.myMethod()");
		}
		// no comma after last method
	};
}();

//jQuery(PersonFilter.init()); // Run after page loads