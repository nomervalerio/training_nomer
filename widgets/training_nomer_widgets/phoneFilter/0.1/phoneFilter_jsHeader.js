
var PhoneFilter = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#phoneFilter").keyup(function() {
				var params = {
						filter: jQuery("#phoneFilter").val()
					};
				
					ajaxZoneLoad_phone(params);
			});
		},
		
		myMethod: function() {
			alert("PhoneFilter.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(PhoneFilter.init()); // Run after page loads