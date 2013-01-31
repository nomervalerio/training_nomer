
var Login = function() {
	return {
		myVariable: null,

		init: function() {
			jQuery("#Login").click(function() {
				
				var loginOp = jQuery("#loginOp").val();
				var userName = jQuery("#userName").val();
				var password = jQuery("#password").val();
				
				jQuery.ajax({
					url: "",
					data: {
						op: loginOp,
						userName: userName,
						password: password
					},
					success: function(data){
						console.log("data", data);
						
						if(data == 'true'){
							alert("Welcome!");
						}
						else{
							alert("Username or Password is incorrect!");
						}
					}
				});
				
			});
		},
		
		myMethod: function() {
			alert("Login.myMethod()");
		}
		// no comma after last method
	};
}();

jQuery(Login.init()); // Run after page loads