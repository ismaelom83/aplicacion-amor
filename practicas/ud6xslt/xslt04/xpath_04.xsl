<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/actividades">
		<html>
			<head>
				<title>XSLT04 Ismael Heras Salvador</title>
				<link rel="shortcut icon" type="imagen/png"  href ="../../../favicon.ico/favicon.png"/>
				<link rel="stylesheet" type="text/css" href="estilos.css"/>
			</head>
			<body>
				<div class="contenedor">		
					<h1>Practica XPATH 04 01</h1>
					<ul class="lista">
						<h2>Todos los elementos de las actividades infantiles</h2>
						<xsl:apply-templates select="actividad[@nivel='infantil']/*" mode="lista"/>
					</ul>
				</div>
				<div class="contenedor">		
					<h1>Practica XPATH 04 02</h1>
					<ul class="lista">
						<h2>Todos los elementos de las actividades para adultos</h2>
						<xsl:apply-templates select="actividad[@nivel='adultos']/titulo" mode="lista2"/>
					</ul>
				</div>
				<div class="contenedor2">		
					<h1>Practica XPATH 04 03</h1>
					<h2>Todos los elementos de las actividades para adultos</h2>
					<ul class="lista">
						<h2>OPCION A//actividad[sesiones/sesiones_semana='2']/titulo</h2>
						<xsl:apply-templates select="//actividad[sesiones/sesiones_semana='2']/titulo" mode="lista3"/>
					</ul>
				</div>
				<div class="contenedor2">		
					<h1>Practica XPATH 04 04</h1>
					<h2>Cuenta el numero de actividades</h2>
					<ul class="lista">
						<h2>OPCION A count(//actividad)</h2>
						<li>
						numero de actividades: 
							<xsl:variable name="cuenta" select="count(//actividad)"/>
							<xsl:value-of select="$cuenta" />
						</li>
					</ul>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="actividad[@nivel='infantil']/*" mode="lista">
		<li>
			<xsl:value-of select="name(.)" />
	 		     : 
			<xsl:value-of select="." />
		</li>
	</xsl:template>
	<xsl:template match="actividad[@nivel='adultos']/titulo" mode="lista2">
		<li>
			<xsl:value-of select="." />
		</li>
	</xsl:template>
	<xsl:template match="//actividad[sesiones/sesiones_semana='2']/titulo" mode="lista3">
		<li>
			<xsl:value-of select="." />
		</li>

	</xsl:template>

</xsl:stylesheet>