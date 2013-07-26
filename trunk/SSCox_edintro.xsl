<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="html" version="1.0" encoding="iso-8859-1" indent="no" media-type="text/html"/>
   <!-- 
   
   HTML WRAPPER: Note that this section (between the xsl:template tags) 
   places the entire contents enclosed within the TEI Header of your document into 
   the body element of the Web page. 
   
   -->
   <xsl:template match="teiHeader">
      <html>
         <head>
            <title>
               <xsl:value-of select="//TEI.2/teiHeader/fileDesc/titleStmt/title"/>
            </title>
            <style>
               body {
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                   font-size: 1em;
                   margin: 25px;
                   width: 800px;
                    
               }
               h1 {
                   font-size: 1.5em;
                   font-weight: bold;
                    
               }
               h2 {
                   font-size: 1.25em;
                   font-weight: bold;
                    
               }
               h3 {
                   font-size: 1em;
                   font-style: italic;
                    
               }
               p {
                   font-family:
                   Verdana, Arial, Helvetica, sans-serif;
                    
               }
               hr {
                   clear: right;
               }
               div.fl_mov_right {
                   float: right;
                   text-align: center;
                   width: 320;
                   margin: 5px 5px 5px 5px;
               }
               div.fl_aud_right {
                   float: right;
                   width: 200;
                   text-align: center;
                   margin: 5px 5px 5px 5px;
               }
               div.fl_img_right {
                   float: right;
                   text-align: center;
                   margin: 5px 5px 5px 5px;
               }
               .projectTitle {
                   text-align: center;
                    
               }
               .revTable {
                   font-size: 1em;
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                    
               }
               .links {
                   font-size: .85em;
                   text-align: center;
                    
               }
               .bibl {
                   text-indent: -1em;
                   margin-left: 1em;
                    
               }
               .blockquote {
                   margin-left: 2em;
               }
               .float_right {
                   float: right;
                   margin: 10px 10px 10px 10px;
                    
               }</style>
            <script type="text/javascript" src="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/AC_QuickTime_qtsrc.js" language="JavaScript">
            </script>
         </head>
         <body>
            <h1 class="projectTitle">
               <xsl:value-of select="//titleStmt/title"/>
            </h1>
            <p class="projectTitle">By <xsl:value-of select="//sourceDesc/biblFull/titleStmt/author"
               /></p>
            <hr/>
            <p class="links">[ <a href="#source">About the Source Document</a> | <a href="#edition"
                  >About the Electronic Edition</a> | <a href="#revision">Revision History</a> | <a
                  href="#view">About this Editorial Introduction</a> | <a
                  href="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/">Project Web
                  site</a>] 
               <br/><br/><xsl:element name="a">
                  <xsl:attribute name="href"
                     >SSCoxJournal-Reading.html</xsl:attribute>
                  <strong>Link to the Text of the Journal</strong>
               </xsl:element>
               <br/>
            </p>
            <hr/>

            <xsl:apply-templates select="//notesStmt/note[@type='introductory']"/>
            <xsl:apply-templates select="fileDesc/sourceDesc"/>
            <xsl:apply-templates select="fileDesc/publicationStmt"/>
            <xsl:apply-templates select="fileDesc/titleStmt"/>
            <xsl:apply-templates select="encodingDesc/projectDesc"/>
            <xsl:apply-templates select="encodingDesc/editorialDecl"/>
            <xsl:apply-templates select="encodingDesc/refsDecl"/>
            <xsl:apply-templates select="revisionDesc"/>
            <hr/>
            <p>
               <strong>About this Editorial Introduction</strong>
            </p>
            <p><a name="view"/>Text on this page is derived from the TEI Header element of the
               edition's XML source document, SSCoxJournal.xml.</p>
            <hr/>
            <p>&#x2192; Link to the <a
                  href="SSCoxJournal-Reading.html"
                  >text of the journal</a>
            </p>
         </body>
      </html>
   </xsl:template>
   <!-- Add the introductory notes. -->
   <xsl:template match="//notesStmt/note[@type='introductory']">
      <p>
         <strong>Introduction</strong>
      </p>
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Add information about your source document. -->
   <xsl:template match="biblFull">
      <hr/>
      <a name="source"/>
      <h2>About the Source Document</h2>
      <p>Title: "<xsl:value-of select="titleStmt/title"/>" <br/>Author: <xsl:value-of
            select="titleStmt/author"/>
         <br/>Extent: <xsl:value-of select="extent"/>
      </p>
      <p>
         <xsl:apply-templates select="notesStmt/note[@type='descriptive']"/>
      </p>
      <p>
         <xsl:apply-templates select="fileDesc/publicationStmt"/>
      </p>
   </xsl:template>
   <xsl:template match="refsDecl">
      <h3>Encoding Conventions</h3>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="availability">
      <p>
         <em>
            <xsl:apply-templates/>
         </em>
      </p>
      <p>
         <em>
            <xsl:value-of select="//publicationStmt/pubPlace"/>, <xsl:value-of
               select="//publicationStmt/date"/>
         </em>
      </p>
   </xsl:template>
   <!-- Add information about your electronic document. -->
   <xsl:template match="projectDesc">
      <h3>Project Description</h3>
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="titleStmt">
      <hr/>
      <a name="edition"/>
      <h2>About the Electronic Edition</h2>
      <p>Title: <xsl:value-of select="title"/>
         <br/>Editors: <xsl:for-each select="editor">
            <xsl:choose>
               <xsl:when test="current()=//titleStmt/editor[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.</p>
      <xsl:apply-templates select="respStmt"/>

   </xsl:template>
   <xsl:template match="respStmt">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="resp">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="name">
      <xsl:apply-templates/>
      <br/>
   </xsl:template>
   <xsl:template match="name[@type='ship']">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="editorialDecl">
      <h3>Editorial Method</h3>
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Add information about the revision history of your document. -->
   <xsl:template match="revisionDesc">
      <p>
         <p align="center">
            <xsl:value-of select="//availability/p[@id='CreativeCommons']"
               disable-output-escaping="yes"/>
         </p>
         <hr/>
         <a name="revision"/>
         <h2>Revision History</h2>
      </p>
      <table width="90%">
         <tr>
            <td>
               <h3>Date</h3>
            </td>
            <td>
               <h3>Role</h3>
            </td>
            <td>
               <h3>Name</h3>
            </td>
            <td>
               <h3>Change</h3>
            </td>
         </tr>
         <xsl:for-each select="change">
            <tr class="revTable" valign="top">
               <td nowrap="nowrap">
                  <xsl:value-of select="date"/>
               </td>
               <td nowrap="nowrap">
                  <xsl:value-of select="respStmt/resp"/>
               </td>
               <td nowrap="nowrap">
                  <xsl:value-of select="respStmt/name"/>
               </td>
               <td>
                  <xsl:value-of select="item"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>
   <xsl:template match="//p">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="q[@rend='block']">
      <br/>
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
         <br/>
      </div>
   </xsl:template>

   <xsl:template match="figure[@rend='link']"> [<a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="figDesc/xref/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="head"/>
         </xsl:attribute>
         <xsl:value-of select="figDesc/xref"/>
      </a>]. </xsl:template>

   <xsl:template match="figure[@rend='embedImg']">
      <div class="fl_img_right">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="figDesc/xref/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
               <xsl:value-of select="head"/>
            </xsl:attribute>
         </img>
         <br/>
         <xsl:value-of select="head"/>
      </div>
   </xsl:template>

   <xsl:template match="figure[@rend='embedVidStream']">
      <div class="fl_mov_right">
         <script language="JavaScript" type="text/javascript">
            QT_WriteOBJECT('<xsl:value-of select="figDesc/xref/@url"/>
            ', ' 240 ', ' 196 ', '',
            'autoplay', 'false',
            'starttime','<xsl:value-of select="figDesc/xref/@starttime"/>
            ',
            'endtime','<xsl:value-of select="figDesc/xref/@endtime"/>
            ',
            'emb#height', '196',
            'emb#width', '240',
            'emb#type', 'video/quicktime')</script>
         <br/>
         <xsl:value-of select="head"/>
         <br/>
      </div>
   </xsl:template>

   <xsl:template match="figure[@rend='embedAudStream']">
      <div class="fl_mov_right">
         <script language="JavaScript" type="text/javascript">
            QT_WriteOBJECT('<xsl:value-of select="figDesc/xref/@url"/>
            ', ' 160 ', ' 16 ', '',
            'autoplay', 'false',
            'starttime','<xsl:value-of select="figDesc/xref/@starttime"/>
            ',
            'endtime','<xsl:value-of select="figDesc/xref/@endtime"/>
            ',
            'scale', 'tofit',
            'emb#height', '16',
            'emb#width', '160',
            'emb#type', 'video/quicktime')</script>
         <br/>
         <xsl:value-of select="head"/>
         <br/>
      </div>
   </xsl:template>

   <xsl:template match="figure[@rend='embedMov']">
      <div class="fl_mov_right">
         <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B"
            codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="320" height="256">
            <xsl:element name="param">
               <xsl:attribute name="name">src</xsl:attribute>
               <xsl:attribute name="value">
                  <xsl:value-of select="figDesc/xref/@url"/>
               </xsl:attribute>
            </xsl:element>
            <param name="autoplay" value="false"/>
            <param name="controller" value="true"/>
            <param name="scale" value="aspect"/>
            <!--<xsl:element name="param">
               <xsl:attribute name="name">starttime</xsl:attribute>
               <xsl:attribute name="value"><xsl:value-of select="lb/@starttime"/></xsl:attribute>
               </xsl:element>
               <xsl:element name="param">
               <xsl:attribute name="name">endtime</xsl:attribute>
               <xsl:attribute name="value"><xsl:value-of select="lb/@endtime"/></xsl:attribute>
               </xsl:element>-->
            <xsl:element name="embed">
               <xsl:attribute name="height">256</xsl:attribute>
               <xsl:attribute name="width">320</xsl:attribute>
               <xsl:attribute name="src">
                  <xsl:value-of select="figDesc/xref/@url"/>
               </xsl:attribute>
               <xsl:attribute name="pluginspace"
                  >http://www.apple.com/quicktime/download/</xsl:attribute>
               <xsl:attribute name="autoplay">false</xsl:attribute>
               <xsl:attribute name="type">video/quicktime</xsl:attribute>
               <xsl:attribute name="controller">true</xsl:attribute>
               <xsl:attribute name="scale">aspect</xsl:attribute>
               <!--<xsl:attribute name="starttime"><xsl:value-of select="lb/@starttime"/></xsl:attribute>
                  <xsl:attribute name="endtime"><xsl:value-of select="lb/@endtime"/></xsl:attribute>-->
            </xsl:element>
         </object>
         <br/>
         <xsl:value-of select="head"/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="figure[@rend='embedAud']">
      <div class="fl_aud_right">
         <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B"
            codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="200" height="16">
            <xsl:element name="param">
               <xsl:attribute name="name">src</xsl:attribute>
               <xsl:attribute name="value">
                  <xsl:value-of select="figDesc/xref/@url"/>
               </xsl:attribute>
            </xsl:element>
            <param name="autoplay" value="false"/>
            <param name="controller" value="true"/>
            <param name="scale" value="aspect"/>
            <!--<xsl:element name="param">
               <xsl:attribute name="name">starttime</xsl:attribute>
               <xsl:attribute name="value"><xsl:value-of select="lb/@starttime"/></xsl:attribute>
               </xsl:element>
               <xsl:element name="param">
               <xsl:attribute name="name">endtime</xsl:attribute>
               <xsl:attribute name="value"><xsl:value-of select="lb/@endtime"/></xsl:attribute>
               </xsl:element>-->
            <xsl:element name="embed">
               <xsl:attribute name="height">16</xsl:attribute>
               <xsl:attribute name="width">200</xsl:attribute>
               <xsl:attribute name="src">
                  <xsl:value-of select="figDesc/xref/@url"/>
               </xsl:attribute>
               <xsl:attribute name="pluginspace"
                  >http://www.apple.com/quicktime/download/</xsl:attribute>
               <xsl:attribute name="autoplay">false</xsl:attribute>
               <xsl:attribute name="type">video/quicktime</xsl:attribute>
               <xsl:attribute name="controller">true</xsl:attribute>
               <xsl:attribute name="scale">aspect</xsl:attribute>
               <!--<xsl:attribute name="starttime"><xsl:value-of select="lb/@starttime"/></xsl:attribute>
                  <xsl:attribute name="endtime"><xsl:value-of select="lb/@endtime"/></xsl:attribute>-->
            </xsl:element>
         </object>
         <br/>
         <xsl:value-of select="head"/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="foreign">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="xref">
      <xsl:choose>
         <xsl:when test="parent=figDesc"/>
         <xsl:otherwise>
            <a>
               <xsl:attribute name="href">
                  <xsl:value-of select="@url"/>
               </xsl:attribute>
               <xsl:apply-templates/>
            </a>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="hi[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="hi[@rend='italics']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="emph[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="title">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>

   <!-- Suppress some unused elements in the XML file. -->
   <xsl:template match="text"/>
   <xsl:template match="editor"/>
   <xsl:template match="principal"/>
   <xsl:template match="editionStmt"/>
   <xsl:template match="extent"/>
   <xsl:template match="encodingDesc"/>
   <xsl:template match="profileDesc"/>
   <xsl:template match="idno"/>
   <xsl:template match="publisher"/>
   <xsl:template match="pubPlace"/>
   <xsl:template match="date"/>
   <xsl:template match="//availability/p[@id='CreativeCommons']"/>
</xsl:stylesheet>
