
<?php
$servername = "localhost";
$username = "admin";
$password = "passw0rd";
$dbname = "usuarios";
$date_time=date("Y-m-d");
$date_sem=date("Y-m-d",strtotime($date_time."- 7 days"));

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "select name, email, celular, establecimiento, fecha from usuarios where fecha >= ".'"'.$date_sem.'"';
$result = $conn->query($sql);
echo "<table border = '1'> \n"; 
echo "<tr><td>Nombre</td><td>E-Mail</td><td>Celular</td><td>Establecimiento</td><td>Fecha</td></tr> \n";
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>". $row["name"]. "</td><td>". $row["email"]. "</td><td>" . $row["celular"] . "</td><td>" . $row["establecimiento"] . "</td><td>" . $row["fecha"] . "</td></tr> \n";
    }
} else {
    echo "0 results";
}

$conn->close();
?>

</body>
</html>
