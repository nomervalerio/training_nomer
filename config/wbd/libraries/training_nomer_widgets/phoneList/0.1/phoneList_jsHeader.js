
var PhoneList = function() {
	return {
		myVariable: null,

		init: function() {
			alert("PhoneList.init()");

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

//jQuery(PhoneList.init()); // Run after page loads