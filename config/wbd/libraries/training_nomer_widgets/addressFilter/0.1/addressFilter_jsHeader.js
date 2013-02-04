
var AddressFilter = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#addressFilter").keyup(function() {
				var params = {
						filter: jQuery("#addressFilter").val()
					};
				
					ajaxZoneLoad_address(params);
			});
		},
		
		myMethod: function() {
			alert("AddressFilter.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(AddressFilter.init()); // Run after page loads