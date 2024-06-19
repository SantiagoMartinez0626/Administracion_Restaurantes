<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/cabecera.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
</head>

<body>
    <form action="validar.php" method="post">
        <h1>Iniciar Sesión</h1>
        <p>Usuario<input type="text" placeholder="Ingrese su usuario" name="usuario"></p>
        <p>Contraseña<input type="password" placeholder="Ingrese su contraseña" name="clave"></p>
        <input type="submit" value="Ingresar">
    </form>
</body>

</html>