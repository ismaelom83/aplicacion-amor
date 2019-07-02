<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="listatickets/ticket">
        <html>
            <head>
                <title>XSLT02    Ismael Heras</title>
                <link rel="stylesheet" type="text/css" href="estilos.css"/>
                <link rel="shortcut icon" type="imagen/png"  href ="../../../favicon.ico/favicon.png"/>
            </head>
            <body>
                <table border="1" cellspacing="0">
                    <tr>
                        <td>
                            <xsl:value-of select="numero"/>
                        </td>
                        <td>
                            <xsl:value-of select="fecha"/>
                        </td>
                        <td>
                            <xsl:value-of select="hora"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:apply-templates select="producto"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="producto">
        <xsl:value-of select="nombre"/>
        <xsl:value-of select="precio"/>
    </xsl:template>
</xsl:stylesheet>