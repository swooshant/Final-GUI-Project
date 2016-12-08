		
		<link href="//cdn-images.mailchimp.com/embedcode/slim-10_7.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			#mc_embed_signup{
				text-align:center;
				margin:auto;
				font:14px Helvetica,Arial,sans-serif; 
			}
			#mc_embed_signup form {
				text-align:center;
				clear:both;
				display:inline-block;
				width: 33%;
			}
			/* Add your own MailChimp form style overrides in your site stylesheet or in this style block.
			   We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
		</style>
		<div id="footer">
			<div id="socialMedia">
				<h3> Stay Connected! </h3>	
				<!-- image taken from facebooks website -->
				<ul class="icons">
					<li><a class="fb" href="https://www.facebook.com"></a></li>
					<li><a class="twit" href="https://www.twitter.com"></a></li>
					<li><a class="goog" href="https://www.plus.google.com"></a></li>
				</ul>
				<!--<a href="http://facebook.com">
				<img class="socialm" src="<?= BASE_URL ?>/public/img/facebook.png" alt="facebook icon">
				<h5 class="social"> Like BottleUp On Facebook! </h5>
				</a>-->
				<!-- image taken from twitters website -->
				<!--<a href="http://twitter.com">
				<img class="socialm" src="<?= BASE_URL ?>/public/img/twitter.png" alt="twitter icon">
				<h5 class="social"> Follow BottleUp On Twitter! </h5>
				</a>-->
			</div>
			<div id="contact">
				<h3> Email Us </h3>

				<br><br>
				<a href="mailto:someone@example.com?Subject=Wine%20Questions" target="_top" style="color:white">bottleUp@vt.edu </a><br> <br>
				<a href="<?=BASE_URL?>/" style="text-decoration: none; color:white">
				<p style="font-family:Lato; font-size:25px;display:inline"><i><b>BottleUp</b></i></p>
				<img class="footerlogo" src="<?= BASE_URL ?>/public/img/wine.png" alt="Logo" />
				</a>
				<!--Phone: 111-111-1111  <br> <br>
				Location: 1234 Random Street, RandomCity, CA 90210 -->
			</div>
			<div id="newsletter">
				<h3> Sign Up For The NewsLetter </h3>
				<!-- Begin MailChimp Signup Form -->
				<div id="mc_embed_signup">
				<form action="//amazonaws.us14.list-manage.com/subscribe/post?u=db926b27028396aa637bcce32&amp;id=e3de786a1d" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
				    <div id="mc_embed_signup_scroll">
					<input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email address" required>
				    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
				    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_db926b27028396aa637bcce32_e3de786a1d" tabindex="-1" value=""></div>
				    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
				    </div>
				</form>
				</div>
				<!--End mc_embed_signup-->

				<!--<form action="<?= BASE_URL ?>/processNewsLetter/" method="POST">
					<input type="text" class="news inputForm name" name="name" placeholder="Name: ">
					<br>
	  				<input type="email" class="news inputForm email" name="email" placeholder="Email: "> 
	  				<br>
	  				<input type = "submit" name="newsSubmit" value="Submit" class="submit">
				</form>-->

			</div>
		</div>
		<h4 id="copyright"> &copy; BottleUp 2016 </h4>
	</body>
</html>