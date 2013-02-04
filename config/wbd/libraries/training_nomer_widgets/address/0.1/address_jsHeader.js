
var Address = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#saveAddress").click(function() {
				
				var saveAddressOp = jQuery("#saveAddressOp").val();
				var personId = jQuery("#personId").val();
				var addressId = jQuery("#addressId").val();
				var addressType = jQuery("#addressType").val();
				var completeAddress = jQuery("#completeAddress").val();
				
				jQuery.ajax({
					url: "",
					data: {
						op: saveAddressOp,
						personId: personId,
						addressId: addressId,
						addressType: addressType,
						completeAddress: completeAddress
					},
					success: function(data){
						console.log("data", data);
						
						if(data == 'true'){
							alert("Address successfully saved.");
						}
						else if(data == 'false'){
							alert("Address already exist!");
						}
						else{
							alert("Address successfully added!");
						}
					}
				});
				
			});
		},
		
		myMethod: function() {
			alert("Address.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(Address.init()); // Run after page loads