
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
							window.location.href = "/ttsvr/n/nomer-16?personId=" + personId
						}
						else if(data == 'false'){
							alert("Number already exist!");
						}
						else{
							alert("Number successfully added!");
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
			alert("Phone.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(Phone.init()); // Run after page loads