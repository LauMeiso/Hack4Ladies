<?php
header("Access-Control-Allow-Origin: *");
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test2";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$GName = $_GET["GName"];
$sql = "SELECT * FROM devices Left Join Brands ON Brands.ID=devices.Brand_ID Left Join scores On Brands.ID = scores.FirmenID Where devices.name Like '%{$GName}%' ORDER BY devices.ID DESC LIMIT ". $_GET["Lim"]." OFFSET ". $_GET["OFF"]."";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    $rows[] = $row;
  }
    echo json_encode($rows);
} else {
  echo "0 results";
}
$conn->close();
?>
