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
		<!-- <label>Location:<br>
		<select name="Location">
			<option value="Napa Valley" selected>Napa Valley</option>
			<option value="Mendoza" >Mendoza</option>
			<option value="Bordeaux" >Bordeaux</option>
			<option value="Tuscany" >Tuscany</option>
			<option value="La Rioja Region" >La Rioja Region</option>
			<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
			<option value="Barossa Valley">Barossa Valley</option>
		</select></label><br> -->



		<?php if ($country == 'USA') {
				echo '<label>Location:<br>
					<select name="Location">
						<option value="Napa Valley" selected>Napa Valley</option>
						<option value="Mendoza" >Mendoza</option>
						<option value="Bordeaux">Bordeaux</option>
						<option value="Tuscany">Tuscany</option>
						<option value="La Rioja Region">La Rioja Region</option>
						<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
						<option value="Barossa Valley">Barossa Valley</option>
					</select></label>';
			} 
			else if ($country == 'ARG') {
				echo '<label>Location:<br>
					<select name="Location">
						<option value="Napa Valley">Napa Valley</option>
						<option value="Mendoza" selected>Mendoza</option>
						<option value="Bordeaux" >Bordeaux</option>
						<option value="Tuscany">Tuscany</option>
						<option value="La Rioja Region">La Rioja Region</option>
						<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
						<option value="Barossa Valley">Barossa Valley</option>
					</select></label>';
			} 
			else if ($country == 'FRA') {
				echo '<label>Location:<br>
					<select name="Location">
						<option value="Napa Valley">Napa Valley</option>
						<option value="Mendoza" >Mendoza</option>
						<option value="Bordeaux" selected>Bordeaux</option>
						<option value="Tuscany">Tuscany</option>
						<option value="La Rioja Region">La Rioja Region</option>
						<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
						<option value="Barossa Valley">Barossa Valley</option>
					</select></label>';
			} 
			else if ($country == 'ITA') {
				echo '<label>Location:<br>
					<select name="Location">
						<option value="Napa Valley">Napa Valley</option>
						<option value="Mendoza" >Mendoza</option>
						<option value="Bordeaux" >Bordeaux</option>
						<option value="Tuscany" selected>Tuscany</option>
						<option value="La Rioja Region">La Rioja Region</option>
						<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
						<option value="Barossa Valley">Barossa Valley</option>
					</select></label>';
			} 
			else if ($country == 'ESP') {
				echo '<label>Location:<br>
					<select name="Location">
						<option value="Napa Valley">Napa Valley</option>
						<option value="Mendoza" >Mendoza</option>
						<option value="Bordeaux" >Bordeaux</option>
						<option value="Tuscany" >Tuscany</option>
						<option value="La Rioja Region" selected>La Rioja Region</option>
						<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
						<option value="Barossa Valley">Barossa Valley</option>
					</select></label>';
			} 
			else if ($country == 'JPN') {
				echo '<label>Location:<br>
					<select name="Location">
						<option value="Napa Valley">Napa Valley</option>
						<option value="Mendoza" >Mendoza</option>
						<option value="Bordeaux" >Bordeaux</option>
						<option value="Tuscany" >Tuscany</option>
						<option value="La Rioja Region" >La Rioja Region</option>
						<option value="Yamanashi Prefecture" selected>Yamanashi Prefecture</option>
						<option value="Barossa Valley">Barossa Valley</option>
					</select></label>';
			}
			else if ($country == 'AUS') {
				echo '<label>Location:<br>
					<select name="Location">
						<option value="Napa Valley">Napa Valley</option>
						<option value="Mendoza" >Mendoza</option>
						<option value="Bordeaux" >Bordeaux</option>
						<option value="Tuscany" >Tuscany</option>
						<option value="La Rioja Region" >La Rioja Region</option>
						<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
						<option value="Barossa Valley" selected>Barossa Valley</option>
					</select></label>';
			}
			else {
				echo '<label>Location:<br>
					<select name="Location">
						<option value="Napa Valley" selected>Napa Valley</option>
						<option value="Mendoza" >Mendoza</option>
						<option value="Bordeaux">Bordeaux</option>
						<option value="Tuscany">Tuscany</option>
						<option value="La Rioja Region">La Rioja Region</option>
						<option value="Yamanashi Prefecture">Yamanashi Prefecture</option>
						<option value="Barossa Valley">Barossa Valley</option>
					</select></label>';
			}
		?>

		<br>
		<input type="submit" class="submit" id="addProduct" name="submit" value="Save Changes">

	</form>
	<?php else: ?>

  	<h3> Must be logged in! </h3>

	<?php endif; ?>

</div>
