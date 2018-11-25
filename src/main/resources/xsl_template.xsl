<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:element="localhost/xml_labs/lab_3" version="2.0">
    <xsl:output method="html" encoding="UTF-8" version="5.2" indent="yes"/>
    <xsl:template match="/">
        <html>
            <xsl:call-template name="head"/>
            <body>
                <table class="result-table">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Название</th>
                            <th>Дата</th>
                            <th>Описание</th>
                            <th>Создатель</th>
                            <th>Статус</th>
                            <th>Комментарий</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="element:specialEvents/element:specialEvent">
                            <xsl:sort select="element:specialEventStatus" order="descending"/>
                            <tr>
                                <th>
                                    <xsl:number value="position()"/>
                                </th>
                                <th>
                                    <xsl:value-of select="element:id"/>
                                </th>
                                <th>
                                    <xsl:value-of select="element:eventName"/>
                                </th>
                                <th>
                                    <xsl:value-of select="element:eventDate"/>
                                </th>
                                <th>
                                    <xsl:value-of select="element:specialEventAbout"/>
                                </th>
                                <th>
                                    <xsl:value-of select="element:specialEventStatus"/>
                                </th>
                                <th>
                                    <xsl:value-of select="element:specialEventCreator">
                                        <xsl:value-of select="element:firstname"/>
                                        <xsl:value-of select="element:middleName"/>
                                        <xsl:value-of select="element:lastname"/>
                                        <xsl:value-of select="element:rank"/>
                                    </xsl:value-of>
                                </th>
                                <th>
                                    <xsl:choose>
                                        <xsl:when test="element:specialEventStatus = 'Run'">
                                            Запущен в <xsl:value-of select="element:eventDate"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            Ожидание
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </th>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td>Итого:</td>
                            <td >
                                <xsl:value-of select="count(element:specialEvents/element:specialEvent)"/>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="head">
        <head>
            <link rel="stylesheet" href="styles.css"/>
        </head>
    </xsl:template>
</xsl:stylesheet>
