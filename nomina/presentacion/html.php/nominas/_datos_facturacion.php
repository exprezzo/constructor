<div class="inputBox contenedor_fk_forma_pago" style=""  >
		<label style="">Forma de Pago:</label>
		<select name="fk_forma_pago" class="entradaDatos" style="width:250px;">
			<?php
				foreach($this->fk_forma_pago_listado as $forma_de_pago){
					echo '<option value="'.$forma_de_pago['id'].' " >'.$forma_de_pago['nombre'].'</option>';
				}
			?>
		</select>
	</div>
	<div class="inputBox contenedor_fk_certificado" style=""  >
		<label style="">Certificado:</label>
		<select name="fk_certificado" class="entradaDatos" style="width:250px;">
			<?php
				foreach($this->fk_certificado_listado as $certificado){
					echo '<option value="'.$certificado['id'].' " >'.$certificado['no_serie'].'</option>';
				}
			?>
		</select>
	</div>
	<div class="inputBox contenedor_condiciones_de_pago" style=""  >
		<label style="">Condiciones De Pago:</label>
		<input title="Condiciones De Pago" type="text" name="condiciones_de_pago" class="entradaDatos" value="<?php echo $this->datos['condiciones_de_pago']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_subTotal" style=""  >
		<label style="">Subtotal:</label>
		<input title="Subtotal" type="text" name="subTotal" class="entradaDatos" value="<?php echo $this->datos['subTotal']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_descuento" style=""  >
		<label style="">Descuento:</label>
		<input title="Descuento" type="text" name="descuento" class="entradaDatos" value="<?php echo $this->datos['descuento']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_motivo_descuento" style=""  >
		<label style="">Motivo de descuento:</label>
		<input title="Motivo de descuento" type="text" name="motivo_descuento" class="entradaDatos" value="<?php echo $this->datos['motivo_descuento']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_tipo_cambio" style=""  >
		<label style="">Tipo de Cambio:</label>
		<input title="Tipo de Cambio" type="text" name="tipo_cambio" class="entradaDatos" value="<?php echo $this->datos['tipo_cambio']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_fk_moneda" style=""  >
		<label style="">Moneda:</label>
		<select name="fk_moneda" class="entradaDatos" style="width:250px;">
			<?php
				foreach($this->fk_moneda_listado as $moneda){
					echo '<option value="'.$moneda['id'].' " >'.$moneda['moneda'].'</option>';
				}
			?>
		</select>
	</div>
	<div class="inputBox contenedor_total" style=""  >
		<label style="">Total:</label>
		<input title="Total" type="text" name="total" class="entradaDatos" value="<?php echo $this->datos['total']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_tipo_comprobante" style="display:none;"  >
		<label style="">Tipo De Comprobante:</label>
		<input title="Tipo De Comprobante" type="text" name="tipo_comprobante" class="entradaDatos" value="<?php echo $this->datos['tipo_comprobante']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_fk_metodo_pago" style=""  >
		<label style="">M&eacute;todo de Pago:</label>
		<select name="fk_metodo_pago" class="entradaDatos" style="width:250px;">
			<?php
				foreach($this->fk_metodo_pago_listado as $metodo_de_pago){
					echo '<option value="'.$metodo_de_pago['id'].' " >'.$metodo_de_pago['nombre'].'</option>';
				}
			?>
		</select>
	</div>
	<div class="inputBox contenedor_num_cta_pago" style=""  >
		<label style="">Num Cta Pago:</label>
		<input title="Ultimos 4 digitos de la cuenta" type="text" name="num_cta_pago" class="entradaDatos" value="<?php echo $this->datos['num_cta_pago']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_totImpRet" style=""  >
		<label style="">Tot Imp Ret:</label>
		<input title="Total de Impuestos Retenidos" type="text" name="totImpRet" class="entradaDatos" value="<?php echo $this->datos['totImpRet']; ?>" style="width:500px;" />
	</div>
	<div class="inputBox contenedor_totImpTras" style=""  >
		<label style="">Tot Imp Tras:</label>
		<input title="Total de Impuestos Trasladados" type="text" name="totImpTras" class="entradaDatos" value="<?php echo $this->datos['totImpTras']; ?>" style="width:500px;" />
	</div>
	<div class="tabla contenedor_tabla_conceptos" style="position: relative; margin-top: 26px;"  >
		
		<h1 class="tituloTabla" >Conceptos</h1>
		<div class="toolbar_detalles" style="">
			<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
			<input type="button" value="" class="btnEliminar" id="botonEliminar" />
		</div>
		<table class="tabla_conceptos">
			<thead></thead>
			<tbody></tbody>
		</table>
		<div id="<?php echo $id; ?>-dialog-confirm-eliminar-concepto_de_nomina" title="&iquest;Eliminar Concepto_de_nomina?">
			<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Concepto_de_nomina?</p>
		</div> 
	</div>
	<div class="tabla contenedor_tabla_impuestos" style="position: relative; margin-top: 26px;"  >
		
		<h1 class="tituloTabla" >Impuestos</h1>
		<div class="toolbar_detalles" style="">
			<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
			<input type="button" value="" class="btnEliminar" id="botonEliminar" />
		</div>
		<table class="tabla_impuestos">
			<thead></thead>
			<tbody></tbody>
		</table>
		<div id="<?php echo $id; ?>-dialog-confirm-eliminar-impuesto_de_nomina" title="&iquest;Eliminar Impuesto_de_nomina?">
			<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Impuesto_de_nomina?</p>
		</div> 
	</div>