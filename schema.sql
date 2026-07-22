WITH TotalPorProducto AS (
	SELECT d.orden_id, (d.cantidad * p.precio) AS subtotal
	FROM detalles_orden d 
	JOIN productos p
	ON d.producto_id = p.id
)

SELECT o.id AS numero_orden, 
u.nombre AS cliente,
REPLACE(TO_CHAR(SUM(t.subtotal), 'FM999,999,999'), ',', '.') || ' Gs' AS total_gastado
FROM ordenes o 
JOIN usuarios u ON o.usuario_id = u.id
JOIN TotalPorProducto t ON o.id = t.orden_id
GROUP BY o.id, u.nombre
ORDER BY o.id;