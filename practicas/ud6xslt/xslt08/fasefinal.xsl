<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	<xsl:template match="eurocopa">
		<html>
			<head>
				<title>
					<xsl:value-of select="concat(@anyo,' Ismael Heras Salvador')"/>
				</title>
				<link rel="stylesheet" type="text/css" href="eurocopa.css"/>
				<link rel="shortcut icon" type="imagen/png"  href ="images/euro2016.ico"/>
			</head>
			<body>
				<nav>
					<div class="navegador">
						<img src="images/UEFA_Euro_2016_logo.png"/>
					</div>
				</nav>
				<h1>Fase Final-Fase Grupos</h1>
				<xsl:apply-templates select="fasefinal/grupo"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="grupo">
		<h2>
			<xsl:value-of select="concat('GRUPO ', @id)"/>
		</h2>
		<table border="1" cellspacing="1"  class="table">
			<tr>
				<td class="linea">Selecciones</td>
				<td class="linea">J</td>
				<td class="linea">G</td>
				<td class="linea">E</td>
				<td class="linea">P</td>
				<td class="linea">GF</td>
				<td class="linea">GC</td>
				<td class="linea">DG</td>
				<td class="linea">P</td>
			</tr>
			<xsl:apply-templates select="seleccion"/>
		</table>


	</xsl:template>
	<xsl:template match="seleccion">

		<tr>
			<td class="linea2">

				<img>
					<xsl:attribute name="src" >					
					<xsl:value-of select="concat('images/', current()/iniciales ,'.png')"/>
					</xsl:attribute>					
					<xsl:attribute name="alt">
						<xsl:variable name="ini" select="iniciales"/>
						<xsl:value-of select="document('paises.xml')/paises/pais/nombre[../iniciales=$ini]"/>
					</xsl:attribute>
				</img>
                        <xsl:variable name="ini" select="iniciales"/>
						<xsl:value-of select="document('paises.xml')/paises/pais/nombre[../iniciales=$ini]"/>				
			</td>
			<xsl:apply-templates select="clasificacion"/>
		</tr>

	</xsl:template>
	<xsl:template match="clasificacion">
		<td class="linea3">
			<xsl:value-of select="jugados"/>
		</td>
		<td class="linea3">
			<xsl:value-of select="ganados"/>
		</td>
		<td class="linea3">
			<xsl:value-of select="empatados"/>
		</td>
		<td class="linea3">
			<xsl:value-of select="perdidos"/>
		</td>
		<td class="linea3">
			<xsl:value-of select="golesfavor"/>
		</td>
		<td class="linea3">
			<xsl:value-of select="golescontra"/>
		</td>
	</xsl:template>
</xsl:stylesheet>