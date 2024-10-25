<?php
	$nombreUser= $_GET["nombreUser"];
    $contraseña = $_GET["contraseña"];

    $servername = "127.0.0.1";
    $database = "Metalized";
    $username = "alumno";
    $password = "alumnoipm";

    $conexion = mysqli_connect($servername, $username, $password, $database);
    if (!$conexion) {
        die("Conexion fallida: " . mysqli_connect_error());
    }
    else{
        $query = "SELECT nombreUser FROM Usuario WHERE nombreUser = '$nombreUser';";
        $resultado = mysqli_query($conexion, $query);
        $fila = mysqli_fetch_assoc($resultado);

        $_SESSION['usuario'] = $nombreUser;

        header("Location: metalized.php");
        exit();
    }
?>