<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript">
function MM_CheckFlashVersion(reqVerStr,msg){
  with(navigator){
    var isIE  = (appVersion.indexOf("MSIE") != -1 && userAgent.indexOf("Opera") == -1);
    var isWin = (appVersion.toLowerCase().indexOf("win") != -1);
    if (!isIE || !isWin){  
      var flashVer = -1;
      if (plugins && plugins.length > 0){
        var desc = plugins["Shockwave Flash"] ? plugins["Shockwave Flash"].description : "";
        desc = plugins["Shockwave Flash 2.0"] ? plugins["Shockwave Flash 2.0"].description : desc;
        if (desc == "") flashVer = -1;
        else{
          var descArr = desc.split(" ");
          var tempArrMajor = descArr[2].split(".");
          var verMajor = tempArrMajor[0];
          var tempArrMinor = (descArr[3] != "") ? descArr[3].split("r") : descArr[4].split("r");
          var verMinor = (tempArrMinor[1] > 0) ? tempArrMinor[1] : 0;
          flashVer =  parseFloat(verMajor + "." + verMinor);
        }
      }
      // WebTV has Flash Player 4 or lower -- too low for video
      else if (userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 4.0;

      var verArr = reqVerStr.split(",");
      var reqVer = parseFloat(verArr[0] + "." + verArr[2]);
  
      if (flashVer < reqVer){
        if (confirm(msg))
          window.location = "http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash";
      }
    }
  } 
}

function MM_timelinePlay(tmLnName, myID) { //v1.2
  //Copyright 1998, 1999, 2000, 2001, 2002, 2003, 2004 Macromedia, Inc. All rights reserved.
  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,propNum,theObj,firstTime=false;
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  tmLn = document.MM_Time[tmLnName];
  if (myID == null) { myID = ++tmLn.ID; firstTime=true;}//if new call, incr ID
  if (myID == tmLn.ID) { //if Im newest
    setTimeout('MM_timelinePlay("'+tmLnName+'",'+myID+')',tmLn.delay);
    fNew = ++tmLn.curFrame;
    for (i=0; i<tmLn.length; i++) {
      sprite = tmLn[i];
      if (sprite.charAt(0) == 's') {
        if (sprite.obj) {
          numKeyFr = sprite.keyFrames.length; firstKeyFr = sprite.keyFrames[0];
          if (fNew >= firstKeyFr && fNew <= sprite.keyFrames[numKeyFr-1]) {//in range
            keyFrm=1;
            for (j=0; j<sprite.values.length; j++) {
              props = sprite.values[j]; 
              if (numKeyFr != props.length) {
                if (props.prop2 == null) sprite.obj[props.prop] = props[fNew-firstKeyFr];
                else        sprite.obj[props.prop2][props.prop] = props[fNew-firstKeyFr];
              } else {
                while (keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]) keyFrm++;
                if (firstTime || fNew==sprite.keyFrames[keyFrm-1]) {
                  if (props.prop2 == null) sprite.obj[props.prop] = props[keyFrm-1];
                  else        sprite.obj[props.prop2][props.prop] = props[keyFrm-1];
        } } } } }
      } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);
      if (fNew > tmLn.lastFrame) tmLn.ID = 0;
  } }
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_timelineGoto(tmLnName, fNew, numGotos) { //v2.0
  //Copyright 1998, 1999, 2000, 2001, 2002, 2003, 2004 Macromedia, Inc. All rights reserved.
  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,lastKeyFr,propNum,theObj;
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  tmLn = document.MM_Time[tmLnName];
  if (numGotos != null)
    if (tmLn.gotoCount == null) tmLn.gotoCount = 1;
    else if (tmLn.gotoCount++ >= numGotos) {tmLn.gotoCount=0; return}
  jmpFwd = (fNew > tmLn.curFrame);
  for (i = 0; i < tmLn.length; i++) {
    sprite = (jmpFwd)? tmLn[i] : tmLn[(tmLn.length-1)-i]; //count bkwds if jumping back
    if (sprite.charAt(0) == "s") {
      numKeyFr = sprite.keyFrames.length;
      firstKeyFr = sprite.keyFrames[0];
      lastKeyFr = sprite.keyFrames[numKeyFr - 1];
      if ((jmpFwd && fNew<firstKeyFr) || (!jmpFwd && lastKeyFr<fNew)) continue; //skip if untouchd
      for (keyFrm=1; keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]; keyFrm++);
      for (j=0; j<sprite.values.length; j++) {
        props = sprite.values[j];
        if (numKeyFr == props.length) propNum = keyFrm-1 //keyframes only
        else propNum = Math.min(Math.max(0,fNew-firstKeyFr),props.length-1); //or keep in legal range
        if (sprite.obj != null) {
          if (props.prop2 == null) sprite.obj[props.prop] = props[propNum];
          else        sprite.obj[props.prop2][props.prop] = props[propNum];
      } }
    } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);
  }
  tmLn.curFrame = fNew;
  if (tmLn.ID == 0) eval('MM_timelinePlay(tmLnName)');
}

