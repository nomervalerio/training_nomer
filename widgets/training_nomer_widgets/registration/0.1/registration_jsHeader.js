
var Registration = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#Register").click(function() {
				
				var saveOp = jQuery("#saveOp").val();
				var personId = jQuery("#personId").val();
				var userName = jQuery("#userName").val();
				var firstName = jQuery("#firstName").val();
				var middleName = jQuery("#middleName").val();
				var lastName = jQuery("#lastName").val();
				
				jQuery.ajax({
					url: "",
					data: {
						op: saveOp,
						personId: personId,
						userName: userName,
						firstName: firstName,
						middleName: middleName,
						lastName: lastName
					},
					success: function(data){
						console.log("data", data);
						
						if(data == 'true'){
							alert("Person data successfully saved.");
						}
						else{
							alert("Username already exist!");
						}
					}
				});
				
			});
		},
		
		myMethod: function() {
			alert("Registration.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(Registration.init()); // Run after page loads