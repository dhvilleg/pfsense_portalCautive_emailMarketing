<?php
$db_host="localhost";
$db_user="admin";
$db_password="passw0rd";
$db_name="usuarios";
$db_table_name="usuarios";
$establecimiento="atahualpa";
$date_time=date("Y-m-d");
$db_connection = new mysqli($db_host, $db_user, $db_password);
$db_connection->set_charset("utf8");
if ($db_connection->connect_error) {
    die("Connection failed: " . $db_connection->connect_error);
}

  if($_POST) {
		$visitor_name = "";
		$visitor_email = "";
		$visitor_movil = "";
		if(isset($_POST['visitor_name'])) {
		$visitor_name = filter_var($_POST['visitor_name'], FILTER_SANITIZE_STRING);
		}
	
		if(isset($_POST['visitor_email'])) {
			$visitor_email = str_replace(array("\r", "\n", "%0a", "%0d"), '', $_POST['visitor_email']);
			$visitor_email = filter_var($visitor_email, FILTER_VALIDATE_EMAIL);
		}
		
		if(isset($_POST['visitor_movil'])) {
		$visitor_movil = filter_var($_POST['visitor_movil'], FILTER_SANITIZE_STRING);
		}
    }
	$valida_email = '';
    $insert_value = 'INSERT INTO `' . $db_name . '`.`'.$db_table_name.'` (`name` , `email` , `celular` , `establecimiento` , `fecha`) VALUES ("' . $visitor_name . '", "' . $visitor_email . '", "' . $visitor_movil . '", "' . $establecimiento . '", "' . $date_time . '") ON DUPLICATE KEY UPDATE email = "' . $visitor_email . '"';
	if ($db_connection->query($insert_value) === TRUE) {
		} else {
			echo "Error: " . $insert_value . "<br>" . $db_connection->error;
		}

    $db_connection->close();

?>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title>Captive Portal Login Page</title>
  <style>
          #content,.login,.login-card a,.login-card h1,.login-help{text-align:center}body,html{margin:0;padding:0;width:100%;height:100%;display:table}#content{font-family:'Source Sans Pro',sans-serif;background:url(captiveportal-background.jpg) center center no-repeat fixed;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover;display:table-cell;vertical-align:middle}.login-card{padding:40px;width:274px;background-color:#F7F7F7;margin:0 auto 10px;border-radius:2px;box-shadow:0 2px 2px rgba(0,0,0,.3);overflow:hidden}.login-card h1{font-weight:400;font-size:2.3em;color:#1383c6}.login-card h1 span{color:#f26721}.login-card img{width:70%;height:70%}.login-card input[type=submit]{width:100%;display:block;margin-bottom:10px;position:relative}.login-card input[type=text],input[type=password]{height:44px;font-size:16px;width:100%;margin-bottom:10px;-webkit-appearance:none;background:#fff;border:1px solid #d9d9d9;border-top:1px solid silver;padding:0 8px;box-sizing:border-box;-moz-box-sizing:border-box}.login-card input[type=email],input[type=email]{height:44px;font-size:16px;width:100%;margin-bottom:10px;-webkit-appearance:none;background:#fff;border:1px solid #d9d9d9;border-top:1px solid silver;padding:0 8px;box-sizing:border-box;-moz-box-sizing:border-box}.login-card input[type=text]:hover,input[type=password]:hover{border:1px solid #b9b9b9;border-top:1px solid #a0a0a0;-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,.1);-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1);box-shadow:inset 0 1px 2px rgba(0,0,0,.1)}.login{font-size:14px;font-family:Arial,sans-serif;font-weight:700;height:36px;padding:0 8px}.login-submit{-webkit-appearance:none;-moz-appearance:none;appearance:none;border:0;color:#fff;text-shadow:0 1px rgba(0,0,0,.1);background-color:#4d90fe}.login-submit:disabled{opacity:.6}.login-submit:hover{border:0;text-shadow:0 1px rgba(0,0,0,.3);background-color:#357ae8}.login-card a{text-decoration:none;color:#222;font-weight:400;display:inline-block;opacity:.6;transition:opacity ease .5s}.login-card a:hover{opacity:1}.login-help{width:100%;font-size:12px}.list{list-style-type:none;padding:0}.list__item{margin:0 0 .7rem;padding:0}label{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;text-align:left;font-size:14px;}input[type=checkbox]{-webkit-box-flex:0;-webkit-flex:none;-ms-flex:none;flex:none;margin-right:10px;float:left}@media screen and (max-width:450px){.login-card{width:70%!important}.login-card img{width:30%;height:30%}}
  </style>
</head>

<body>
<div id="content">
        <div class="login-card">
                <img src="captiveportal-logo.png"/><br>
                <h1></h1>
        <form name="login_form" method="post" action="https://pfsense.localdomain.example.com:8003/index.php?zone=zoneprueba2">
                <label class="login">Registro creado satisfactoriamente </label>
                <input name="redirurl" type="hidden" value="https://www.google.com.ec/">
                <input type="submit" name="accept" class="login login-submit" value="entrar" id="login">
          </form>
        </div>
</div>
</body>
</html>

