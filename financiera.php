<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión Financiera</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
</head>

<body>
    <h2>Historial de pedidos</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Fecha del Pedido</th>
                <th>Total</th>
                <th>Estado</th>
                <th>Método de Pago</th>
                <th>Comentarios</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include ('conexion.php');
            $sql = "SELECT id, fecha_pedido, total, estado, metodo_pago, comentarios FROM pedidos_finalizados";
            $result = $conexion->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["id"] . "</td>";
                    echo "<td>" . $row["fecha_pedido"] . "</td>";
                    echo "<td>" . $row["total"] . "</td>";
                    echo "<td>" . $row["estado"] . "</td>";
                    echo "<td>" . $row["metodo_pago"] . "</td>";
                    echo "<td>" . $row["comentarios"] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='6'>No hay pedidos finalizados</td></tr>";
            }
            $conexion->close();
            ?>
        </tbody>
    </table>
    <a href="inicio.php" class="btn-volver">Volver</a>

</body>

</html>