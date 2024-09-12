<?php

include_once("func.includes/config.inc.php");

if (isset($_POST["procesar"])) {

   if ($_SERVER['REMOTE_ADDR'] == '127.0.0.1' || $_SERVER['REMOTE_ADDR'] == '::1') {

      $row = $objGeneral->seleccionar_registro_sql("usuarios", "userName = '" . $_POST['user'] . "'");

      if ($row != null) {

         session_start();

         $_SESSION['utnfrro_SistemaAlumnado_user_login_session']     = true;
         $_SESSION['utnfrro_SistemaAlumnado_idUsuario']              = $row['id'];
         $_SESSION['utnfrro_SistemaAlumnado_userName']               = $row['userName'];
         $_SESSION['utnfrro_SistemaAlumnado_nombre']                 = $row['nombre'];
         $_SESSION['utnfrro_SistemaAlumnado_apellido']               = $row['apellido'];
         $_SESSION['utnfrro_SistemaAlumnado_nivelPermisos']          = $row['nivelPermiso'];

         header("Location: proceso.php?op=home");
      } else {

         header("Location: index.php?estado=1");
      }
   } else {

      /* NECESARIO RESPONSE CAPTCHA PARA VERIFICAR */
      $captcha = $_POST["g-recaptcha-response"];

      // $ip = $_SERVER['REMOTE_ADDR'];
      // $response = file_get_contents_curl("https://www.google.com/recaptcha/api/siteverify?secret=" . $privatekey . "&response=" . $captcha . "&remoteip=" . $ip);
      // $responseKeys = json_decode($response, true);

      // if (empty($captcha)) /* Si el captcha está vacío */ {
      //    header("Location: index.php?estado=5");
      //    exit();
      // } elseif (intval($responseKeys["success"]) !== 1) {
      //    header("Location: index.php?estado=6");
      //    exit();
      // } else /* Si el captcha es correcto */ {

         $row = $objGeneral->seleccionar_registro_sql("usuarios", "userName = '" . $_POST['user'] . "'");

         // CREDENCIALES DE BUSQUEDA EN LDAP
         $userName = $row['userName'];
         $passWord = $_POST['password'];

         // Credenciales de ingreso
         $ldap_dn = "CN=Portal Intranet Soporte,OU=Cuentas de Servicios,OU=Admin,DC=rosario,DC=frro,DC=utn,DC=edu,DC=ar";
         $ldap_password = "M5IM5SjOw7OC";

         // Dominio de acceso al servidor LDAP
         $host = "rosario.frro.utn.edu.ar";
         $port = "389";

         // Conexión al Servidor
         $ldap_con = ldap_connect("rosario.frro.utn.edu.ar");

         // Atributos a recuperar
         $atributos = array("cn", "givenName", "sn", "samaccountname", "dn");

         if (isset($userName)) {

            if (isset($passWord)) {
               // CONFIGURACION DE PROTOCOLOS 
               ldap_set_option($ldap_con, LDAP_OPT_PROTOCOL_VERSION, 3);
               ldap_set_option($ldap_con, LDAP_OPT_REFERRALS, false);


               if (ldap_bind($ldap_con, $ldap_dn, $ldap_password)) {

                  $filter = "(SAMAccountName=" . $userName . ")";
                  $result = ldap_search($ldap_con, "DC=rosario,DC=frro,DC=utn,DC=edu,DC=ar", $filter, $atributos);
                  $first = ldap_first_entry($ldap_con, $result);
                  $info = ldap_get_entries($ldap_con, $result);
                  $dn_user = ldap_get_dn($ldap_con, $first);

                  ldap_unbind($ldap_con);

                  if (isset($dn_user)) {

                     $ldap_dn = $dn_user;
                     $ldap_password = $passWord;

                     // Datos del Servidor
                     $ldap_con = ldap_connect("rosario.frro.utn.edu.ar");
                     // CONFIGURACION DE PROTOCOLOS 
                     ldap_set_option($ldap_con, LDAP_OPT_PROTOCOL_VERSION, 3);
                     ldap_set_option($ldap_con, LDAP_OPT_REFERRALS, false);

                     if (ldap_bind($ldap_con, $ldap_dn, $ldap_password)) {

                        // $cn = $info[0]['cn'][0];
                        // $sn = $info[0]['sn'][0];
                        // $gn = $info[0]['givenname'][0];
                        // $san = $info[0]['samaccountname'][0];


                        // echo $cn."<br>";
                        // echo $sn."<br>";
                        // echo $gn."<br>";
                        // echo $san."<br>";
                        // echo $dn_user."<br>";

                        // die();


                        session_start();

                        $_SESSION['utnfrro_SistemaAlumnado_user_login_session']     = true;
                        $_SESSION['utnfrro_SistemaAlumnado_idUsuario']              = $row['id'];
                        $_SESSION['utnfrro_SistemaAlumnado_USERNAME']               = $row['userName'];
                        $_SESSION['utnfrro_SistemaAlumnado_nombre']                 = $row['nombre'];
                        $_SESSION['utnfrro_SistemaAlumnado_apellido']               = $row['apellido'];
                        $_SESSION['utnfrro_SistemaAlumnado_nivelPermisos']          = $row['nivelPermiso'];

                        header("Location: proceso.php?op=home");
                        exit();
                     } else {
                        header("location: index.php?estado=2");
                     }
                  } else {
                     header("location: index.php?&estado=notfound");
                  }
               } else {
                  header("location: index.php?estado=error");
               }
            } else {
               header("location: index.php?estado=pwempty");
            }
         } else {
            header("location: index.php?estado=1");
         }
      // } /* Captcha */
   }
} /* Procesar */
