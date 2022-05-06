<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">

    <html>
        <head>
            <title>Tarea XSLT - Tabla de desayunos</title>
        </head>
        <body>
          <h2>Tabla de desayunos</h2>
            <xsl:for-each select="breakfast_menu/food">
                <table class="default" style="border:solid 1px; border-spacing:10px; width:25%">
                    <tr> 
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Calorias</th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="name"></xsl:value-of></td>
                        <td><xsl:value-of select="price"></xsl:value-of></td>
                        <td><xsl:value-of select="calories"></xsl:value-of></td>
                    </tr>
                </table>
            </xsl:for-each>

            <h2>Ordenar los desayunos por nombre</h2>
            <xsl:for-each select="breakfast_menu/food">
                <xsl:sort select="name" />
                    <table class="default" style="border:solid 1px; border-spacing:10px; width:25%">
                        <tr> 
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Calorias</th>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="name"></xsl:value-of></td>
                            <td><xsl:value-of select="price"></xsl:value-of></td>
                            <td><xsl:value-of select="calories"></xsl:value-of></td>
                        </tr>
                    </table>
            </xsl:for-each>

            <h2>Filtrar los desayunos que tienen más de 850 calorias</h2>
            <xsl:for-each select="breakfast_menu/food">
                <xsl:if test="calories &gt; 850">
                    <table class="default" style="border:solid 1px; border-spacing:10px; width:25%">
                        <tr> 
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Calorias</th>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="name"></xsl:value-of></td>
                            <td><xsl:value-of select="price"></xsl:value-of></td>
                            <td><xsl:value-of select="calories"></xsl:value-of></td>
                        </tr>
                    </table>
                </xsl:if>
            </xsl:for-each>

            <h2>Si el precio es mayor a 800 entonces la fila debe de ir en color rojo</h2>
            <!-- He puesto 800 porque no hay ningun desayuno que cueste 9 libras como pone en el-->
            <xsl:for-each select="breakfast_menu/food">
                <xsl:choose>
                    <xsl:when test="price &gt; 800">
                        <table class="default" style="border:solid 1px; border-spacing:10px; width:25%">
                            <tr> 
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Calorias</th>
                            </tr>
                            <tr>
                                <td style="color:red"><xsl:value-of select="name"></xsl:value-of></td>
                                <td style="color:red"><xsl:value-of select="price"></xsl:value-of></td>
                                <td style="color:red"><xsl:value-of select="calories"></xsl:value-of></td>
                            </tr>
                        </table>
                    </xsl:when>
                    <xsl:otherwise>
                        <table class="default" style="border:solid 1px; border-spacing:10px; width:25%">
                            <tr> 
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Calorias</th>
                            </tr>
                            <tr>
                                <td><xsl:value-of select="name"></xsl:value-of></td>
                                <td><xsl:value-of select="price"></xsl:value-of></td>
                                <td><xsl:value-of select="calories"></xsl:value-of></td>
                            </tr>
                        </table>
                    </xsl:otherwise>
               
                </xsl:choose>
            </xsl:for-each>

        </body>
    </html>

    </xsl:template>
</xsl:transform>