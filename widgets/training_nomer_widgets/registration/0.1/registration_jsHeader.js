
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
				var email = jQuery("#email").val();
				var password1 = jQuery("#password1").val();
				var password2 = jQuery("#password2").val();
				
				jQuery.ajax({
					url: "",
					data: {
						op: saveOp,
						personId: personId,
						userName: userName,
						firstName: firstName,
						middleName: middleName,
						lastName: lastName,
						email: email,
						password1: password1,
						password2: password2
					},
					success: function(data){
						console.log("data", data);
						
						if(data == 'true'){
							alert("Person data successfully saved.");
						}
						else if(data == 'false'){
							alert("Username already exist!");
						}
						else if(data == 'invalid'){
							alert("Please input a valid Email!");
						}
						else{
							alert("Password does not match!");
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