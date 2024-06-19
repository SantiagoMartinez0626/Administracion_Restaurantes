<?php
$usuario = $_POST['usuario'];
$clave = $_POST['clave'];
session_start();
$_SESSION['usuario'] = $usuario;

include ('conexion.php');

$consulta = "SELECT*FROM usuario where usuario='$usuario' and clave='$clave'";
$resultado = mysqli_query($conexion, $consulta);


$filas = mysqli_num_rows($resultado);

if ($filas) {
    header("Location:inicio.php");
} else {
    ?>
    <?php
    include ("index.php");
    ?>
    <h1 class="bad">DATOS INVÁLIDOS</h1>
    <?php
}

mysqli_free_result($resultado);
mysqli_close($conexion);
?>