function MM_timelineStop(tmLnName) { //v1.2
  //Copyright 1998, 1999, 2000, 2001, 2002, 2003, 2004 Macromedia, Inc. All rights reserved.
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  if (tmLnName == null)  //stop all
    for (var i=0; i<document.MM_Time.length; i++) document.MM_Time[i].ID = null;
  else document.MM_Time[tmLnName].ID = null; //stop one
}

function MM_initTimelines() { //v4.0
    //MM_initTimelines() Copyright 1997 Macromedia, Inc. All rights reserved.
    var ns = navigator.appName == "Netscape";
    var ns4 = (ns && parseInt(navigator.appVersion) == 4);
    var ns5 = (ns && parseInt(navigator.appVersion) > 4);
    var macIE5 = (navigator.platform ? (navigator.platform == "MacPPC") : false) && (navigator.appName == "Microsoft Internet Explorer") && (parseInt(navigator.appVersion) >= 4);
    document.MM_Time = new Array(4);
    document.MM_Time[0] = new Array(1);
    document.MM_Time["Timeline1"] = document.MM_Time[0];
    document.MM_Time[0].MM_Name = "Timeline1";
    document.MM_Time[0].fps = 15;
    document.MM_Time[0][0] = new String("sprite");
    document.MM_Time[0][0].slot = 1;
    if (ns4)
        document.MM_Time[0][0].obj = document["apDiv20"];
    else if (ns5)
        document.MM_Time[0][0].obj = document.getElementById("apDiv20");
    else
        document.MM_Time[0][0].obj = document.all ? document.all["apDiv20"] : null;
    document.MM_Time[0][0].keyFrames = new Array(1, 15);
    document.MM_Time[0][0].values = new Array(2);
    if (ns5 || macIE5)
        document.MM_Time[0][0].values[0] = new Array("1099px", "1039px", "979px", "919px", "860px", "800px", "740px", "680px", "620px", "560px", "500px", "441px", "381px", "321px", "261px");
    else
        document.MM_Time[0][0].values[0] = new Array(1099,1039,979,919,860,800,740,680,620,560,500,441,381,321,261);
    document.MM_Time[0][0].values[0].prop = "left";
    if (ns5 || macIE5)
        document.MM_Time[0][0].values[1] = new Array("191px", "191px", "190px", "190px", "190px", "190px", "189px", "189px", "189px", "188px", "188px", "188px", "188px", "187px", "187px");
    else
        document.MM_Time[0][0].values[1] = new Array(191,191,190,190,190,190,189,189,189,188,188,188,188,187,187);
    document.MM_Time[0][0].values[1].prop = "top";
    if (!ns4) {
        document.MM_Time[0][0].values[0].prop2 = "style";
        document.MM_Time[0][0].values[1].prop2 = "style";
    }
    document.MM_Time[0].lastFrame = 15;
    document.MM_Time[1] = new Array(1);
    document.MM_Time["Timeline2"] = document.MM_Time[1];
    document.MM_Time[1].MM_Name = "Timeline2";
    document.MM_Time[1].fps = 15;
    document.MM_Time[1][0] = new String("sprite");
    document.MM_Time[1][0].slot = 1;
    if (ns4)
        document.MM_Time[1][0].obj = document["apDiv1"];
    else if (ns5)
        document.MM_Time[1][0].obj = document.getElementById("apDiv1");
    else
        document.MM_Time[1][0].obj = document.all ? document.all["apDiv1"] : null;
    document.MM_Time[1][0].keyFrames = new Array(1, 15);
    document.MM_Time[1][0].values = new Array(2);
    if (ns5 || macIE5)
        document.MM_Time[1][0].values[0] = new Array("1102px", "1056px", "1009px", "963px", "917px", "870px", "824px", "778px", "731px", "685px", "638px", "592px", "546px", "499px", "453px");
    else
        document.MM_Time[1][0].values[0] = new Array(1102,1056,1009,963,917,870,824,778,731,685,638,592,546,499,453);
    document.MM_Time[1][0].values[0].prop = "left";
    if (ns5 || macIE5)
        document.MM_Time[1][0].values[1] = new Array("188px", "188px", "188px", "188px", "188px", "188px", "188px", "188px", "188px", "188px", "188px", "188px", "188px", "188px", "188px");
    else
        document.MM_Time[1][0].values[1] = new Array(188,188,188,188,188,188,188,188,188,188,188,188,188,188,188);
    document.MM_Time[1][0].values[1].prop = "top";
    if (!ns4) {
        document.MM_Time[1][0].values[0].prop2 = "style";
        document.MM_Time[1][0].values[1].prop2 = "style";
    }
    document.MM_Time[1].lastFrame = 15;
    document.MM_Time[2] = new Array(2);
    document.MM_Time["Timeline3"] = document.MM_Time[2];
    document.MM_Time[2].MM_Name = "Timeline3";
    document.MM_Time[2].fps = 15;
    document.MM_Time[2][0] = new String("behavior");
    document.MM_Time[2][0].frame = 16;
    document.MM_Time[2][0].value = "MM_timelineGoto('Timeline3','1')";
    document.MM_Time[2][1] = new String("sprite");
    document.MM_Time[2][1].slot = 1;
    if (ns4)
        document.MM_Time[2][1].obj = document["apDiv2"];
    else if (ns5)
        document.MM_Time[2][1].obj = document.getElementById("apDiv2");
    else
        document.MM_Time[2][1].obj = document.all ? document.all["apDiv2"] : null;
    document.MM_Time[2][1].keyFrames = new Array(1, 15);
    document.MM_Time[2][1].values = new Array(2);
    if (ns5 || macIE5)
        document.MM_Time[2][1].values[0] = new Array("1101px", "1066px", "1031px", "996px", "961px", "926px", "891px", "857px", "822px", "787px", "752px", "717px", "682px", "647px", "612px");
    else
        document.MM_Time[2][1].values[0] = new Array(1101,1066,1031,996,961,926,891,857,822,787,752,717,682,647,612);
    document.MM_Time[2][1].values[0].prop = "left";
    if (ns5 || macIE5)
        document.MM_Time[2][1].values[1] = new Array("358px", "359px", "360px", "361px", "363px", "364px", "365px", "366px", "367px", "368px", "369px", "371px", "372px", "373px", "374px");
    else
        document.MM_Time[2][1].values[1] = new Array(358,359,360,361,363,364,365,366,367,368,369,371,372,373,374);
    document.MM_Time[2][1].values[1].prop = "top";
    if (!ns4) {
        document.MM_Time[2][1].values[0].prop2 = "style";
        document.MM_Time[2][1].values[1].prop2 = "style";
    }
    document.MM_Time[2].lastFrame = 16;
    document.MM_Time[3] = new Array(0);
    document.MM_Time["Timeline4"] = document.MM_Time[3];
    document.MM_Time[3].MM_Name = "Timeline4";
    document.MM_Time[3].fps = 15;
    document.MM_Time[3].lastFrame = 0;
    for (i=0; i<document.MM_Time.length; i++) {
        document.MM_Time[i].ID = null;
        document.MM_Time[i].curFrame = 0;
        document.MM_Time[i].delay = 1000/document.MM_Time[i].fps;
    }
}
</script>
<style type="text/css">
<!--
.style2 {font-family: Georgia, "Times New Roman", Times, serif; font-size:20px; }
.style3 {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-weight: bold;
}

