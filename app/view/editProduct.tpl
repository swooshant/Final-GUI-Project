<div id="bodyWrapper">

	<h2>Edit Product</h2>

	<form id="edit-product" action="<?= BASE_URL ?>/products/edit/<?= $id ?>/process" method="POST">
		<label>Wine Title:<br> <input type="text" name="WineTitle" value="<?= $product->get('WineTitle') ?>"></label>
		<br><br>
		<label>ShortDesc:<br> <textarea name="ShortDesc"><?= $product->get('ShortDesc') ?></textarea></label>
		<br><br>
		<label>LongDesc:<br> <textarea name="LongDesc"><?= $product->get('LongDesc') ?></textarea></label>
		<br><br>
		<label>Volumes:<br> <input type="text" name="Volumes" value="<?= $product->get('Volumes') ?>"></label>
		<br><br>
		<label>Price ($):<br> <input type="text" name="Price" value="<?= $product->get('Price') ?>"></label>
		<br><br>
		<label>Rating:<br> <input type="text" name="Rating" value="<?= $product->get('Rating') ?>"></label>
		<br><br>
		<label>Image URL:<br> <input type="text" name="Img_Url" value="<?= $product->get('Img_Url') ?>"></label><br><br>
		<?php if ($product->get('red') == 1) {
				echo '<label>Wine Type:<br><input type="radio" name="wineType" value="red" checked="checked">Red
				<input type="radio" name="wineType" value="white>">White<br><br></label>
				<!-- <input type="submit" class="submit" id="saveEdits" name="submit" value="Save Changes"> -->';
			}
			else if ($product->get('white') == 1) {
				echo '<label>Wine Type:<br><input type="radio" name="wineType" value="red">Red
				<input type="radio" name="wineType" value="white" checked="checked">White<br><br></label>
				<!-- <input type="submit" class="submit" id="saveEdits" name="submit" value="Save Changes"> -->';
			}
		?>

		<?php if ($product->get('Location') == 'Napa Valley') {
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
			else if ($product->get('Location') == 'Mendoza') {
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
			else if ($product->get('Location') == 'Bordeaux') {
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
			else if ($product->get('Location') == 'Tuscany') {
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
			else if ($product->get('Location') == 'La Rioja Region') {
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
			else if ($product->get('Location') == 'Yamanashi Prefecture') {
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
			else if ($product->get('Location') == 'Barossa Valley') {
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
		?>

		<br>
		<input type="submit" class="submit" id="saveEdits" name="submit" value="Save Changes">

		<br><br>
		<!-- <input type="submit" class="submit" id="saveEdits" name="submit" value="Save Changes"> -->

	</form>

</div>
