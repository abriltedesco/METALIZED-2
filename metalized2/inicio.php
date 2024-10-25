<?php
session_start();
$servername = "127.0.0.1";
$database = "Metalized";
$username = "alumno";
$password = "alumnoipm";
$nombreUser = $_POST["nombreUser"];
$email = $_POST["email"];
$contraseña = $_POST["contraseña"];
$_SESSION['usuario'] = $nombreUser;

$conexion = mysqli_connect($servername, $username, $password, $database);

if (!$conexion) {
    die("Conexión fallida: " . mysqli_connect_error());
} 
else {
    $query = "INSERT INTO Usuario VALUES (null, '$nombreUser', '$email', '$contraseña');";
    $resultado = mysqli_query($conexion, $query);
    if ($resultado) {
        $query = "SELECT id FROM Usuario WHERE nombreUser = '$nombreUser';";
        $resultado = mysqli_query($conexion, $query);
        $fila = mysqli_fetch_assoc($resultado);
        header("Location: metalized.php");
        exit();
    } else {
        echo "Error en la inserción: " . mysqli_error($conexion);
    }
}

mysqli_close($conexion);
?>