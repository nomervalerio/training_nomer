
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
							window.location.href = "/ttsvr/n/nomer-16?personId=" + personId
						}
						else if(data == 'false'){
							alert("Address already exist!");
						}
						else{
							alert("Address successfully added!");
							window.location.href = "/ttsvr/n/nomer-16?personId=" + personId
						}
					}
				});
				
			});
			
			jQuery("#Info").click(function() {
				
				var personId = jQuery("#personId").val();
				
				jQuery.ajax({
					url: "",
					data: {},
					success: 
							window.location.href = "/ttsvr/n/nomer-16?personId=" + personId //This should be Information Navpoint
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