<html>
<head>
<title>VM2 webcluster</title>
</head>
<body>
<h1> Welkom op <?php echo gethostname();  ?></h1>
<?php
$servername = "172.16.13.112";
$username = "vagrant";
$password = "vagrant";
$dbname = "vm2db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
<br>
<form method=post>
<label>Klantnaam:*</label><br>
<input type="text" name="klantnaam" placeholder="Klant" required><br><br>
<label>Klantnummer:*</label><br>
<input type="text" name="klantnummer" placeholder="001" required><br><br>
<label>Omgeving:*</label><br>
<input type="text" name="omgeving" placeholder="prod" required><br><br>
<label>Aantal omgevingen:*</label>
<input type="int" name="aantal_omgevingen" placeholder="1" required><br><br>
<label>Servernaam:*</label>
<input type="text" name="servernaam" placeholder="klant001-prod-web1" required><br><br>
<input type="submit" name="submit" value="versturen">
</form>

<?php
$sql = "SELECT klantnummer, klantnaam, omgeving, aantal_omgevingen, servernaam FROM Klanten";
$result = $conn->query($sql);


?>
<table border=1>
<th>
Klantnummer
</th>
<th>
Klantnaam
</th>
<th>
Omgeving
</th>
<th>
Aantal Omgevingen
</th>
<th>
Servernaam
</th>

<?php
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
//        echo "Klantnummer: " . $row["klantnummer"]. " - Klantnaam: " . $row["klantnaam"]. " - Omgeving: " . $row["omgeving"]. " - Aantal omgevingen: " . $row["aantal_omgevingen"]. " - Servernaam: " . $row["servernaam"]. "<br>";
$klantnummer = $row["klantnummer"];
?>
<tr>
<td>
<?php echo $row["klantnummer"]; ?>
</td>
<td>
<?php echo $row["klantnaam"]; ?>
</td>
<td>
<?php echo $row["omgeving"]; ?>
</td>
<td>
<?php echo $row["aantal_omgevingen"]; ?>
</td>
<td>
<?php echo $row["servernaam"]; ?>
</td>
<td>
<form method="post"><input type="hidden" name="klantnummer" value="<?php echo $row["klantnummer"]; ?>"><input type="submit" name="delete" value="Verwijderen"></form>
</td>
</tr>
<?php
  }
} else {
    echo "0 results";
}
?>

</table>
<?php
$klantnummer = $_POST['klantnummer'];
$klantnaam = $_POST['klantnaam'];
$omgeving = $_POST['omgeving'];
$aantal_omgevingen = $_POST['aantal_omgevingen'];
$servernaam = $_POST['servernaam'];

if (isset($_POST['submit'])){
$stmt = $conn->prepare("INSERT INTO Klanten (klantnummer, klantnaam, omgeving, aantal_omgevingen, servernaam) values (?,?,?,?,?)");
$stmt->bind_param("sssss", $klantnummer, $klantnaam, $omgeving, $aantal_omgevingen, $servernaam);
$stmt->execute();
}

if (isset($_POST['delete'])){
$klantnummer = $_POST["klantnummer"];
$stmt = $conn->prepare("DELETE FROM Klanten WHERE klantnummer=".$klantnummer."");
$stmt->execute();
}

$conn->close();
?>

</body>
</html>
