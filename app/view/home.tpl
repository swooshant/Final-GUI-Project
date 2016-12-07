	<div id="bodyWrapper">

		<?php session_start(); if($_SESSION['is21'] == "false"): ?>
			<div id="myModal" class="modal">
				<div class="modal-content">
				  <div class="modal-header">
				    
				    <h2>BottleUp</h2>
				  </div>
				  <div class="modal-body">
				    <p>Are you 21 or older?</p><br>
				    <p>As a retailer of wine, we require all shoppers to be at least 21 years of age.</p><br>
				    <span class="close" name="ageSomething" value="true">Yes</span>
				    <span><a style="text-decoration: none; color: black;" href="http://www.welchs.com/">No</a></span>
				  </div>
				  <div class="modal-footer">
				  	<p class="mf-text">You must be of legal drinking age to enter and use this site. To find out more about responsible consumption, visit the Foundation for Advancing Alcohol Responsibility and www.responsibility.org.</p>
				  </div>
				</div>
			</div>
		<?php endif; ?>

		<script type="text/javascript" src="<?= BASE_URL ?>/public/js/modal.js"></script>

		<!--<div class="headerpic">

	 	 source: http://www.vgulp.com/blog/2015-03-29/Top-Wine-Grape-Varieties/#.V-jgzygrJ4c

	 		<img src="<?= BASE_URL ?>/public/img/grapeheader.jpg" alt="Grapes header picture"/>
	 		<p>	
				Welcome to BottleUp, a site meant for the most experienced individuals in wine and the beginner. In a world where there millions of different selections, it can become overwhelming to find something you like. We aim to help you in this process by providing a clear layout and concise information that will aid in your final decision. We also have our own brand of wine which we grow and bottle at our company owned vineyards. Every wine bottle comes with a very detailed description on it's product page. There are also reviews from previous buyers that can help give a real world experience of the wine. 
			</p>
				
		</div>-->
		<!-- image found from http://marcuswhitmanhotel.com/staff-picks/wine-your-way-through-walla-walla-->
		<div id="parallaxDiv" class="parallax">
		<!--<div id="vineyards">
			<img class="Vineyard-image" src="<?= BASE_URL ?>/public/img/vin1.jpg" id="vineImag"	alt="First vineyard operated by BottleUp. Located in Napa Valley" />			
		</div>-->
		</div>

		<div id="buttonBar">
			<input type="submit" value="About" class="submit vinBut" id="vin1button"/>
			<input type="submit" value="Napa Valley" class="submit vinBut" id="vin2button"/>
			<input type="submit" value="Napa Vineyard" class="submit vinBut" id="vin3button"/>
			<input type="submit" value="Virginia" class="submit vinBut" id="vin4button"/>
		</div>
		 
		 <h3 id="topRated"> Top Rated Wines! </h3>
		 <div class="browseContent" id="homepageBrowser">
		 	<?php while($row = mysql_fetch_assoc($result)): ?>
					<!-- All descriptions, wine names and images are from TotalWine.com -->
					<div class="product">
					<form action="<?= BASE_URL ?>/products/processEditDel/<?= $row['id'] ?>" method="POST" >
						<a href="<?= BASE_URL ?>/products/view/<?= $row['id'] ?>">
							<img class="product-image" src="<?= BASE_URL ?>/public/img/<?= $row['Img_Url'] ?>" alt="<?= $row['WineTitle'] ?>" />
							<h3><?= $row['WineTitle'] ?></h3>
						</a>
					<!--	<button class="submit" type="button" value="cartPressed" onclick="<?php $this->addToCart ?>"> Add to Cart</button> -->
						<p><?= $row['ShortDesc'] ?></p>
						<p class="price"><?= $row['Price'] ?></p>
						<?php if(isset($_SESSION['admin']) && $_SESSION['admin'] == 1): ?>
							<button class="submit" name="edit" value="editPressed" >Edit</button>
							<button class="submit" name="delete" onclick="return confirm('Are you sure you want to delete this item?');" value="deletePressed">Delete</button>
						<?php elseif(isset($_SESSION['elite']) && $_SESSION['elite'] == 1 && ($_SESSION['userID'] == $row['Creator_Id'])): ?>							
							<button class="submit" name="edit" value="editPressed" >Edit</button>
							<button class="submit" name="delete" onclick="return confirm('Are you sure you want to delete this item?');" value="deletePressed">Delete</button>
						<?php endif; ?>
					</form>
					</div>
				
			<?php endwhile; ?>	
		</div>
		</div>
		
		<?php if(isset($_SESSION['userID'])): ?>

			<h2 class="aboutUsHeadings" > Activity Feed </h2> 

			<?php if(count($events) == 0): ?>
				<p>No recent activity.</p>
			<?php else: ?>

			<ul>
				<?php foreach($events as $event): ?>
						<?php if ($event != null): ?>
			    			<li style="list-style: none; color:blue; font-weight: bold;" ><?= formatEvent($event) ?></li>
			    		<?php endif; ?>
			  	<?php endforeach; ?>
			</ul>

			<?php endif; ?>
		
		<?php endif; ?>
	
