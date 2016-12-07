$(document).ready(function(){
// Get the modal
var modal = document.getElementById('myModal');

if (modal) {
	modal.style.display = "block";

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];


// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
  // var dataJSON = {age: "true"};
  var dataJSON = {
		'age': 'true'
	};

  $.ajax(
	{				
		
		url: baseURL+"/age/",
		type: "POST",
		data: dataJSON,
		success: function(result) {
			console.log(result);
			//updateTheCart(); //update the layout of the cart asynchronously
		},
		error: function(xhr, status, error) {
			//var err = eval("(" + xhr.responseText + ")");
			alert('error when posting to session.');
		}
	});
	};
}
// When the user clicks anywhere outside of the modal, close it
// window.onclick = function(event) {
//     if (event.target == modal) {
//         modal.style.display = "none";
//     }
// }

});