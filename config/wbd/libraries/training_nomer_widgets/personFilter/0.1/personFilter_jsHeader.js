
var PersonFilter = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#txt-filter").keyup(function() {
				var params = {
						filter: jQuery("#txt-filter").val()
					};
				
					ajaxZoneLoad_person(params);
			});
		},
		
		myMethod: function() {
			alert("PersonFilter.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(PersonFilter.init()); // Run after page loads