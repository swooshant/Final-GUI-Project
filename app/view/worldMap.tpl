<div id="bodyWrapper" class = "bodyMap">
	<script src="//cdnjs.cloudflare.com/ajax/libs/d3/3.5.3/d3.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/topojson/1.6.9/topojson.min.js"></script>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/datamaps.world.hires.js"></script> <!-- high res world map -->

  	<h2 class="aboutUsHeadings" > Wine Regions </h2>

	<div id="mapContainer" style="position: relative; width: 1000px; height: 500px;"></div>
	<br><br>
	<div id="mapProduct" style="display:none">
		<form action="" method="POST" >
				<a href="">
				<img class="product-image" src="" alt="" style="width:166px;height:10%"/>
				<h3></h3>
				</a>
				<p class="shortdesc"></p>
				<p class="price"></p>

				<div class ="edit_delete_buttons" style="display:none">
				<button class="submit" name="delete" onclick="return confirm('Are you sure you want to delete this item?');" value="deletePressed">Delete</button>
				</div>				
		</form>

		<div class ="edit_delete_buttons" style="display:none">
			<button class="submit" id ="mapEditPress" name="edit" value="editPressed" >Edit</button>
		</div>		
	</div>


	<div id="mapAddProduct" style="display:none">

		<?php if(isset($_SESSION['userID'])): ?>
		<div id="bodyWrapper">

			<h2>Add products</h2>

			<form id="edit-product" action="<?= BASE_URL ?>/products/addItem/process" method="POST">

				<label>Wine Title: <br> <input type="text" name="WineTitle" ></label>
				<br><br><br>
				<label>ShortDesc: <br> <textarea name="ShortDesc"></textarea></label>
				<br><br><br>
				<label>LongDesc: <br><textarea name="LongDesc"></textarea></label>
				<br><br><br>
				<label>Volumes: <br><input type="text" name="Volumes" ></label>
				<br><br><br>
				<label>Price ($): <br><input type="text" name="Price" ></label>
				<br><br><br>
				<label>Rating:<br> <input type="text" name="Rating" ></label>
				<br><br><br>
				<label>Image URL: <br><input type="text" name="Img_Url"></label>
				<br><br><br>
				<label>Wine Type: <br>
				<input type="radio" name="wineType" value="red" checked="checked">Red
				<input type="radio" name="wineType" value="white">White
				</label><br><br>
				<label>Location:<br>
				<select name="Location">
					<option value="Napa Valley" selected>Napa Valley</option>
					<option value="Mendoza" >Mendoza</option>
					<option value="Bordeaux" >Bordeaux</option>
					<option value="Tuscany" >Tuscany</option>
					<option value="La Rioja Region" >La Rioja Region</option>
					<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
					<option value="Barossa Valley">Barossa Valley</option>
				</select></label><br> 

				<br>
				<input type="submit" class="submit" id="addProduct" name="submit" value="Save Changes">

			</form>
		
		<?php else: ?>

	  		<h3> Must be logged in! </h3>

		<?php endif; ?>

		</div>

	</div>

	<div id="mapEditProduct" style="display:none">
		<!-- <div id="bodyWrapper"> -->
		<p id="hiddenInfo" style="display:none"></p>
			<h2>Edit Product</h2>

			<form id="edit-product" action="<?= BASE_URL ?>/products/edit/3/process" method="POST">
				<label>Wine Title:<br> <input type="text" name="WineTitle" value="test"></label>
				<br><br>
				<label>ShortDesc:<br> <textarea name="ShortDesc"> </textarea></label>
				<br><br>
				<label>LongDesc:<br> <textarea name="LongDesc"> </textarea></label>
				<br><br>
				<label>Volumes:<br> <input type="text" name="Volumes" value="test"></label>
				<br><br>
				<label>Price ($):<br> <input type="text" name="Price" value="test"></label>
				<br><br>
				<label>Rating:<br> <input type="text" name="Rating" value="test"></label>
				<br><br>
				<label>Image URL:<br> <input type="text" name="Img_Url" value="test"></label><br><br>
				
				<br>
				<input type="submit" class="submit" id="saveEdits" name="submit" value="Save Changes">

				<br><br>
				<div id="wineType">
				</div>
			</form>

		<!-- </div> -->

	</div>


	<script>
	var colors = d3.scale.category10();
	    	var map = new Datamap({
	    		element: document.getElementById('mapContainer'),
        		geographyConfig: {
            		highlightOnHover: true,
            		popupOnHover: false
        		},
        		bubblesConfig: {
        			exitDelay: 2000
        		},
        		fills: {
				    defaultFill: "#ABDDA4",
				    gt50: colors(Math.random() * 20),
				    eq50: colors(Math.random() * 20),
				    lt25: colors(Math.random() * 10),
				    gt75: colors(Math.random() * 200),
				    lt50: colors(Math.random() * 20),
				    eq0: colors(Math.random() * 1),
				    pink: '#0fa0fa',
				    gt500: colors(Math.random() * 1)
				  
			},
		    	data: {
			      'ARG': {fillKey: 'pink'},
			      'JPN': {fillKey: 'gt500'},
			      'ITA': {fillKey: 'lt50'},
			      'ESP': {fillKey: 'gt75'},
			      'FRA': {fillKey: 'eq50'},
			      'AUS': {fillKey: 'lt25'},
			      'USA': {fillKey: 'gt50'}
		   	}
	  	});

		var wineRegions = [
		{
		        name: 'Napa Valley',
		        radius: 15,
		        country: 'USA',
		        fillKey: 'gt50',
		        significance: 'Napa Valley, the most legendary wine country in the United States, offers internationally-acclaimed wine tasting, winemakers and wineries.',
		        latitude: 38.5025,
		        longitude: -122.2654
		},
		{
		        name: 'Tuscany',
		        radius: 10,
		        country: 'ITA',
		        fillKey: 'lt50',
		        significance: ' Located in central Italy along the Tyrrhenian coast, Tuscany is home to some of the world’s most notable wine regions.',
		        latitude: 43.7711,
		        longitude: 11.2486
		},
		{
		        name: 'Bordeaux',
		        radius: 10,
		        country: 'FRA',
		        fillKey: 'eq50',
		        significance: 'Bordeaux, hub of the famed wine-growing region, is a port city on the Garonne River in southwestern France.',
		        latitude: 44.8378,
		        longitude: -0.5792
		},
		{
		        name: 'La Rioja Region',
		        radius: 10,
		        country: 'ESP',
		        fillKey: 'gt75',
		        significance: 'La Rioja is a province and autonomous community in northern Spain with a renowned local wine industry.',
		        latitude: 42.2871,
		        longitude: -2.5396
		},
		{
		        name: 'Mendoza',
		        radius: 15,
		        country: 'ARG',
		        fillKey: 'pink',
		        significance: 'Mendoza is a city in Argentina’s Cuyo region and the heart of Argentina’s wine country, famed for Malbecs and other red wines.',
		        latitude: -32.8895,
		        longitude: -68.8458
		},
		{
		        name: 'Barossa Valley',
		        radius: 15,
		        country: 'AUS',
		        fillKey: 'lt25',
		        significance: 'The Barossa Valley is a renowned wine-producing region northeast of Adelaide, in South Australia.',
		        latitude: -34.5333,
		        longitude: 138.9500
		},
		{
		        name: 'Yamanashi Prefecture',
		        radius: 15,
		        country: 'JPN',
		        fillKey: 'gt500',
		        significance: 'The main production region of wine in Japan is the Yamagata Prefecture, which accounts for 40% of domestic volume',
		        latitude: 35.6642,
		        longitude: 138.5684
		}];

		var productData;

		function getMap() {
			
			$.get(
				baseURL+'/products/wineMap/',
				function(data) {
					productData = data;
					console.log(data[0]);
			      },
		    			'json'
		    	);
		}

		function getProductLinks(location)
		{
			var result = '';
			for (var i in productData) {
				var loc = productData[i].location;
				if (loc == location)
				{
					var name = productData[i].name;
					var productID = productData[i].id;
					var creatorID = productData[i].creatorID;
					var imgURL = productData[i].imgURL;
					var shortDesc = productData[i].shortDesc;			
					shortDesc = shortDesc.replace(/'/g, "&#39;");
					var price = productData[i].price;
					var longDesc = productData[i].longDesc;
					longDesc = longDesc.replace(/'/g, "&#39;");
					var volumes = productData[i].volumes;
					var rating = productData[i].rating;
					var wine = productData[i].red;

					result += "<button class='showProduct' name='" + creatorID + "' value='" + name + "/" +  imgURL + "/" + shortDesc + "/" + price +"/" + productID + "/" + longDesc + "/" + volumes + "/" + rating + "/" + wine + "/' id='product" + productID + "'>" + name + "</button> ";
				}

			}
			return result;
		}

		// function loadWineType(wineType)
		// {
		// 	if (wineType == 1)
		// 	{
		// 		return "<p>hello</p>";//"<label>Wine Type:<br><input type=\"radio\" name=\"wineType\" value=\"red\" checked=\"checked\">Red
		// 		//<input type=\"radio\" name=\"wineType\" value=\"white\">White<br><br></label>";
		// 	}
		// 	else {
		// 		return "<p>bye</p>";//'<label>Wine Type:<br><input type="radio" name="wineType" value="red">Red
		// 		//<input type="radio" name="wineType" value="white" checked="checked">White<br><br></label>';
		// 	}
		// }
		
		getMap();

		//draw bubbles for wine regions
		map.bubbles(wineRegions, {
		    popupTemplate: function (geo, data) {
		    	     var products = getProductLinks(data.name);
		    	      $('#mapAddProduct select').val(data.name);
		            return ['<div class="hoverinfo">' +  data.name,
		            '<br/>Country: ' +  data.country + '',
		            '<br/>Signifance: ' + data.significance + '',
		            '<br/>Products: ' + products + '',
		     //       '<br/><form action="<?=BASE_URL?>/addItem/' + data.country + '"><button class="submit">Add Wine to ' + data.name + '</button></form>' + '',
				 '<br/><button id="mapAddButton" class="submit">Add Wine to ' + data.name + '</button>' + '',
		            '</div>'].join('');
		    }
		});

		$(document).on("click",".datamaps-bubble", function() {
			 var bubbleInfo = $(this).attr('data-info');
			 var data = JSON.parse(bubbleInfo);
			 var clickedBubbleName = data['name'];
			 var products = getProductLinks(clickedBubbleName);
			 //console.log(products);
		});

		$(document).on("click", ".showProduct", function() {
			$(this).submit();
			var productID = $(this).attr('id');
			var productValues = $(this).attr('value').split("/");
			var creatorID = $(this).attr('name');
			var productName = productValues[0];
			var imgURL = productValues[1];
			var shortDesc = productValues[2];
			var price = productValues[3];

			var productIDNew = productID.slice(7);

			//set information in editproduct div too
			$("#mapEditProduct p#hiddenInfo").text($(this).attr('value'));

			var productDiv = $("#mapProduct");
			productDiv.css('display', 'block');
			$("#mapProduct form h3").text(productName);
			$("#mapProduct form img").attr("src", "<?= BASE_URL ?>/public/img/"+imgURL);
			$("#mapProduct form a").attr("href", "<?= BASE_URL ?>/products/view/"+productIDNew);
			$("#mapProduct form p.shortdesc").text(shortDesc);
			$("#mapProduct form p.price").text(price);

			$("#mapProduct form").attr("action", "<?= BASE_URL ?>/products/processEditDel/"+productIDNew);

			<?php if (isset($_SESSION)): ?>

				if(creatorID == '<?= $_SESSION["userID"] ?>') {
					$(".edit_delete_buttons").css("display", "block");
				}

				<?php if(isset($_SESSION['admin']) && $_SESSION['admin'] == 1): ?>
					$(".edit_delete_buttons").css("display", "block");
				<?php endif; ?>
			<?php endif; ?>
			return true;
		});

		$(document).on("click", "#mapAddButton", function() { 
			$("#mapAddProduct").css("display", "block");
			$("#mapProduct").css("display", "none");
			$("#mapEditProduct").css("display", "none");
		});

		$(document).on("click", ".showProduct", function() { 
			$("#mapAddProduct").css("display", "none");
			$("#mapEditProduct").css("display", "none");

			var creatorID = $(this).attr('name');

			<?php if (isset($_SESSION)): ?>

				if(creatorID == '<?= $_SESSION["userID"] ?>') {
					$(".edit_delete_buttons").css("display", "block");
				} else {
					$(".edit_delete_buttons").css("display", "none");
				}

				<?php if(isset($_SESSION['admin']) && $_SESSION['admin'] == 1): ?>
					$(".edit_delete_buttons").css("display", "block");
				<?php endif; ?>
			<?php endif; ?>

		});


		$(document).on("click", "#mapEditPress", function() { 
			$("#mapEditProduct").css("display", "block");
			$("#mapProduct").css("display", "none");
			$("#mapAddProduct").css("display", "none");

			//get product information
			var productValues = $("#mapEditProduct p#hiddenInfo").text().split("/");
			var creatorID = $(this).attr('name');
			var productName = productValues[0];
			var imgURL = productValues[1];
			var shortDesc = productValues[2];
			var price = productValues[3];
			var productID = productValues[4];
			var longDesc = productValues[5];
			var volumes = productValues[6];
			var rating = productValues[7];
			var wine = productValues[8];
			console.log(volumes);

			//fill in edit product fields
			$("#mapEditProduct form").attr("action", "<?= BASE_URL ?>/products/edit/"+ productID + "/process");
			$("#mapEditProduct form label input[name='WineTitle'").attr("value", productName);
			$("#mapEditProduct form label textarea[name='ShortDesc'").text(shortDesc);
			$("#mapEditProduct form label input[name='Price'").attr("value", price);
			$("#mapEditProduct form label input[name='Img_Url'").attr("value", imgURL);
			$("#mapEditProduct form label textarea[name='LongDesc'").text(longDesc);
			$("#mapEditProduct form label input[name='Volumes'").attr("value", volumes);
			$("#mapEditProduct form label input[name='Rating'").attr("value", rating);

			// var wineTypeHTML = loadWineType(wine);
			// $("#mapEditProduct div#wineType").innerHTML(wineTypeHTML);
		});

	</script>
	<br>
</div>