-- Ventas ultimos 3 meses -- 

USE GoTech_Operational_Audit;
GO

SELECT 
    e.Nombre AS Vendedor,
    e.Puesto,
    SUM(v.Cantidad) AS Total_Unidades_Vendidas,
    SUM(v.Cantidad * p.Precio_Venta) AS Total_Facturado
FROM Ventas v
JOIN Empleados e ON v.ID_Empleado = e.ID_Empleado
JOIN Productos p ON v.ID_Producto = p.ID_Producto
GROUP BY e.Nombre, e.Puesto
ORDER BY Total_Facturado DESC;

-- Costo, Ingreso y Ganancia Neta Global de la Empresa --

SELECT 
    SUM(v.Cantidad * p.Precio_Venta) AS Ingreso_Total_Empresa,
    SUM(v.Cantidad * p.Precio_Costo) AS Costo_Total_Mercaderia,
    SUM(v.Cantidad * p.Precio_Venta) - SUM(v.Cantidad * p.Precio_Costo) AS Ganancia_Neta_Real,
    ROUND(((SUM(v.Cantidad * p.Precio_Venta) - SUM(v.Cantidad * p.Precio_Costo)) / SUM(v.Cantidad * p.Precio_Venta)) * 100, 2) AS Porcentaje_Margen_Neto
FROM Ventas v
JOIN Productos p ON v.ID_Producto = p.ID_Producto;

-- Auditoria de Horarios -- 

SELECT 
    r.Fecha,
    e.Nombre AS Empleado,
    r.Hora_Entrada_Teorica,
    r.Hora_Entrada_Real,
    DATEDIFF(MINUTE, r.Hora_Entrada_Teorica, r.Hora_Entrada_Real) AS Minutos_Llegada_Tarde,
    CASE 
        WHEN DATEDIFF(MINUTE, r.Hora_Entrada_Teorica, r.Hora_Entrada_Real) > 10 THEN 'ALERTA: Llegada Tarde Grave'
        WHEN DATEDIFF(MINUTE, r.Hora_Entrada_Teorica, r.Hora_Entrada_Real) BETWEEN 1 AND 10 THEN 'Tolerancia / Demora Leve'
        ELSE 'Puntual'
    END AS Estado_Asistencia
FROM Reloj_Control r
JOIN Empleados e ON r.ID_Empleado = e.ID_Empleado
WHERE DATEDIFF(MINUTE, r.Hora_Entrada_Teorica, r.Hora_Entrada_Real) > 0;

