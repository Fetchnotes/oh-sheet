module("actionsheet");

// In this test we call the example showAlert API method with an empty string
// In the example API method an empty string will immediately call the error callback
asyncTest("Display a dialog", 1, function() {
	var success = function(){
		ok(true, "You clicked a button!");
		start();
	};
	forge.internal.call('actionsheet.show', {
		text: "Press a button!",
		destructiveTitle: "Test!",
		cancelTitle: "Another test."
	}, function() {
		forge.internal.addEventListener('actionsheet.destructive', success);
		forge.internal.addEventListener('actionsheet.cancel', success);
	}, function(e){
		ok(false, e);
		start();
	});
});
