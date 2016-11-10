<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">FreePark</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">

				<li class="dropdown"><a id="drop1" href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown">Administraci&oacute;n
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li role="presentation"><a role="menuitem" href='<c:url value="/backend/usuarios/" />'>Usuarios</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" href='<c:url value="/backend/playas/" />'>Playas</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" href='<c:url value="/backend/vehiculos/" />'>Veh&iacute;culos</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" href='<c:url value="/backend/reservas/" />'>Reservas</a></li>
					</ul></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>
