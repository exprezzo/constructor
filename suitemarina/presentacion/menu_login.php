<ul class="nav nav-list">
	
	<li class="active open">
		<a href="#" class="dropdown-toggle">
			<i class="icon-file-alt"></i>

			<span class="menu-text">
				Opciones
				<span class="badge badge-primary ">4</span>
			</span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li class="active">
				<a href="error-404.html">
					<i class="icon-double-angle-right"></i>
					Iniciar
				</a>
			</li>

			<li>
				<a href="<?php echo $_PETICION->url_app.$_PETICION->modulo.'/usuarios/nuevo'; ; ?>">
					<i class="icon-double-angle-right"></i>
					Registrarse
				</a>
			</li>
		</ul>
	</li>
</ul>