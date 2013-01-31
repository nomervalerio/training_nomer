
var InformationWidget = function() {
	return {
		myVariable: null,

		init: function() {
			alert("InformationWidget.init()");

//			// attach an event to an HTML element
//			var self = this;
//			jQuery(".InformationWidget .myElementClass").click(function() {
//				self.myMethod();
//				// do something
//				...
//			});
		},
		
		myMethod: function() {
			alert("InformationWidget.myMethod()");
		}
		// no comma after last method
	};
}();

//jQuery(InformationWidget.init()); // Run after page loads