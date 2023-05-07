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
$Auswahl = $_GET["Auswahl"];
$GName = $_GET["GName"];
$sql = "SELECT devices.name, devices.picture, devices.ram, devices.display_resolution, devices.battery_size, devices.released_at, devices.camera_pixels ,devices.os, devices.storage,devices.display_size, devices.battery_type, scores.Energie, scores.Recycling, scores.Langlebigkeit, scores.Umweltverschmutzung, scores.Soziale_Verantwortung, scores.Faire_Arbeitsbedingungen, scores.Transparenz  FROM devices Left Join Brands ON Brands.ID=devices.Brand_ID Left Join scores On Brands.ID = scores.FirmenID Where devices.name Like '%{$GName}%' ORDER BY ";
if ($Auswahl == 0)
  $sql =   $sql . "Energie	DESC";
else if ($Auswahl == 1)
  $sql =   $sql . "Recycling	DESC ";
else if ($Auswahl == 2)
  $sql =   $sql . "Langlebigkeit	DESC ";
else if ($Auswahl == 3)
  $sql =   $sql . "Umweltverschmutzung	DESC ";
else if ($Auswahl == 4)
  $sql =   $sql . "Soziale_Verantwortung	DESC "; 
else if ($Auswahl == 5)
  $sql =   $sql . "Faire_Arbeitsbedingungen	DESC ";
else if ($Auswahl == 6)
  $sql =   $sql . "Transparenz	DESC ";
$sql =  $sql . " LIMIT ". $_GET["Lim"]." OFFSET ". $_GET["OFF"]."";

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
