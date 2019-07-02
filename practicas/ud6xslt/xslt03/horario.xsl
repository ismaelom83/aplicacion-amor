<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="horario">
		<html>
			<head>
				<title>XSLT03 Ismael Heras</title>
				<link rel="shortcut icon" type="imagen/png"  href ="../../../favicon.ico/favicon.png"/>
				<link rel="stylesheet" type="text/css" href="estilos.css"/>
			</head>
			<body>
				<h1>Horario</h1>

				<table border="1" cellspacing="0" style="text-align:center;">

					<tr class="cabeceradias">
						<td/>
						<td>Lunes</td>
						<td>Martes</td>
						<td>Miercoles</td>
						<td>Jueves</td>
						<td>Viernes</td>
					</tr>
					<xsl:apply-templates select="dia" mode="tabla"/>
				</table>
				<br/>
				<table border="1" cellspacing="0" style="text-align:center;">

					<tr class="cabecera">
						<td>Sigla</td>
						<td>Nombre</td>
						<td>Codigo</td>
						<td>Profesor</td>
						<td>Nº Horas</td>
					</tr>
					<xsl:apply-templates select="modulos/modulo" mode="tabla"/>

				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="dia" mode="tabla">
		<tr>
			<td>
				<xsl:attribute name="class">
					<xsl:value-of select="@hora"/>
				</xsl:attribute>
				<xsl:value-of select="@hora"/>
			</td>
			<xsl:for-each select="dia_sem">
				<td>
					<xsl:attribute name="class">
						<xsl:value-of select="text()"/>
					</xsl:attribute>
					<xsl:if test="@num = 2">
						<xsl:attribute name="rowspan">
							<xsl:value-of select="2"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="."/>
				</td>
			</xsl:for-each>
		</tr>

	</xsl:template>

	<xsl:template match="modulos/modulo" mode="tabla">
		<tr>
			<xsl:attribute name="class">
				<xsl:value-of select="sigla"/>
			</xsl:attribute>
			<td>
				<strong>
					<xsl:value-of select="sigla"/>
				</strong>
			</td>
			<td>
				<xsl:value-of select="nombre"/>
			</td>
			<td>
				<xsl:value-of select="profesor/@codigo"/>
			</td>
			<td>
				<xsl:value-of select="profesor"/>
			</td>
			<td>
			<xsl:variable name="cod_asignatura" select="sigla"/>
				<xsl:value-of select="sum(//dia_sem/@num[..=$cod_asignatura])"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
