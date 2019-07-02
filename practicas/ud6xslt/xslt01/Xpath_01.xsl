<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="edificio">
		<html>
			<head>
				<title>XSLT01 Ismael Heras</title>
				<link rel="shortcut icon" type="imagen/png"  href ="../../../favicon.ico/favicon.png"/>
				<link rel="stylesheet" type="text/css" href="estilos.css"/>
			</head>
			<body>
			<h1>Edificio</h1>
				<table border="1" cellspacing="0" style="text-alling:center">
					<tr>
						<td>piso</td>
						<td>puerta</td>
						<td>vecinos
							<xsl:value-of select="nombre"/>
						</td>
					</tr>
					<xsl:apply-templates select="vivienda" mode="table"/>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="vivienda" mode="table">
		<tr>
			<td>
				<xsl:value-of select="piso"/>
			</td>
			<td>
				<xsl:value-of select="puerta"/>
			</td>
			<xsl:for-each select="vecinos/nombre">
				<td>
					<xsl:value-of select="."/>
				</td>
			</xsl:for-each>
		</tr>
	</xsl:template>
</xsl:stylesheet>