<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="no" encoding="UTF-8"/>
    <xsl:param name="solucion" select="'no'"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Desarrollo De Aplicaciones WEB</title>
                <link rel="shortcut icon" type="imagen/png"  href ="../../../favicon.ico/favicon.png"/>
                <link rel="stylesheet" type="text/css" href="examen.css"/>
            </head>
            <body>
                <xsl:apply-templates select="examen/datos" mode="datos"/>
                <xsl:apply-templates select="examen/datos/fecha" mode="fecha"/>

                <form method="get" action="formExamen.php">
                    <xsl:apply-templates select="examen/preguntas/pregunta" mode="preguntas"/>
                </form>
                
                    <xsl:if test="$solucion='no'">
                        <input type="submit" value="Enviar Formulario" class="btn1"/><input type="reset" value="Borar Formulario" class="btn1"/>
                        
                    </xsl:if>
                

            </body>
        </html>
    </xsl:template>
    <xsl:template match="datos" mode="datos">
        <h1>
            <xsl:value-of select="nombreModulo"/>
        </h1>
    </xsl:template>
    <xsl:template match="fecha" mode="fecha">
        <h2>
            <xsl:value-of select="concat('Fecha: ',dia, ' de ',document('meses.xml')//mes[@id=current()/mes],anyo)"/>
        </h2>
    </xsl:template>
    <xsl:template match="pregunta" mode="preguntas">


        <li class="enunciado">
            <xsl:value-of select="concat(@id,' .- ',enunciado)"/>
        </li>
        <xsl:apply-templates select="respuestas/respuesta" mode="respuestas">
            <xsl:with-param name="idPregunta" select="current()/@id"/>
        </xsl:apply-templates>


    </xsl:template>
    <xsl:template match="respuesta" mode="respuestas">
        <xsl:param name="idPregunta"/>
        <div class="respuestas">
            <input type="radio" name="{concat('pregunta',$idPregunta)}" value="{position()}">
                <xsl:if test="$solucion!='no' and @correcta='correcta'">
                    <xsl:attribute name="checked"/>
                </xsl:if>
            </input>
            <xsl:value-of select="./text()"/>
        </div>
    </xsl:template>
</xsl:stylesheet>





























