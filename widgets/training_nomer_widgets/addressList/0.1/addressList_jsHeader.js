
var AddressList = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#Address").click(function() {
				
				var personId = jQuery("#personId").val();
				
				jQuery.ajax({
					url: "",
					data: {},
					success: 
							window.location.href = "/ttsvr/n/nomer-18?personId=" + personId //This should be Address Navpoint
				});
				
			});
		},
		
		myMethod: function() {
			alert("AddressList.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(AddressList.init()); // Run after page loads