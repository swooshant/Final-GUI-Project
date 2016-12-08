<div id="bodyWrapper" class = "bodyMap">
	<script src="//cdnjs.cloudflare.com/ajax/libs/d3/3.5.3/d3.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/topojson/1.6.9/topojson.min.js"></script>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/datamaps.world.hires.js"></script> <!-- high res world map -->

  	<h2 class="aboutUsHeadings" > Wine Regions </h2>

	<div id="mapContainer" style="position: relative; width: 1000px; height: 500px;"></div>
	<div id="mapProduct" style="display:none">
		<h3>Title</h3>
		
		<div id="edit_delete_buttons" style="display:none">
			<button class="submit" name="edit" value="editPressed" >Edit</button>
			<button class="submit" name="delete" onclick="return confirm('Are you sure you want to delete this item?');" value="deletePressed">Delete</button>
		</div>
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
					result += "<button class='showProduct' name='" + creatorID + "' value='" + name + "' id='product" + productID + "'>" + name + "</button> ";
				}

			}
			return result;
		}
		
		getMap();

		//draw bubbles for wine regions
		map.bubbles(wineRegions, {
		    popupTemplate: function (geo, data) {
		    	     var products = getProductLinks(data.name);
		            return ['<div class="hoverinfo">' +  data.name,
		            '<br/>Country: ' +  data.country + '',
		            '<br/>Signifance: ' + data.significance + '',
		            '<br/>Products: ' + products + '',
		            '</div>'].join('');
		    }
		});

		$(document).on("click",".datamaps-bubble", function () {
			 var bubbleInfo = $(this).attr('data-info');
			 var data = JSON.parse(bubbleInfo);
			 var clickedBubbleName = data['name'];
			 var products = getProductLinks(clickedBubbleName);
			 //console.log(products);
		});

		$(document).on("click", ".showProduct", function() {
			var productID = $(this).attr('id');
			var productName = $(this).attr('value');
			var creatorID = $(this).attr('name');
			console.log(productID);
			var productDiv = $("#mapProduct");
			productDiv.css('display', 'block');
			$("#mapProduct h3").text(productName);
			<?php if(isset($_SESSION['admin']) && $_SESSION['admin'] == 1): ?>
				$("#edit_delete_buttons").css("display", "block");
			<?php endif; ?>
		});

	</script>
	<br>
</div>