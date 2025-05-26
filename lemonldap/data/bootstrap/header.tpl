<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
 <title trspan="authPortal">Authentication portal</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <meta http-equiv="Content-Script-Type" content="text/javascript" />
 <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
 <meta http-equiv="Pragma" content="no-cache" />
 <meta http-equiv="Expires" content="0" />
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link rel="stylesheet" type="text/css" href="<TMPL_VAR NAME="STATIC_PREFIX">bwr/bootstrap/dist/css/bootstrap.min.css" />
 <link rel="stylesheet" type="text/css" href="<TMPL_VAR NAME="STATIC_PREFIX">bwr/font-awesome/css/font-awesome.min.css" />
 <link rel="stylesheet" type="text/css" href="<TMPL_VAR NAME="STATIC_PREFIX"><TMPL_VAR NAME="SKIN">/css/styles.min.css" />
 <link rel="stylesheet" type="text/css" href="<TMPL_VAR NAME="SCRIPTNAME">portal.css" />
 <TMPL_IF NAME="CUSTOM_CSS">
 <link rel="stylesheet" type="text/css" href="<TMPL_VAR NAME="STATIC_PREFIX"><TMPL_VAR NAME="CUSTOM_CSS">" />
 </TMPL_IF>
 <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
 <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
 <!--[if lt IE 9]>
   <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
   <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
 <![endif]-->
 <link href="<TMPL_VAR NAME="STATIC_PREFIX"><TMPL_VAR NAME="FAVICON">" rel="icon" type="image/vnd.microsoft.icon" sizes="16x16 32x32 48x48 64x64 128x128" />
 <link href="<TMPL_VAR NAME="STATIC_PREFIX"><TMPL_VAR NAME="FAVICON">" rel="shortcut icon" type="image/vnd.microsoft.icon" sizes="16x16 32x32 48x48 64x64 128x128" />
 <TMPL_IF NAME="PROVIDERURI">
  <link rel="openid.server" href="<TMPL_VAR NAME="PROVIDERURI">" />
  <link rel="openid2.provider" href="<TMPL_VAR NAME="PROVIDERURI">" />
 </TMPL_IF>
 <TMPL_INCLUDE NAME="../common/script.tpl">
  <script type="text/javascript" src="<TMPL_VAR NAME="STATIC_PREFIX"><TMPL_VAR NAME="SKIN">/js/skin.min.js"></script>
  <script type="text/javascript" src="<TMPL_VAR NAME="STATIC_PREFIX">common/js/portal.min.js"></script>
  <script type="text/javascript" src="/javascript/bootstrap4/js/bootstrap.min.js"></script>
 <TMPL_IF NAME="CUSTOM_JS">
  <script type="text/javascript" src="<TMPL_VAR NAME="STATIC_PREFIX"><TMPL_VAR NAME="CUSTOM_JS">"></script>
 </TMPL_IF>
 <TMPL_VAR NAME="CUSTOM_SCRIPT">
 <TMPL_INCLUDE NAME="customhead.tpl">
</head>
<body>

  <div id="wrap">

    <div id="header"><TMPL_INCLUDE NAME="customheader.tpl"></div>