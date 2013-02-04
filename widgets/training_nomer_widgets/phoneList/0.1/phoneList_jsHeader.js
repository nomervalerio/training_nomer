
var PhoneList = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#Phone").click(function() {
				
				var personId = jQuery("#personId").val();
				
				jQuery.ajax({
					url: "",
					data: {},
					success: 
							window.location.href = "/ttsvr/n/nomer-17?personId=" + personId //This should be Phone Navpoint
				});
				
			});
		},
		
		myMethod: function() {
			alert("PhoneList.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(PhoneList.init()); // Run after page loads