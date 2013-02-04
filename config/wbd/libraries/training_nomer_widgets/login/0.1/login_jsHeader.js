
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
							alert("Welcome " + userName + "!");
							window.location.href = "/ttsvr/n/ttDemo-16" //This should be Information Navpoint
						}
						else if(data == 'false'){
							alert("Username or Password is incorrect!");
							window.location.href = "/ttsvr/n/ttDemo-11" //This should be Login Navpoint
						}
						else{
							alert("Please input Username and Password!");
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