<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/login.js"></script>
<div id="login-box" class="login-box visible widget-box no-border">
	<?php 
			if ( !empty($this->error) ){
				echo '<div style="position: absolute; top: 0; "><div style="display: inline-block; width: 100%; margin-top: 23px;" class="alert alert-error">
										<button onClick="removeMsgError()" type="button" class="close" data-dismiss="alert">
											<i class="icon-remove"></i>
										</button>

										<strong>
											<i class="icon-remove"></i>
											Error!
										</strong>
										'.htmlentities($this->error).'
										<br>
									</div></div>';
			}
		?>
	<div class="widget-body">
		
		
		<div class="widget-main">
			<h4 class="header blue lighter bigger">
				<i class="icon-coffee green"></i>
				Proporciones sus datos
			</h4>

			<div class="space-6"></div>

			<form method="POST" action="<?php echo $_PETICION->url_app.$_PETICION->modulo; ?>/usuarios/login" />
				<fieldset>
					<label>
						<span class="block input-icon input-icon-right">
							<input name="nick" type="text" class="span12" placeholder="Username" autofocus />
							<i class="icon-user"></i>
						</span>
					</label>

					<label>
						<span class="block input-icon input-icon-right">
							<input name="pass" type="password" class="span12" placeholder="Password" />
							<i class="icon-lock"></i>
						</span>
					</label>

					<div class="space"></div>

					<div class="clearfix">
						<label class="inline">
							<input type="checkbox" />
							<span class="lbl"> Recordarme</span>
						</label>

						<button  class="width-35 pull-right btn btn-small btn-primary">
							<i class="icon-key"></i>
							Entrar
						</button>
					</div>

					<div class="space-4"></div>
				</fieldset>
			</form>

			<div class="social-or-login center">
				<span class="bigger-110">O entrar usando</span>
			</div>

			<div class="social-login center">
				<a class="btn btn-primary">
					<i class="icon-facebook"></i>
				</a>

				<a class="btn btn-info">
					<i class="icon-twitter"></i>
				</a>

				<a class="btn btn-danger">
					<i class="icon-google-plus"></i>
				</a>
			</div>
		</div><!--/widget-main-->

		<div class="toolbar clearfix">
			<div>
				<a href="<?php echo $_PETICION->url_web; ?>#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
					<i class="icon-arrow-left"></i>
					Olvide mi contraseña
				</a>
			</div>

			<div>
				<a href="<?php echo $_PETICION->url_web; ?>#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
					Registrarme
					<i class="icon-arrow-right"></i>
				</a>
			</div>
		</div>
	</div><!--/widget-body-->
	
</div><!--/login-box-->






