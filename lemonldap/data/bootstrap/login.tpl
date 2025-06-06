<TMPL_INCLUDE NAME="header.tpl">

<main id="logincontent" class="container">

  <TMPL_INCLUDE NAME="customLoginHeader.tpl">

  <TMPL_IF AUTH_LOOP>
    <div id="authMenuWrapper" class="card">
      <div class="row align-items-center">
        <!-- Image Column -->
        <div class="col-md-6 text-center">
          <img src="<TMPL_VAR NAME="STATIC_PREFIX">common/modules/heroAuth.png" width="350" />
        </div>
        <!-- Authentication Column -->
      <div class="col-md-6">
      <div id="authMenu">

      <!-- Authentication loop -->
      <nav class="navbar navbar-expand-lg navbar-expand-sm navbar-light bg-light">

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Choice tabs -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <TMPL_LOOP NAME="AUTH_LOOP">
            <li class="nav-item" title="<TMPL_VAR NAME="key">"><a class="nav-link" href="#<TMPL_VAR NAME="key">"><TMPL_VAR NAME="name"></a></li>
          </TMPL_LOOP>
        </ul>
      </div>

      </nav>

      <div>
        <!-- Forms -->
        <TMPL_LOOP NAME="AUTH_LOOP">

          <div id="<TMPL_VAR NAME="key">">

            <form id="lform<TMPL_VAR NAME="module">" action="<TMPL_VAR NAME="url">" method="post" class="login <TMPL_VAR NAME="module">">

              <!-- Hidden fields -->
              <TMPL_VAR NAME="HIDDEN_INPUTS">
              <input type="hidden" name="url" value="<TMPL_VAR NAME="AUTH_URL">" />
              <input type="hidden" name="timezone" />
              <input type="hidden" name="<TMPL_VAR NAME="CHOICE_PARAM">" value="<TMPL_VAR NAME="key">" />
              <input type="hidden" name="skin" value="<TMPL_VAR NAME="SKIN">" />

              <TMPL_IF NAME="standardform">
                <TMPL_INCLUDE NAME="standardform.tpl">
              </TMPL_IF>

              <TMPL_IF NAME="openidform">
                <TMPL_INCLUDE NAME="openidform.tpl">
              </TMPL_IF>

              <TMPL_IF NAME="yubikeyform">
                <TMPL_INCLUDE NAME="yubikeyform.tpl">
              </TMPL_IF>

              <TMPL_IF NAME="sslform">
                <TMPL_INCLUDE NAME="sslformChoice.tpl">

                <!-- Remember my authentication choice for this module -->
                <TMPL_IF NAME="REMEMBERAUTHCHOICE">
                  <input type="hidden" id="rememberauthchoice" name="rememberauthchoice" value="<TMPL_IF NAME="REMEMBERAUTHCHOICEDEFAULTCHECKED">true</TMPL_IF>" />
                </TMPL_IF>

              </TMPL_IF>

              <TMPL_IF NAME="webauthnform">
                <TMPL_INCLUDE NAME="webauthnform.tpl">

                <!-- Remember my authentication choice for this module -->
                <TMPL_IF NAME="REMEMBERAUTHCHOICE">
                  <input type="hidden" id="rememberauthchoice" name="rememberauthchoice" value="<TMPL_IF NAME="REMEMBERAUTHCHOICEDEFAULTCHECKED">true</TMPL_IF>" />
                </TMPL_IF>
              </TMPL_IF>

              <TMPL_IF NAME="gpgform">
                <TMPL_INCLUDE NAME="gpgform.tpl">
              </TMPL_IF>

              <TMPL_IF NAME="logo">

                <div class="form">

                  <TMPL_IF NAME="logoFile">
                    <video width="340" height="160" autoplay loop muted class="col-md-12 col-sm-12">
                      <source src="<TMPL_VAR NAME="STATIC_PREFIX">common/modules/<TMPL_VAR NAME="logoFile">.mp4" type="video/mp4">
                      Your browser does not support the video tag.
                    </video>
                  </TMPL_IF>

                  <TMPL_INCLUDE NAME="impersonation.tpl">
                  <TMPL_INCLUDE NAME="checklogins.tpl">

                  <div class="buttons">
                    <button type="submit" class="ibtn btn btn-primary">
                      <span class="fa fa-sign-in"></span>
                      <span trspan="connect">Connect</span>
                    </button>
                  </div>

                </div>

                <!-- Remember my authentication choice for this module -->
                <TMPL_IF NAME="REMEMBERAUTHCHOICE">
                  <input type="hidden" id="rememberauthchoice" name="rememberauthchoice" value="<TMPL_IF NAME="REMEMBERAUTHCHOICEDEFAULTCHECKED">true</TMPL_IF>" />
                </TMPL_IF>

              </TMPL_IF>

            </form>

          </div>

        </TMPL_LOOP>

      </div>

    </div> </div> </div> </div> <!-- end authMenu --> <!-- end authMenuWrapper -->

    <TMPL_IF NAME="REMEMBERAUTHCHOICE">
    <div class="input-group col-md-6 offset-md-3">

      <!-- Global checkbox for remembering the authentication choice for all modules -->
      <div id="globalrememberauthchoicecontainer" class="input-group-prepend input-group">
        <div class="input-group-text">
          <input type="checkbox" id="globalrememberauthchoice" name="globalrememberauthchoice" aria-describedby="globalrememberauthchoiceLabel" <TMPL_IF NAME="REMEMBERAUTHCHOICEDEFAULTCHECKED">checked</TMPL_IF> />
          <input id="rememberCookieName" name="rememberCookieName" type="hidden" value="<TMPL_VAR NAME="REMEMBERAUTHCHOICECOOKIENAME">">
        </div>
          <p class="form-control">
            <label id="globalrememberauthchoiceLabel" for="globalrememberauthchoice" trspan="rememberChoice">Remember my choice</label>
          </p>
      </div>

      <!-- Timer + stop button for triggering the remembered authentication choice -->
      <div id="remembertimercontainer" class="input-group">
        <p class="form-control">
          <span id="remembertimer"><TMPL_VAR NAME="REMEMBERAUTHCHOICETIMER"></span>
          <label id="rememberTimerLabel" trspan="rememberTimerLabel">s before automatic authentication</label>
        </p>
        <input id="rememberStopped" name="rememberStopped" type="hidden" value="">
        <div class="input-group-append inout-group">
          <button class="btn btn-danger" id="buttonRememberStopped"><i class="fa fa-stop-circle-o"></i> Stop</button>
        </div>
      </div>
    </div>
    </TMPL_IF>

  </TMPL_IF>

  <TMPL_IF NAME="DISPLAY_FORM">
  <div class="card">
  <TMPL_IF NAME="module">
    <form id="lform" action="#" method="post" class="login <TMPL_VAR NAME="module">" role="form">
  <TMPL_ELSE>
    <form id="lform" action="#" method="post" class="login" role="form">
  </TMPL_IF>
    <!-- Hidden fields -->
    <TMPL_VAR NAME="HIDDEN_INPUTS">
    <input type="hidden" name="url" value="<TMPL_VAR NAME="AUTH_URL">" />
    <input type="hidden" name="timezone" />
    <input type="hidden" name="skin" value="<TMPL_VAR NAME="SKIN">" />
    <TMPL_INCLUDE NAME="standardform.tpl">
    </form>
  </div>
  </TMPL_IF>

  <TMPL_IF NAME="DISPLAY_OPENID_FORM">
  <div class="card">
  <TMPL_IF NAME="module">
    <form id="lform" action="#" method="post" class="login <TMPL_VAR NAME="module">" role="form">
  <TMPL_ELSE>
    <form id="lform" action="#" method="post" class="login" role="form">
  </TMPL_IF>
    <!-- Hidden fields -->
    <TMPL_VAR NAME="HIDDEN_INPUTS">
    <input type="hidden" name="url" value="<TMPL_VAR NAME="AUTH_URL">" />
    <input type="hidden" name="timezone" />
    <input type="hidden" name="skin" value="<TMPL_VAR NAME="SKIN">" />
    <TMPL_INCLUDE NAME="openidform.tpl">
    </form>
  </div>
  </TMPL_IF>

  <TMPL_IF NAME="DISPLAY_SSL_FORM">
  <div class="card">
  <TMPL_IF NAME="module">
    <form id="lform" action="#" method="post" class="login <TMPL_VAR NAME="module">" role="form">
  <TMPL_ELSE>
    <form id="lform" action="#" method="post" class="login" role="form">
  </TMPL_IF>
    <!-- Hidden fields -->
    <TMPL_VAR NAME="HIDDEN_INPUTS">
    <input type="hidden" name="url" value="<TMPL_VAR NAME="AUTH_URL">" />
    <input type="hidden" name="timezone" />
    <input type="hidden" name="skin" value="<TMPL_VAR NAME="SKIN">" />
    <TMPL_INCLUDE NAME="sslform.tpl">
    </form>
  </div>
  </TMPL_IF>

  <TMPL_IF NAME="DISPLAY_WEBAUTHN_FORM">
  <div class="card">
  <TMPL_IF NAME="module">
    <form id="lform" action="#" method="post" class="login <TMPL_VAR NAME="module">" role="form">
  <TMPL_ELSE>
    <form id="lform" action="#" method="post" class="login" role="form">
  </TMPL_IF>
    <!-- Hidden fields -->
    <TMPL_VAR NAME="HIDDEN_INPUTS">
    <input type="hidden" name="url" value="<TMPL_VAR NAME="AUTH_URL">" />
    <input type="hidden" name="timezone" />
    <input type="hidden" name="skin" value="<TMPL_VAR NAME="SKIN">" />
    <TMPL_INCLUDE NAME="webauthnform.tpl">
    </form>
  </div>
  </TMPL_IF>

  <TMPL_IF NAME="DISPLAY_GPG_FORM">
  <div class="card">
  <TMPL_IF NAME="module">
    <form id="lform" action="#" method="post" class="login <TMPL_VAR NAME="module">" role="form">
  <TMPL_ELSE>
    <form id="lform" action="#" method="post" class="login" role="form">
  </TMPL_IF>
    <!-- Hidden fields -->
    <TMPL_VAR NAME="HIDDEN_INPUTS">
    <input type="hidden" name="url" value="<TMPL_VAR NAME="AUTH_URL">" />
    <input type="hidden" name="timezone" />
    <input type="hidden" name="skin" value="<TMPL_VAR NAME="SKIN">" />
    <TMPL_INCLUDE NAME="gpgform.tpl">
    </form>
  </div>
  </TMPL_IF>

  <TMPL_IF NAME="DISPLAY_YUBIKEY_FORM">
  <div class="card">
  <TMPL_IF NAME="module">
    <form id="lform" action="#" method="post" class="login <TMPL_VAR NAME="module">" role="form">
  <TMPL_ELSE>
    <form id="lform" action="#" method="post" class="login" role="form">
  </TMPL_IF>
    <!-- Hidden fields -->
    <TMPL_VAR NAME="HIDDEN_INPUTS">
    <input type="hidden" name="url" value="<TMPL_VAR NAME="AUTH_URL">" />
    <input type="hidden" name="timezone" />
    <input type="hidden" name="skin" value="<TMPL_VAR NAME="SKIN">" />
    <TMPL_INCLUDE NAME="yubikeyform.tpl">
    </form>
  </div>
  </TMPL_IF>

  <TMPL_IF NAME="DISPLAY_LOGO_FORM">
  <div class="card">
  <TMPL_IF NAME="module">
    <form id="lform" action="#" method="post" class="login <TMPL_VAR NAME="module">" role="form">
  <TMPL_ELSE>
    <form id="lform" action="#" method="post" class="login" role="form">
  </TMPL_IF>
    <!-- Hidden fields -->
    <TMPL_VAR NAME="HIDDEN_INPUTS">
    <input type="hidden" name="url" value="<TMPL_VAR NAME="AUTH_URL">" />
    <input type="hidden" name="timezone" />
    <input type="hidden" name="skin" value="<TMPL_VAR NAME="SKIN">" />
    <div class="form">
      <TMPL_IF NAME="module">
        <img src="<TMPL_VAR NAME="STATIC_PREFIX">common/modules/<TMPL_VAR NAME="module">.png" alt="<TMPL_VAR NAME="module">" class="img-thumbnail" />
      </TMPL_IF>

      <TMPL_INCLUDE NAME="impersonation.tpl">
      <TMPL_INCLUDE NAME="checklogins.tpl">

      <div class="buttons">
      <button type="submit" class="ibtn btn btn-primary">
        <span class="fa fa-sign-in"></span>
        <span trspan="connect">Connect</span>
      </button>
      </div>
    </div>
    <TMPL_IF NAME="DISPLAY_FINDUSER">
      <div class="actions">
      <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#finduserModal">
        <span class="fa fa-search"></span>
        <span trspan="searchAccount">Search for an account</span>
      </button>
      </div>
    </TMPL_IF>
    </form>
  </div>
  </TMPL_IF>

  <TMPL_INCLUDE NAME="finduser.tpl">

  <TMPL_IF NAME="DISPLAY_PASSWORD">
    <div id="password" class="card">
    <TMPL_INCLUDE NAME="password.tpl">
    </div>
  </TMPL_IF>

  <TMPL_IF NAME="LOGIN_INFO">
    <div class="alert alert-info">
      <TMPL_VAR NAME="LOGIN_INFO">
    </div>
  </TMPL_IF>



  <TMPL_IF NAME="LOGOUT_URL">
    <div id="logout">
      <div class="buttons">
        <a href="<TMPL_VAR NAME="LOGOUT_URL">" class="btn btn-danger" role="button">
          <span class="fa fa-sign-out"></span>&nbps;
          <span trspan="logout">Logout</span>
        </a>
      </div>
    </div>
  </TMPL_IF>

  <TMPL_INCLUDE NAME="customLoginFooter.tpl">

</main>

<TMPL_INCLUDE NAME="footer.tpl">
