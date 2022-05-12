<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">

    <html>
        <head>
            <title>Tarea XSLT - Vehiculos</title>
            <style>
                .fondoverde {
                    background-color: green;
                }
                .tabla {
                    border: solid 1px black;
            </style>
        </head>
        <body>
            <h2>1.Visualiza todos los vehiculos en una tabla que contenga la marca el modelo y su precio, ordenados por marca</h2>
            <table  class="tabla">
                <tr> 
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Precio</th>
                </tr>

                <xsl:for-each select="vehiculos/vehiculo">
                <xsl:sort select="marca" />
                <tr>
                    <td><xsl:value-of select="marca"></xsl:value-of></td>
                    <td><xsl:value-of select="modelo"></xsl:value-of></td>
                    <td><xsl:value-of select="precio"></xsl:value-of></td>
                </tr>
                </xsl:for-each>
            </table>
           

            <h2>2.En una tabla, marca, modelo, cambio, precio y combustible de los coches gasolina y automaticos</h2>
            <table class="tabla">
                <tr> 
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Cambio</th>
                    <th>Precio</th>
                    <th>Combustible</th>
                </tr>

                <xsl:for-each select="vehiculos/vehiculo">
                <xsl:if test="@combustible='gasolina' and @cambio='automatico'">
                <tr>
                    <td><xsl:value-of select="marca"></xsl:value-of></td>
                    <td><xsl:value-of select="modelo"></xsl:value-of></td>
                    <td><xsl:value-of select="@cambio"></xsl:value-of></td>
                    <td><xsl:value-of select="precio"></xsl:value-of></td>
                    <td><xsl:value-of select="@combustible"></xsl:value-of></td>
                </tr>
                </xsl:if>
                </xsl:for-each>
            </table>
            

            <h2>3.En una tabla, marca, modelo, precio, Km, año, y potencia, mostrando los coches mas baratos de 20.000€ en fondo verde</h2>
            <table class="tabla">
                <tr> 
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Precio</th>
                    <th>Km</th>
                    <th>Año</th>
                    <th>Potencia</th>
                </tr>

                <xsl:for-each select="vehiculos/vehiculo">
                <xsl:choose>
                <xsl:when test="precio &lt; 20000">
                <tr class="fondoverde">
                    <td><xsl:value-of select="marca"></xsl:value-of></td>
                    <td><xsl:value-of select="modelo"></xsl:value-of></td>
                    <td><xsl:value-of select="precio"></xsl:value-of></td>
                    <td><xsl:value-of select="km"></xsl:value-of></td>
                    <td><xsl:value-of select="anno"></xsl:value-of></td>
                    <td><xsl:value-of select="potencia"></xsl:value-of></td>
                </tr>

                </xsl:when>
                <xsl:otherwise>
                <tr>
                    <td><xsl:value-of select="marca"></xsl:value-of></td>
                    <td><xsl:value-of select="modelo"></xsl:value-of></td>
                    <td><xsl:value-of select="precio"></xsl:value-of></td>
                    <td><xsl:value-of select="km"></xsl:value-of></td>
                    <td><xsl:value-of select="anno"></xsl:value-of></td>
                    <td><xsl:value-of select="potencia"></xsl:value-of></td>
                </tr>
                </xsl:otherwise>
                </xsl:choose>
                </xsl:for-each>
            </table>


            <h2>4.En una tabla, marca, modelo, combustible y precio de los coches, no gasolina. Ordenados por precio</h2>
                <table class="tabla">
                    <tr> 
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Combustible</th>
                        <th>Precio</th>
                    </tr>

                    <xsl:for-each select="vehiculos/vehiculo">
                    <xsl:sort select="precio" order="ascending" data-type="number" />  
                    <tr>
                        <td><xsl:value-of select="marca"></xsl:value-of></td>
                        <td><xsl:value-of select="modelo"></xsl:value-of></td>
                        <td><xsl:value-of select="@combustible"></xsl:value-of></td>
                        <td><xsl:value-of select="precio"></xsl:value-of></td>
                    </tr>
                    </xsl:for-each>
                </table>
            
            <h2>5.Tabla con los 3 coches mas caros</h2>
                <table class="tabla">
                    <tr> 
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Precio</th>
                    </tr>

                    <xsl:for-each select="vehiculos/vehiculo">
                    <xsl:sort select="precio" order="descending" data-type="number" />
                    <xsl:if test="position() &lt; 4">
                    <tr>
                        <td><xsl:value-of select="marca"></xsl:value-of></td>
                        <td><xsl:value-of select="modelo"></xsl:value-of></td>
                        <td><xsl:value-of select="precio"></xsl:value-of></td>
                    </tr>
                    </xsl:if>
                    </xsl:for-each>
                </table>

            <h2>6.Listado en la que se muestre para cada marca el numero de coches que tiene en el XML</h2>
            <xsl:for-each select="vehiculos/vehiculo">
                <ul>
                    <li> <xsl:value-of select="marca"></xsl:value-of>
                    </li>
                </ul>
            </xsl:for-each>

        </body>
    </html>

    </xsl:template>
</xsl:transform>