<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//text/front/div1/head/bibl/title"/>
                </title>
                <style>                
                    body { 
                    margin:30px; 
                    background-color: #FFFFFF; 
                    width: 70em;
                    font-family: Verdana, Arial, Helvetica, sans-serif; 
                    }
                    h1 {
                    font-size: 12pt;
                    text-align: center;
                    }
                    div.fl_img_right {
                    float: right;
                    text-align: center;
                    margin: 5px 5px 5px 5px;
                    } 
                    .ProjectTitle {
                    font-family: Verdana, Arial, Helvetica, sans-serif;
                    font-size: 16pt;
                    font-style: normal;
                    font-weight: bolder;
                    line-height: 18pt;
                    }
                    
                </style>
                <script type="text/javascript" src="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/AC_QuickTime_qtsrc.js" language="JavaScript">
                </script>
            </head>
            <body background="https://images.asc.ohio-state.edu/is/image/mediamanager/9/9846d5b7-ad8b-4ffa-be30-4c70ea5dac63.jpg?scale=0.4&amp;rgn=360,440,240,240&amp;op_brightness=20&amp;fmt=png">
                <p align="center"><span class="ProjectTitle">Journal of a Tour to Europe</span><br/>
                A Personal Journal of Samuel Sullivan Cox (1824-1889)</p>
                <hr/>
                <p align="center">
                    <a href="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/" target="self">Project Web Site</a> | 
                    <a href="http://suse1.cohums.ohio-state.edu/tomcat/cocoon/eng569/SSCoxJournal.SSC_edintro" target="self"> Ed. Intro</a> || <strong>Views</strong>:
                    <a href="http://suse1.cohums.ohio-state.edu/tomcat/cocoon/eng569/SSCoxJournal.SSC_reading" target="self"> Reading</a> |
                    <a href="http://suse1.cohums.ohio-state.edu/tomcat/cocoon/eng569/SSCoxJournal.SSC_diplomatic" target="self"> Diplomatic</a> |
                    <a href="http://suse1.cohums.ohio-state.edu/tomcat/cocoon/eng569/SSCoxJournal.SSC_splitview" target="self"> MS Image/Text</a> | Audio (current/<a
                        href="#view">about</a>)
                    <br/><br/><strong>This edition is still being developed. Please do not cite until this notice is removed.</strong>
                </p>
                <hr/>
                <p>
                    <div class="fl_img_right">
                        <img src="https://images.asc.ohio-state.edu/is/image/mediamanager/2/2b033aa7-b2d6-4f69-93d0-3807e1db2ca0.jpg?scale=0.2&amp;fmt=png"/>
                    </div>
                </p>                
                <p><strong>Audio Clips</strong></p>
                <p>Click on the corresponding controller's start button to listen to an entry. Note: This audio edition has been tested only
                on Safari 2.0 (Mac OSX) and Internet Explorer 6.0 (Windows).</p> 
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr valign="bottom"><td><strong>Journal Entries</strong></td>
                    <td><strong>Controllers</strong></td></tr>
                <tr valign="bottom"><td>Entire Edition (approx. 42 min.)</td>
                    <td>
                        <script language="JavaScript" type="text/javascript">
                            QT_WriteOBJECT('rtsp://stream1.cohums.ohio-state.edu/streaming/Cox_audio.mov', '160', '16', '',
                            'autoplay', 'false',
                            'scale','tofit',
                            'emb#height','16',
                            'emb#width','160',
                            'emb#type','video/quicktime')
                        </script>
                    </td>
                </tr>
                <tr valign="bottom">
                    <td>Introduction and License</td>
                        <td>
                            <script language="JavaScript" type="text/javascript">
                                QT_WriteOBJECT('rtsp://stream1.cohums.ohio-state.edu/streaming/Cox_audio.mov', '160', '16', '',
                                'autoplay', 'false',
                                'starttime','00:00:00:00',
                                'endtime','00:02:28:00',
                                'scale','tofit',
                                'emb#height','16',
                                'emb#width','160',
                                'emb#type','video/quicktime')
                            </script>
                        </td>
                </tr>
                <xsl:for-each select="//body/div1[@audiostart]">
          <tr valign="bottom">
              <td><xsl:apply-templates select="opener/dateline"/></td> 
                <td>
                    <script language="JavaScript" type="text/javascript">
                        QT_WriteOBJECT('rtsp://stream1.cohums.ohio-state.edu/streaming/Cox_audio.mov', '160', '16', '',
                        'autoplay', 'false',
                        'starttime','<xsl:value-of select="@audiostart"/>',
                        'endtime','<xsl:value-of select="@audioend"/>',
                        'scale','tofit',
                        'emb#height','16',
                        'emb#width','160',
                        'emb#type','video/quicktime')
                    </script>
                </td>
          </tr>
                </xsl:for-each>
                </table>
                <br/><br/>
                <hr/>
                <p>
                    <strong>About the Audio Clips</strong>
                </p>
                <p><a name="view"/>NOTE: This audio version of Cox's journal was recorded early in the project
                    as a proof-of-concept demonstration. As such, it is incomplete and based on a transcript
                    of the text that has since been corrected; therefore, it does not match the text views in 
                    all particulars. A complete audio version based on the corrected 
                    transcript is planned.<br/><br/>
                    The links above point to a single audio file on a streaming server hosted by Arts and Humanities
                    Information Systems, The Ohio State University. The audio links on this page and in the other views request
                    the streaming server to deliver specific parts of the master audio file according to start- and end-points
                    encoded in the project's XML source file.
                </p>
                <hr/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="del"/>
</xsl:stylesheet>
