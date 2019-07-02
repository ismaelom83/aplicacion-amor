<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>XSLT 05 Ismael Heras Salvador</title>
				<link rel="shortcut icon" type="imagen/png"  href ="../../../favicon.ico/favicon.png"/>
				<link rel="stylesheet" type="text/css" href="estilos.css"/>
			</head>
			<body>
				<div class="encabezado">
					<h1>Practica xslt 05</h1>
					<h2>Informacion de garajes</h2>
				</div>
				<xsl:for-each select="garaje/coches/coche">

					<table border="1">
						<tr class="th">
							<th>matricula</th>
							<th>reparaciones</th>
						</tr>
						<tr>
							<td class="matricula">
								<xsl:value-of select="matricula"/>
							</td>
							<td>
								<xsl:apply-templates select="//reparacion[matricula=current()/matricula]"/>	
								<xsl:value-of select="concat('Numero de reparaciones: ', count(//reparacion[matricula=current()/matricula]/matricula))"/>
                                <br></br>								
								<xsl:value-of select="concat('Total  de horas: ', sum(//reparacion[matricula=current()/matricula]/horas))"/>
								<br></br>
								<xsl:value-of select="concat('Total  de horas: ', sum(//reparacion[matricula=current()/matricula]/horas)*12)"/>
							</td>
						</tr>
					</table>
				</xsl:for-each>	
			</body>
		</html>
	</xsl:template>

	<xsl:template match="//reparacion[matricula=current()/matricula]">
		<xsl:value-of select="@codigo"/>
		<ul>
			<li>
				<xsl:value-of select="descripcion" />
			</li>
			<li>
				<xsl:value-of select="fecha_entrada" />
			</li>
			<li>
				<xsl:value-of select="fecha_salida" />
			</li>
			<li>
				<xsl:value-of select="horas" />
			</li>			
		</ul>
	</xsl:template>
</xsl:stylesheet>






