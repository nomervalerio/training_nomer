
var Phone = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#savePhone").click(function() {
				
				var savePhoneOp = jQuery("#savePhoneOp").val();
				var personId = jQuery("#personId").val();
				var phoneId = jQuery("#phoneId").val();
				var phoneType = jQuery("#phoneType").val();
				var completeNumber = jQuery("#completeNumber").val();
				
				jQuery.ajax({
					url: "",
					data: {
						op: savePhoneOp,
						personId: personId,
						phoneId: phoneId,
						phoneType: phoneType,
						completeNumber: completeNumber
					},
					success: function(data){
						console.log("data", data);
						
						if(data == 'true'){
							alert("Number successfully saved.");
						}
						else if(data == 'false'){
							alert("Number already exist!");
						}
						else{
							alert("Number successfully added!");
						}
					}
				});
				
			});
		},
		
		myMethod: function() {
			alert("Phone.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(Phone.init()); // Run after page loads