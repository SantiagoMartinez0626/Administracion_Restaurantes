<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Reservas</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
</head>

<body>

    <h2>Reservas Registradas</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Teléfono</th>
                <th>Fecha de Reserva</th>
                <th>Número de Personas</th>
                <th>Comentarios</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include ('conexion.php');
            $sql = "SELECT id, nombres, apellidos, telefono, fecha_de_reserva, numero_de_personas, comentarios FROM reservas";
            $result = $conexion->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["id"] . "</td>";
                    echo "<td>" . $row["nombres"] . "</td>";
                    echo "<td>" . $row["apellidos"] . "</td>";
                    echo "<td>" . $row["telefono"] . "</td>";
                    echo "<td>" . $row["fecha_de_reserva"] . "</td>";
                    echo "<td>" . $row["numero_de_personas"] . "</td>";
                    echo "<td>" . $row["comentarios"] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='7'>No hay reservas registradas</td></tr>";
            }
            $conexion->close();
            ?>
        </tbody>
    </table>

    <a href="inicio.php" class="btn-volver">Volver</a>

</body>

</html>