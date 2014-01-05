<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Login Page - Erp Admin</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="<?php echo $_PETICION->url_web; ?>assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<?php echo $_PETICION->url_web; ?>assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<?php echo $_PETICION->url_web; ?>assets/css/font-awesome.min.css" />
<script type="text/javascript" src="<?php echo $_PETICION->url_web; ?>js/jquery-1.8.3.js" ></script>	
		<!--[if IE 7]>
		  <link rel="stylesheet" href="<?php echo $_PETICION->url_web; ?>assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<!--fonts-->

		<link rel="stylesheet" href="<?php echo $_PETICION->url_web; ?>http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!--ace styles-->

		<link rel="stylesheet" href="<?php echo $_PETICION->url_web; ?>assets/css/ace.min.css" />
		<link rel="stylesheet" href="<?php echo $_PETICION->url_web; ?>assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="<?php echo $_PETICION->url_web; ?>assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<?php echo $_PETICION->url_web; ?>assets/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

	<body class="login-layout">
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="row-fluid">
					<div class="span12">
						<div class="login-container">
							<div class="row-fluid">
								<div class="center">
									<h1>
										<i class=" green" style="width: 32px; height: 35px; vertical-align:bottom; background-repeat:no-repeat; display: inline-block; background-image:url(<?php echo $_PETICION->url_web; ?>/imagenes/logo_coral.png) !important;" ></i>
										<span class="red">Coral</span>
										<span class="white">ERP</span>
									</h1>
									<h4 class="blue">&copy; Triples Soluciones Administrativas</h4>
								</div>
							</div>

							<div class="space-6"></div>

							<div class="row-fluid">
								<div class="position-relative">
									<?php $this->mostrar(); ?>
									
									<div id="forgot-box" class="forgot-box widget-box no-border">
										<div class="widget-body">
											<div class="widget-main">
												<h4 class="header red lighter bigger">
													<i class="icon-key"></i>
													Recuperar Contrase&ntilde;a
												</h4>

												<div class="space-6"></div>
												<p>
													Ingrese su email para recibir instrucciones
												</p>

												<form />
													<fieldset>
														<label>
															<span class="block input-icon input-icon-right">
																<input type="email" class="span12" placeholder="Email" />
																<i class="icon-envelope"></i>
															</span>
														</label>

														<div class="clearfix">
															<button onclick="return false;" class="width-35 pull-right btn btn-small btn-danger">
																<i class="icon-lightbulb"></i>
																Enviar!
															</button>
														</div>
													</fieldset>
												</form>
											</div><!--/widget-main-->

											<div class="toolbar center">
												<a href="<?php echo $_PETICION->url_web; ?>#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
													Volver al Login
													<i class="icon-arrow-right"></i>
												</a>
											</div>
										</div><!--/widget-body-->
									</div><!--/forgot-box-->

									<div id="signup-box" class="signup-box widget-box no-border">
										<div class="widget-body">
											<div class="widget-main">
												<h4 class="header green lighter bigger">
													<i class="icon-group blue"></i>
													Nuevo Usuario
												</h4>

												<div class="space-6"></div>
												<p> Ingrese sus datos: </p>

												<form />
													<fieldset>
														<label>
															<span class="block input-icon input-icon-right">
																<input type="email" class="span12" placeholder="Email" />
																<i class="icon-envelope"></i>
															</span>
														</label>

														<label>
															<span class="block input-icon input-icon-right">
																<input type="text" class="span12" placeholder="Username" />
																<i class="icon-user"></i>
															</span>
														</label>

														<label>
															<span class="block input-icon input-icon-right">
																<input type="password" class="span12" placeholder="Password" />
																<i class="icon-lock"></i>
															</span>
														</label>

														<label>
															<span class="block input-icon input-icon-right">
																<input type="password" class="span12" placeholder="Repeat password" />
																<i class="icon-retweet"></i>
															</span>
														</label>

														<label>
															<input type="checkbox" />
															<span class="lbl">
																Acepto
																<a href="<?php echo $_PETICION->url_web; ?>#">Licencia</a>
															</span>
														</label>

														<div class="space-24"></div>

														<div class="clearfix">
															<button type="reset" class="width-30 pull-left btn btn-small">
																<i class="icon-refresh"></i>
																Limpiar
															</button>

															<button onclick="return false;" class="width-65 pull-right btn btn-small btn-success">
																Registrarme
																<i class="icon-arrow-right icon-on-right"></i>
															</button>
														</div>
													</fieldset>
												</form>
											</div>

											<div class="toolbar center">
												<a href="<?php echo $_PETICION->url_web; ?>#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
													<i class="icon-arrow-left"></i>
													Volver al Login
												</a>
											</div>
										</div><!--/widget-body-->
									</div><!--/signup-box-->
									
								</div><!--/position-relative-->
								
							</div>
						</div>
					</div><!--/.span-->
				</div><!--/.row-fluid-->
			</div>
		</div><!--/.main-container-->

		<!--basic scripts-->

		<!--[if !IE]>-->

		<script src="<?php echo $_PETICION->url_web; ?>http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

		<!--<![endif]-->

		<!--[if IE]>
<script src="<?php echo $_PETICION->url_web; ?>http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<?php echo $_PETICION->url_web; ?>assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<!--ace scripts-->

		<script src="<?php echo $_PETICION->url_web; ?>assets/js/ace-elements.min.js"></script>
		<script src="<?php echo $_PETICION->url_web; ?>assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			function show_box(id) {
			 $('.widget-box.visible').removeClass('visible');
			 $('#'+id).addClass('visible');
			}
			
			function removeMsgError(){				
				$('.alert-error').remove();
			}
			
			
		</script>
		
	</body>
</html>