#apDiv19 {
	position:absolute;
	left:1095px;
	top:162px;
	width:214px;
	height:228px;
	z-index:8;
	background-color: #796239;
}
#apDiv20 {
	position:absolute;
	left:1101px;
	top:191px;
	width:160px;
	height:76px;
	z-index:5;
	background-color: #796239;
}
#apDiv1 {
	position:absolute;
	left:1102px;
	top:188px;
	width:157px;
	height:200px;
	z-index:7;
}
#apDiv2 {
	position:absolute;
	left:1103px;
	top:354px;
	width:156px;
	height:0px;
	z-index:6;
}
-->
</style>
</head>

<body bgcolor="#796239" leftmargin="10" rightmargin="10" onload="MM_preloadImages('Button Bank/Home-Button-Down.gif','Button Bank/Home-Button-MO.gif','Button Bank/Vision-Button-Down.gif','Button Bank/Vision-Button-MO.gif','Button Bank/Tour-Button-Down.gif','Button Bank/Tour-Button-MO.gif','Button Bank/Program-Button-Down.gif','Button Bank/Program-Button-MO.gif','Button Bank/Forms-Button-Over.gif','Button Bank/Addiction-Info-Button-Down.gif','Button Bank/Addiction-Info-Button-MO.gif','Button Bank/Links-button-Down.gif','Button Bank/Links-Button-MO.gif','Button Bank/Contact-Us-Button-Down.gif','Button Bank/Contact-Us-Button-MO.gif','Button Bank/Fred-Button-MO.gif','Button Bank/Tom-Button-MO.gif','Button Bank/Jacob-Button-MO.gif','Button Bank/Application-Button-MO.gif','Button Bank/Orientation-Button-MO.gif','Button Bank/Personal-Right-MO.gif','Button Bank/Consent-One-Button-MO.gif','Button Bank/Consent-Button-Two-MO.gif','Button Bank/HIPAA-Button-MO.gif','Button Bank/More-Button-MO.gif','Button Bank/Info-Packet-Button-MO.gif','Button Bank/Forms-Button-Down.gif','Button Bank/Tom-Button-DOWN.gif','Button Bank/Jacob-Button-Down.gif','Button Bank/Application-Button-Down.gif','Button Bank/Orientation-Button-DOWN.gif','Button Bank/Participation-Button-Down.gif','Button Bank/Personal-Rights-Button-Down.gif','Button Bank/Consent-One-Button-DOWN.gif','Button Bank/Consent-Two-Button-Down.gif','Button Bank/HIPAA-Button-Down.gif','Button Bank/More-Button-Down.gif','Button Bank/Info-Packet-Button-Down.gif','Button Bank/Staff-Button-MO.gif')">
<div id="apDiv19"></div>
<div id="apDiv20" style="left: 1099px" onmouseover="MM_timelineGoto('Timeline1','15')" onmouseout="MM_timelineGoto('Timeline1','1');MM_timelineStop('Timeline1')"><a href="fredrfraser.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Fred Button Up','','Button Bank/Fred-Button-Down.gif',1)"><img src="Button Bank/Fred-Button.gif" alt="Fred R Fraser" name="Fred Button Up" width="160" height="25" border="0" id="Fred Button Up" /></a><a href="tomwenztphd.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Tom Wentz PhD','','Button Bank/Tom-Button-DOWN.gif',1)"><img src="Button Bank/Tom-Button.gif" alt="Tom Wentz Phd" name="Tom Wentz PhD" width="160" height="25" border="0" id="Tom Wentz PhD" /></a><a href="jacobhbirdbs.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Jacob H Bird BS','','Button Bank/Jacob-Button-Down.gif',1)"><a href="jacobhbirdbs.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Jacob H Bird BS','','Button Bank/Jacob-Button-Down.gif',1)"><img src="Button Bank/Jacob-Button.gif" alt="Jacob H Bird BS" name="Jacob H Bird BS" width="160" height="25" border="0" id="Jacob H Bird BS" /></a></div>
<div id="apDiv1" style="left: 1102px" onmouseover="MM_timelineGoto('Timeline2','15')" onmouseout="MM_timelineGoto('Timeline2','1');MM_timelineStop('Timeline2')"><a href="application.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Application','','Button Bank/Application-Button-Down.gif',1)"><img src="Button Bank/Application-Button-Up.gif" alt="Application" name="Application" width="159" height="25" border="0" id="Application" /></a><a href="orientation.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Orientation','','Button Bank/Orientation-Button-DOWN.gif',1)"><img src="Button Bank/Orientation-Button.gif" alt="Orientation" name="Orientation" width="159" height="25" border="0" id="Orientation" /></a><a href="participation.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Participation','','Button Bank/Participation-Button-Down.gif',1)"><img src="Button Bank/Participation-Button.gif" alt="Participation" name="Participation" width="159" height="25" border="0" id="Participation" /></a><a href="personalrights.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Personal Rights','','Button Bank/Personal-Rights-Button-Down.gif',1)"><img src="Button Bank/Personal-Rights-Button.gif" alt="Personal Rights" name="Personal Rights" width="159" height="25" border="0" id="Personal Rights" /></a><a href="consentone.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Consent One','','Button Bank/Consent-One-Button-DOWN.gif',1)"><img src="Button Bank/Consent-One-Button.gif" alt="Consent One" name="Consent One" width="159" height="25" border="0" id="Consent One" /></a><a href="consenttwo.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Consent Two','','Button Bank/Consent-Two-Button-Down.gif',1)"><img src="Button Bank/Consent-Two-Button.gif" alt="Consent Two" name="Consent Two" width="159" height="25" border="0" id="Consent Two" /></a><a href="hipaa.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('HIPAA','','Button Bank/HIPAA-Button-Down.gif',1)"><img src="Button Bank/HIPAA-Button.gif" alt="HIPAA" name="HIPAA" width="159" height="25" border="0" id="HIPAA" /></a><a href="more.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('More','','Button Bank/More-Button-Down.gif',1)"><img src="Button Bank/More-Button-UDA.gif" alt="More" name="More" width="159" height="25" border="0" id="More" onmouseover="MM_timelineGoto('Timeline3','15')" onmouseout="MM_timelineGoto('Timeline3','1');MM_timelineStop('Timeline3')" /></a></div>
<div id="apDiv2" style="left: 1101px; top: 358px;" onmouseover="MM_timelineGoto('Timeline3','15');MM_timelineGoto('Timeline2','15')" onmouseout="MM_timelineGoto('Timeline3','1');MM_timelineStop('Timeline3');MM_timelineGoto('Timeline2','1');MM_timelineStop('Timeline2')"><a href="infopacket.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Info Packet','','Button Bank/Info-Packet-Button-Down.gif',1)"><img src="Button Bank/Info-Packet-Button.gif" alt="Info Packet" name="Info Packet" width="182" height="25" border="0" id="Info Packet" /></a></div>
<table width="1083" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#FFF"><table width="1083" border="0" cellspacing="0" cellpadding="0"><tr><td width="905" bgcolor="#CCCCCC" valign="top" ><table width="1083" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1083" height="129px" align="center" bgcolor="#FFFFFF"><table width="1080" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="155px" width="350" align="center" valign="middle" background="Call-Banner-Left.gif"><img src="ADC_logo3.gif" alt="Transitional Living" width="310" height="129" /></td>
        <td width="288" background="Call-Banner-Middle.gif" align="center"><p align="right" class="style3">Fighting Addictions, <br />
                  <br />
                  <strong>Saving Lives. &nbsp; &nbsp; </strong></p></td>
        <td width="442" background="call-girl-one.jpg" valign="top"><script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','442','height','155','title','Call DreamCatcher','src','upper right flash','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','upper right flash' ); //end AC code
        </script>
          <noscript>
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="442" height="155" title="Call DreamCatcher">
            <param name="movie" value="upper right flash.swf" />
            <param name="quality" value="high" />
            <embed src="upper right flash.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="442" height="155"></embed>
          </object>
          </noscript></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#FFF"><table width="1083" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="905" bgcolor="#CCCCCC" valign="top" ><table width="911" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="911" height="301" valign="top"><table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><a href="index.html" target="_top" onclick="MM_nbGroup('down','group1','Home','Button Bank/Home-Button-Down.gif',1)" onmouseover="MM_nbGroup('over','Home','Button Bank/Home-Button-MO.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Home-Button.gif" alt="" name="Home" width="80" height="25" border="0" id="Home" onload="" /></a></td>
                <td><a href="vision.html" target="_top" onclick="MM_nbGroup('down','group1','Vision','Button Bank/Vision-Button-Down.gif',1)" onmouseover="MM_nbGroup('over','Vision','Button Bank/Vision-Button-MO.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Vision-Button.gif" alt="" name="Vision" width="80" height="25" border="0" id="Vision" onload="" /></a></td>
                <td><a href="tour.html" target="_top" onclick="MM_nbGroup('down','group1','Tour','Button Bank/Tour-Button-Down.gif',1)" onmouseover="MM_nbGroup('over','Tour','Button Bank/Tour-Button-MO.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Tour-Button.gif" alt="" name="Tour" border="0" id="Tour" onload="" /></a></td>
                <td><a href="javascript:;" target="_top" onclick="MM_nbGroup('down','group1','Staff','',1)" onmouseover="MM_nbGroup('over','Staff','Button Bank/Staff-Button-MO.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Staff-Button.gif" alt="" name="Staff" border="0" id="Staff" onclick="MM_timelinePlay('Timeline1')" onmouseout="MM_timelineGoto('Timeline1','1');MM_timelineStop('Timeline1')" /></a></td>
                <td><a href="programs.html" target="_top" onclick="MM_nbGroup('down','group1','Programs','Button Bank/Program-Button-Down.gif',1)" onmouseover="MM_nbGroup('over','Programs','Button Bank/Program-Button-MO.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Programs-Button.gif" alt="" name="Programs" border="0" id="Programs" onload="" /></a></td>
                <td><a href="javascript:;" target="_top" onclick="MM_nbGroup('down','group1','FormsandAdmissions','',1)" onmouseover="MM_nbGroup('over','FormsandAdmissions','Button Bank/Forms-Button-Over.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Forms-Buttons-Up.gif" alt="" name="FormsandAdmissions" border="0" id="FormsandAdmissions" onclick="MM_timelinePlay('Timeline2')" onmouseout="MM_timelineGoto('Timeline2','1');MM_timelineStop('Timeline2')" onload="" /></a></td>
                <td><a href="addiction.html" target="_top" onclick="MM_nbGroup('down','group1','AddictionInformation','Button Bank/Addiction-Info-Button-Down.gif',1)" onmouseover="MM_nbGroup('over','AddictionInformation','Button Bank/Addiction-Info-Button-MO.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Addiction-Info-Button.gif" alt="" name="AddictionInformation" border="0" id="AddictionInformation" onload="" /></a></td>
                <td><a href="links.html" target="_top" onclick="MM_nbGroup('down','group1','Links','Button Bank/Links-button-Down.gif',1)" onmouseover="MM_nbGroup('over','Links','Button Bank/Links-Button-MO.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Links-Button.gif" alt="" name="Links" border="0" id="Links" onload="" /></a></td>
                <td><a href="contact.html" target="_top" onclick="MM_nbGroup('down','group1','ContactUs','Button Bank/Contact-Us-Button-Down.gif',1)" onmouseover="MM_nbGroup('over','ContactUs','Button Bank/Contact-Us-Button-MO.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="Button Bank/Contact-Us-Button.gif" alt="" name="ContactUs" border="0" id="ContactUs" onload="" /></a></td>
              </tr>
            </table>
              <img src="dreamflash.jpg" alt="okay" width="910px" height="300" /></td>
          </tr>
          <tr>
            <td align="center"><table width="850" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30" height="32">&nbsp;</td>
                <td width="867">&nbsp;</td>
                <td width="6">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td valign="top" align="left"><table width="852" height="988" border="0" cellpadding="0" cellspacing="0">
                  <tr valign="top" align="left">
                    <td width="852" height="265" valign="middle" align="justify" ><p><span class="style2">&nbsp; &nbsp; &nbsp; &nbsp;</span><span class="style2"><strong>DreamCatcher Transitional Living and Mentoring Program</strong> offers an encouraging and supportive transitional living and  mentoring environment that provides professional guidance and  individualized programing. This home offers its services to those that wish to recover in a smaller, more descrete, <a href="tour.html">facility</a>. DreamCatcher Transitional Living home offers superior  amenities, warmth and comfort within a small community (maximum of six  residents) and the very finest in desert living. 
                        DreamCatcher is for men (age 18 and above) who have  successfully completed primary and/or extended residential alcohol and drug  rehab/treatment and who have felt and recognized the need for further growth in  early recovery. </span></p>
                      </td>
                  </tr>
                  <tr>
                    <td height="713" valign="top"><table width="852" height="347" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="488" height="345" valign="top"><p align="center">&nbsp;</p>
                                      <p align="center" class="style2"><strong>Mentoring (Skills Building, Anger Managemet, Emotional   Intelligence)</strong></p>
                          <p align="left" class="style2">• 1:1 Mentoring relationship with a licensed counselor; <br />
                                          <br />
                            •   Case management services; <br />
                            <br />
                            • Assessment-based, Life-Skills determination   and an individualized program of personal development; <br />
                            <br />
                            •   Emotional Intelligence Skills Building Curriculum Option (Stress and Anger   Management, Communication Skills). <br />
                            <br />
                            • Referrals and Resources: <br />
                            <br />
                            • Outpatient and Therapeutic Aftercare Programs. </p></td>
                        <td width="364" valign="top"><img src="frontimag6.2.jpg" alt="Welcom To DreamCatcher" width="370" height="546" /></td>
                      </tr>
                    </table></td>
                  </tr>
                </table>
                          <p>&nbsp;</p>
                  <p>&nbsp;</p>
                  <p>&nbsp;</p></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
                    <p align="justify">&nbsp;</p>
              <p align="justify">&nbsp;</p>
              <p align="justify">&nbsp;</p>
              <p align="justify">&nbsp;</p>
              <p align="justify">&nbsp;</p></td>
          </tr>
        </table></td>
        <td height= "630" width="178"    background="Right-Side-Bar.gif"c align="center" valign="top" style="font-family: Arial, Helvetica, sans-serif"><p>&nbsp;</p>
              <p><strong>WELCOME TO THE</strong></p>
          <p><strong>DREAMCATCHER</strong></p>
          <p><strong>TRANSITIONAL</strong></p>
          <p><strong>LIVING HOME </strong><strong>PAGE!</strong></p>
          <p>&nbsp;</p>
          <p><img src="Button Bank/24-hour-a-day-call-box.gif" width="150" height="96" /></p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <form id="form1" name="form1" method="post" action="">
                <p><strong>First Name</strong></p>
            <p> <strong>
                  <input type="text" name="textfield" id="textfield" />
                </strong> </p>
            <p><strong>Last Name</strong></p>
            <p>
                  <label>
                  <input type="text" name="textfield2" id="textfield2" />
                  </label>
                </p>
            <p><strong>Email Address</strong></p>
            <p>
                  <label>
                  <input type="text" name="textfield3" id="textfield3" />
                  </label>
                </p>
            <p><strong>Phone Number</strong></p>
            <p>
                  <label>
                  <input type="text" name="textfield4" id="textfield4" />
                  </label>
                </p>
            <p><strong>Message</strong></p>
            <p>
                  <label>
                  <input type="text" name="Message" id="Message" />
                  </label>
                </p>
            <p>
                  <label></label>
                </p>
            <p>
                  <label></label>
                  <label>
                  <input type="submit" name="button" id="button" value="Submit" />
                  </label>
                </p>
            <p>&nbsp; </p>
          </form>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p></td>
      </tr>
    </table></td>
  </tr>
</table>  <table width="911" border="0" cellspacing="0" cellpadding="0">
</table></td>
        </tr>
</table></td></tr>
</table>



</body>
</html>
