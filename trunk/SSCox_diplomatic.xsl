<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
      <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
         <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> 26 July 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
            <xd:p/>
         </xd:desc>
      </xd:doc>
      
   <!-- This style sheet is divided into the following sections:
   
   HTML WRAPPER
   MAJOR STRUCTURES  of the text (front, div1, back)
   PAGE, COLUMN, AND LINE BREAKS
   METADATA SUMMARY ITEMS
   MSS ITEMS
   MISCELLANEOUS
   IMAGES
   NOTES
   LETTERS
   TITLES
   TYPOGRAPHY
   TABLES
   LISTS
            
-->
   <!-- HTML WRAPPER: Note that this section (between the xsl:template tags) 
places the entire contents enclosed within the text tags of your document into 
the body tags of the Web page. -->
   <xsl:template match="/">
      <html>
         <head>
            <title>
               <xsl:value-of select="//text/front/div1/head/bibl/title"/>
            </title>
            <style>
               body {
                   margin: 30px;
                   background-color: #FFFFFF;
                   width: 60em;
                   font-family: Verdana, Arial, Helvetica, sans-serif;
               }
               p {
               }
               span.pagebreak {
                   line-height: 2.5em;
               }
               fl_right {
                   float: right;
               }
               hr {
                   color: #888833;
                   clear: right;
               }
               div#letter {
                   border: 3px groove #666666;
                   padding: 5px;
               }
               h1 {
               }
               h2 {
               }
               sup {
               }
               img {
                   margin-top: 5px;
                   margin-bottom: 5px;
               }
               .nocancel {
                   text-decoration: none;
                   color: #000000;
               }
               .cancel {
                   text-decoration: line-through;
                   color: #FF0000;
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
               .ProjectTitle {
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                   font-size: 16pt;
                   font-style: normal;
                   font-weight: bolder;
                   line-height: 18pt;
               }
               .hang15 {
                   margin-left: 40px;
                   text-indent: -15px;
               }
               .hang25 {
                   margin-left: 40px;
                   text-indent: -25px;
               }
               .hang35 {
                   margin-left: 40px;
                   text-indent: -35px;
               }
               table {
                   text-align: right;
               }</style>
         </head>
         <body
            background="https://images.asc.ohio-state.edu/is/image/mediamanager/9/9846d5b7-ad8b-4ffa-be30-4c70ea5dac63.jpg?scale=0.4&amp;rgn=360,440,240,240&amp;op_brightness=20&amp;fmt=png">
            <p align="center"><span class="ProjectTitle">Journal of a Tour to Europe</span><br/> A
               Personal Journal of Samuel Sullivan Cox (1824-1889)</p>
            <hr/>
            <p align="center">
               <a href="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/" target="self"
                  >Project Web Site</a> | <a
                  href="SSCoxJournal-EdIntro.html"
                  target="self"> Ed. Intro</a> || <strong>Views</strong>: <a
                  href="SSCoxJournal-Reading.html"
                  target="self"> Reading</a> | Diplomatic (current/<a
                  href="#view"
                  >about</a>) | <a
                  href="SSCoxJournal-SplitView.html"
                  target="self"> MS Image/Text</a>
               <br/>
            </p>
            <hr/>

            <xsl:apply-templates select="//text/front"/>
            <xsl:apply-templates select="//text/body"/>
            <br/>
            <hr/>
            <strong>Explanatory Annotations</strong>
            <xsl:for-each select="//text//note[@xml:id]">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
                        <xsl:number count="//text//note[@xml:id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
                        <xsl:number count="//text//note[@xml:id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
                        <xsl:number count="//text//note[@xml:id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:otherwise>
               </xsl:choose>

            </xsl:for-each>

            <br/>
            <hr/>
            <strong>Textual Annotations</strong>
            <xsl:for-each select="//app">
               <p class="hang"><a>
                     <xsl:attribute name="name">
                        <xsl:value-of select="@xml:id"/>
                     </xsl:attribute>
                  </a>
                  <xsl:number count="//app" format="a" level="any"/>:<br/><em><xsl:value-of
                        select="lem/@wit"/>:&#xA0;</em>
                  <xsl:apply-templates select="lem"/><br/>
                  <em><xsl:value-of select="rdg/@wit"/>:&#xA0;</em>
                  <xsl:apply-templates select="rdg"/></p>
            </xsl:for-each>

            <xsl:apply-templates select="//text/back"/>


            <hr/>
            <p>
               <strong>About this View of the Journal</strong>
            </p>
            <p><a name="view"/>The text of the journal is organized by manuscript pages. Line breaks
               and page breaks reflect those in the manuscript; paragraph breaks are not reported.
               Spelling, punctuation, capitalization, and abbreviations are reported as they appear
               in the manuscript. Text highlighted by Cox with an underscore is underscored in this
               view. Recoverable text canceled by Cox is reported in red, strikethrough text;
               unrecoverable text canceled by Cox is reported as three x's (regardless of the number
               of characters canceled) in red, strikethrough text. Text added by Cox between lines
               is reported between arrows (&#x2191; &#x2193;) indicating the position of the
               addition; text added in the margin is reported between pipes (|). All material added
               by the editor is surrounded by square brackets: uncertain readings are enclosed in
               square brackets and followed by a question mark, errors in the manuscript are
               indicated by <em>sic</em>, and text supplied by the editors for clarity is set in
               italics. Gaps in the manuscript (e.g., tears) are noted by ellipses within square
               brackets. Links to explanatory notes are numbered, colored, and underlined; links to
               textual annotations are lettered, colored, and underlined. Finally, the background
               consists of a tiled detail from a page of Cox's journal.</p>
            <hr/>
            <p align="left">
               <a href="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/" target="self"
                  >Home</a>
               <br/>
               <br/>
               <emph>Created: <xsl:apply-templates select="//profileDesc/creation/date"/></emph>
            </p>
            <p align="center">
               <xsl:value-of select="//availability/p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
         </body>
      </html>
   </xsl:template>

   <!-- MAJOR STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->

   <xsl:template match="front">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="body">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="back">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="witList"/>

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will appear, or whether they will appear, in your Web page. -->

   <xsl:template match="pb">
      <hr/>
            <!--<br/>
            <span class="pagebreak"> [Page&#xA0;-&#xA0;<xsl:number count="pb" format="1" level="any"
               />&#xA0; (<a><xsl:attribute name="HREF">
                 <xsl:value-of select="@facs"/>  
               </xsl:attribute>
               <xsl:attribute name="target">
                  _blank
               </xsl:attribute>
                  Click to open page image in a new window</a>)] </span>-->
            <br/>
            <span class="pagebreak"> [Page&#xA0;-&#xA0;<xsl:number count="pb" format="1" level="any"
               />&#xA0; (<a><xsl:attribute name="HREF"
                        >http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/CoxZoom.cfm?file=<xsl:value-of
                        select="@n"/>.jpg</xsl:attribute><xsl:attribute name="target"
                     >top</xsl:attribute>Click to open zoomable page image in a new window (may not be available on all systems).</a>)] </span>
   </xsl:template>
   <xsl:template match="lb">
      <br/>
      <a>
         <xsl:attribute name="name">
            <xsl:number count="lb" format="0001" level="any"/>
         </xsl:attribute>
      </a>
      <xsl:number count="lb" format="0001" level="any"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0; 
   </xsl:template>
   <xsl:template match="seg[@type='softhyphen']">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="p">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- ENTRY DATELINES, HEADS, AND ABSTRACTS: This section includes the title and extent 
      from the front section of your text in your output. -->

   <xsl:template match="div1">
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="div1/head">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="div1/opener/dateline">
      <xsl:choose>
         <xsl:when test="ancestor::div1[@audiostart]"> [<a><xsl:attribute name="href"
                     >http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/CoxAudio_JS.cfm?audiostart=<xsl:value-of
                     select="ancestor::div1/@audiostart"/>&amp;audioend=<xsl:value-of
                     select="ancestor::div1/@audioend"/></xsl:attribute><xsl:attribute name="title"
                  >Listen to an audio recording of this entry (new window will
                  open)</xsl:attribute><xsl:attribute name="target">top</xsl:attribute>&#187;</a>]<strong>
               <xsl:apply-templates/>
            </strong>
         </xsl:when>
         <xsl:otherwise>
            <strong>
               <xsl:apply-templates/>
            </strong>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <xsl:template match="hand">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Hanshifts -->
   <xsl:template match="handshift"> [ <xsl:value-of select="@new"/> ] </xsl:template>
   <!-- Gaps in your transcript of the source text (unrecoverable 
   cancellations, tears in the page, and so on). -->
   <xsl:template match="gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ]</xsl:template>

   <!-- Critical Apparatus -->
   <xsl:template match="app">
      <xsl:apply-templates select="lem"/>&#xA0;<a>
         <xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute>
         <sup>
            <xsl:number format="a" level="any" count="app"/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="supplied">[<i>
         <xsl:apply-templates/>
      </i>]</xsl:template>

   <!-- Additions by the author or another hand. -->
   <xsl:template match="add[@place='infralinear']"> &#x2193;<xsl:apply-templates/>&#x2191; </xsl:template>
   <xsl:template match="add[@place='supralinear']"> &#x2191;<xsl:apply-templates/>&#x2193; </xsl:template>
   <xsl:template match="add[@place='top-margin']"> | <xsl:apply-templates/> | </xsl:template>
   <!-- Recoverable deletions by the author or another hand -->
   <xsl:template match="del[@type='recoverable']">
      <span class="cancel">
         <xsl:apply-templates/>
      </span>
   </xsl:template>
   <xsl:template match="del[@type='unrecoverable']">
      <span class="cancel">xxx<xsl:apply-templates/>
      </span>
   </xsl:template>
   <!-- Unclear passages. -->
   <xsl:template match="unclear">[<xsl:apply-templates/>?]</xsl:template>
   <!-- 
	<xsl:template match="orig">
         <xsl:apply-templates/> 
	</xsl:template> -->
   <xsl:template match="orig">
      <xsl:value-of select="@reg"/>
   </xsl:template>
   <xsl:template match="orig[@rend='linebreak']">
      <xsl:value-of select="@reg"/>
      <br/>
   </xsl:template>
   <!-- Nonstandard or erroneous text for which you have encoded a correct 
   alternative. -->
   <xsl:template match="sic"><xsl:apply-templates/> [sic] </xsl:template>
   <!-- 	<xsl:template match="sic">
		<xsl:value-of select="@corr"/>
		</xsl:template> -->
   <xsl:template match="corr">
      <xsl:value-of select="@sic"/> [sic] </xsl:template>
   <!-- 	<xsl:template match="corr">
        	 <xsl:apply-templates/> 
		</xsl:template> -->
   <!--
   <xsl:template match="fw">
       <p>
         <xsl:apply-templates/>
       </p>
   </xsl:template>
		 -->

   <!--MISCELLANEOUS-->

   <!-- Quotes -->
   <xsl:template match="q">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Abbreviations -->
   <xsl:template match="abbr">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Passages in languages other than your document's base language. -->
   <xsl:template match="foreign">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="name[@type='binomial']">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="name[@type='ship']">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>

   <!-- IMAGES (creates a link to a Media Manager image or an image on another 
      Web site [use caution with the latter]). -->

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
      <!--<div class="fl_img_right">
      <img><xsl:attribute name="src">
         <xsl:value-of select="figDesc/xref/@url"/></xsl:attribute>
         <xsl:attribute name="alt"><xsl:value-of select="head"/></xsl:attribute>
      </img><br/><xsl:value-of select="head"/>
      </div>-->
   </xsl:template>

   <xsl:template match="figure[@rend='embedMov']">
      <!--<div class="fl_mov_right">
            <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="320" height="256">
               <xsl:element name="param">
                  <xsl:attribute name="name">src</xsl:attribute>
                  <xsl:attribute name="value"><xsl:value-of select="figDesc/xref/@url"/></xsl:attribute>
               </xsl:element>
               <param name="autoplay" value="false"/>
               <param name="controller" value="true"/>
               <param name="scale" value="aspect"/>
               <xsl:element name="param">
                  <xsl:attribute name="name">starttime</xsl:attribute>
                  <xsl:attribute name="value"><xsl:value-of select="figDesc/xref/@starttime"/></xsl:attribute>
               </xsl:element>
               <xsl:element name="param">
                  <xsl:attribute name="name">endtime</xsl:attribute>
                  <xsl:attribute name="value"><xsl:value-of select="figDesc/xref/@endtime"/></xsl:attribute>
               </xsl:element>
               <xsl:element name="embed">
                  <xsl:attribute name="height">256</xsl:attribute>
                  <xsl:attribute name="width">320</xsl:attribute>
                  <xsl:attribute name="src"><xsl:value-of select="figDesc/xref/@url"/></xsl:attribute>
                  <xsl:attribute name="pluginspace">http://www.apple.com/quicktime/download/</xsl:attribute>
                  <xsl:attribute name="autoplay">false</xsl:attribute>
                  <xsl:attribute name="type">video/quicktime</xsl:attribute>
                  <xsl:attribute name="controller">true</xsl:attribute>
                  <xsl:attribute name="scale">aspect</xsl:attribute>
                  <xsl:attribute name="starttime"><xsl:value-of select="figDesc/xref/@starttime"/></xsl:attribute>
                  <xsl:attribute name="endtime"><xsl:value-of select="figDesc/xref/@endtime"/></xsl:attribute>
               </xsl:element>
            </object><br/>
            <xsl:value-of select="head"/><br/>
         </div>-->
   </xsl:template>
   <xsl:template match="figure[@rend='embedAud']">
      <!--<div class="fl_aud_right">
         <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="200" height="24">
         <xsl:element name="param">
         <xsl:attribute name="name">src</xsl:attribute>
         <xsl:attribute name="value"><xsl:value-of select="figDesc/xref/@url"/></xsl:attribute>
         </xsl:element>
         <param name="autoplay" value="false"/>
         <param name="controller" value="true"/>
         <param name="scale" value="aspect"/>
         <xsl:element name="param">
         <xsl:attribute name="name">starttime</xsl:attribute>
         <xsl:attribute name="value"><xsl:value-of select="lb/@starttime"/></xsl:attribute>
         </xsl:element>
         <xsl:element name="param">
         <xsl:attribute name="name">endtime</xsl:attribute>
         <xsl:attribute name="value"><xsl:value-of select="lb/@endtime"/></xsl:attribute>
         </xsl:element>
         <xsl:element name="embed">
         <xsl:attribute name="height">24</xsl:attribute>
         <xsl:attribute name="width">200</xsl:attribute>
         <xsl:attribute name="src"><xsl:value-of select="figDesc/xref/@url"/></xsl:attribute>
         <xsl:attribute name="pluginspace">http://www.apple.com/quicktime/download/</xsl:attribute>
         <xsl:attribute name="autoplay">false</xsl:attribute>
         <xsl:attribute name="type">video/quicktime</xsl:attribute>
         <xsl:attribute name="controller">true</xsl:attribute>
         <xsl:attribute name="scale">aspect</xsl:attribute>
         <xsl:attribute name="starttime"><xsl:value-of select="lb/@starttime"/></xsl:attribute>
         <xsl:attribute name="endtime"><xsl:value-of select="lb/@endtime"/></xsl:attribute>
         </xsl:element>
         </object><br/>
         <xsl:value-of select="head"/><br/>
         </div>-->
   </xsl:template>

   <!-- NOTES -->

   <xsl:template match="back/div1">
      <hr/>
      <xsl:apply-templates/>
      <br/>
   </xsl:template>
   <xsl:template match="back/div1/head">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="back/div1/listBibl/head">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="note[@target]">
      <a>
         <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
         <sup>
            <xsl:number level="any" count="note[@target]"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="note[@xml:id]"/>
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
   <xsl:template match="xref[@type='collate']">
      <xsl:choose>
         <xsl:when test="parent=figDesc"/>
         <xsl:otherwise>
            <a>
               <xsl:attribute name="href">
                  <xsl:value-of select="@url"/>
               </xsl:attribute>
               <xsl:attribute name="target">_blank</xsl:attribute>
               <xsl:attribute name="title">Link to the corresponding section in A Buckeye
                  Abroad</xsl:attribute>[<xsl:apply-templates/>] </a>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- 
   <xsl:template match="xref">
      <a>
        <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
	<xsl:choose>
	  <xsl:when test="string-length(normalize-space(@imgref))">
	    <img>
	      <xsl:attribute name="src"><xsl:value-of select="@imgref"/></xsl:attribute>
	      <xsl:attribute name="alt"><xsl:apply-templates/></xsl:attribute>
	      <xsl:attribute name="border">0</xsl:attribute>
	      <xsl:attribute name="align">top</xsl:attribute>
	    </img>
          </xsl:when>
	  <xsl:when test="string-length(normalize-space(.)) > 0">
	      <xsl:apply-templates/>
	  </xsl:when>
          <xsl:otherwise>
	    <xsl:value-of select="@url"/>
          </xsl:otherwise>
	</xsl:choose>
      </a>
   </xsl:template>
   -->

   <!-- TITLES -->

   <!--<xsl:template match="//title"><cite><xsl:apply-templates/></cite></xsl:template>-->
   <xsl:template match="head/bibl/title">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="//title[@level='a']"><xsl:apply-templates/></xsl:template>
   <xsl:template match="//title[@level='m']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="//listBibl">
      <p><strong><xsl:value-of select="head"/></strong></p>
      <xsl:for-each select="bibl">
         <xsl:sort select="@n"/>
         <p class="hang25">
            <xsl:apply-templates/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="//listBibl/bibl/author">
      <xsl:apply-templates/>. </xsl:template>
   <xsl:template match="//listBibl/bibl/editor">
      <xsl:apply-templates/>, ed. </xsl:template>
   <xsl:template match="//listBibl/bibl/edition">
      <xsl:apply-templates/> ed. </xsl:template>
   <xsl:template match="//listBibl/bibl/pubPlace">
      <xsl:apply-templates/>: </xsl:template>
   <xsl:template match="//listBibl/bibl/publisher">
      <xsl:apply-templates/>, </xsl:template>
   <xsl:template match="//listBibl/bibl/date">
      <xsl:apply-templates/>. </xsl:template>
   <xsl:template match="//listBibl/bibl/titlePage">
      <center>
         <xsl:apply-templates/>
      </center>
   </xsl:template>
   <xsl:template match="//listBibl/bibl/biblScope[@type='URL']"> <a>
         <xsl:attribute name="href">
            <xsl:value-of select="."/>
         </xsl:attribute>
         <xsl:apply-templates/>
      </a>. </xsl:template>
   <xsl:template match="//listBibl/bibl/biblScope[@type='DateOfVisit']"> Date of visit:
      <xsl:apply-templates/>. </xsl:template>
   <xsl:template match="titlePart[@type='main']">
      <h3>
         <xsl:apply-templates/>
      </h3>
   </xsl:template>
   <xsl:template match="titlePart[@type='sub']">
      <h4>
         <xsl:apply-templates/>
      </h4>
   </xsl:template>

   <!-- TYPOGRAPHY -->

   <xsl:template match="hi">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="hi[@rend='bold']">
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>
   <xsl:template match="hi[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="hi[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="hi[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="emph">
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>
   <xsl:template match="emph[@rend='bold']">
      <b>
         <xsl:apply-templates/>
      </b>
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

   <!-- TABLES -->

   <xsl:template match="table">
      <table border="0">
         <xsl:apply-templates/>
      </table>
   </xsl:template>
   <xsl:template match="row">
      <tr wrap="nowrap">
         <xsl:apply-templates/>
      </tr>
   </xsl:template>
   <xsl:template match="cell">
      <td>
         <xsl:apply-templates/>
      </td>
   </xsl:template>
   <!-- LISTS -->
   <xsl:template match="list">
      <ul>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>
   <xsl:template match="item">
      <li>
         <xsl:apply-templates/>
      </li>
      <br/>
      <br/>
   </xsl:template>
</xsl:stylesheet>