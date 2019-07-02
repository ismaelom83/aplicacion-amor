<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/universidad">
		<html>
			<head>
				<title>XSLT06.- Universidad De Victoria Ismael Heras Salvador</title>
				<link rel="shortcut icon" type="imagen/png"  href ="../../../favicon.ico/favicon.png"/>
				<link rel="stylesheet" type="text/css" href="estilos.css"/>
			</head>
			<body>
				<h1 class="h1">XSLTO6.- Universidad De Victoria</h1>
				<xsl:apply-templates select="carreras/carrera" mode="h2"/>

			</body>
		</html>
	</xsl:template>
	<xsl:template match="carrera" mode="h2">
		<h2 class="titulo">

			<xsl:value-of select="@id"/>
                -  
			<xsl:value-of select="nombre"/> 
			<xsl:value-of select="concat('(', plan,')')"/>
		</h2>
		<h3 class="subtitulo">
			<xsl:value-of select="centro"/>
		</h3>
		<ul>
			<xsl:apply-templates select="//asignatura[@titulacion=current()/@id]" mode="h3"/>
		</ul>
	</xsl:template>
	<xsl:template match="asignatura" mode="h3">
		<li class="subtitulo-2">
			<xsl:value-of select="concat('(',@id,')')"/>
			<xsl:value-of select="nombre"/>
			<ol>
				<xsl:apply-templates select="//alumno[estudios/asignaturas/asignatura/@codigo=current()/@id]">
					<xsl:with-param name="idcarrera" select="current()/@titulacion"/>
				</xsl:apply-templates>
			</ol>
		</li>
	</xsl:template>
	<xsl:template match="alumno">
		<xsl:param name="idcarrera"/>
		<li class="abr">
			<abbr >
				<xsl:attribute name ="title">
					<xsl:value-of select="//carrera[@id=current()/estudios/carrera/@codigo]/nombre"/>
				</xsl:attribute>
				<xsl:value-of  select="concat(apellido1,' ',apellido2,' ,',nombre)"/>
			</abbr>

			<xsl:if test="estudios/carrera/@codigo=$idcarrera">
				<span class="rojo"> OBLIGATORIO</span>
			</xsl:if>
		</li>
	</xsl:template>
</xsl:stylesheet>


