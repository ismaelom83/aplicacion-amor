<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:variable name="iva" select="0.1"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>XSLT02 Ismael Heras Salvador</title>
				<meta charset="UTF-8"/>
				<link rel="shortcut icon" type="imagen/png"  href ="../../../favicon.ico/favicon.png"/>
				<link rel="stylesheet" type="text/css" href="estilos.css"/>
			</head>
			<body>
			<h1 class="titulo">
				Listado de tickets
			</h1>
			<xsl:apply-templates select="listatickets/ticket"/>
			<h2>
				<xsl:value-of select='format-number(sum(//precio)*(1+$iva),"#.00")'/> €
			</h2>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ticket">
		<table border="1">
			<caption>Google S.L</caption>
				<tr>
				<th colspan="2">
					N Ticket: <xsl:value-of select="numero"/>
				</th>
				</tr>
				<tr>
				<td colspan="2">
					Fecha: <xsl:value-of select="concat(fecha,'',hora)"/>
				</td>
			</tr>
			<tr>
				<td>
					Articulo
				</td>
				<td>
					Precio
				</td>
			</tr>
				<xsl:apply-templates select="producto">
					<xsl:sort select="precio" data-type="number" order="descending"/>
				</xsl:apply-templates>
			<tr>
				<td>
					Total 
				</td>
				<td>
					<xsl:value-of select="sum(producto/precio)"/> €
				</td>
			</tr>
			<tr>
				<td>
					Iva
				</td>
				<td>
					<xsl:value-of select="$iva*100"/> %
				</td>
			</tr>
			<tr>
				<td>
					Total de Iva
				</td>
				<td>
					<xsl:value-of select='format-number(sum(producto/precio)*$iva,"#.00")'/> €
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="producto">	
		<tr>
			<td><xsl:value-of select="nombre"/></td>
			<td><xsl:value-of select="precio"/></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>

				