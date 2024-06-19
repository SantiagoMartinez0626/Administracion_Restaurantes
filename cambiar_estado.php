<?php
include ('conexion.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $nuevo_estado = $_POST['nuevo_estado'];

    if (!isset($id) || !isset($nuevo_estado)) {
        die("Error: Datos incompletos recibidos.");
    }

    if ($nuevo_estado == 'finalizado') {
        $sql = "SELECT fecha_pedido, total, estado, metodo_pago, comentarios FROM pedidos WHERE id = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            $pedido = $result->fetch_assoc();

            $sql_insert = "INSERT INTO pedidos_finalizados (fecha_pedido, total, estado, metodo_pago, comentarios) VALUES (?, ?, ?, ?, ?)";
            $stmt_insert = $conexion->prepare($sql_insert);
            $stmt_insert->bind_param("sdsss", $pedido['fecha_pedido'], $pedido['total'], $nuevo_estado, $pedido['metodo_pago'], $pedido['comentarios']);
            $stmt_insert->execute();
            $stmt_insert->close();

            $sql_delete = "DELETE FROM pedidos WHERE id = ?";
            $stmt_delete = $conexion->prepare($sql_delete);
            $stmt_delete->bind_param("i", $id);
            $stmt_delete->execute();
            $stmt_delete->close();
        } else {
            die("Error: No se encontró el pedido o hay más de un resultado.");
        }
    } else {
        $sql = "UPDATE pedidos SET estado = ? WHERE id = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("si", $nuevo_estado, $id);
        $stmt->execute();
        $stmt->close();
    }

    $conexion->close();
    header("Location: pedidos.php");
    exit();
}
?>