--------------------------------------------------------------------------------
-- CONSULTAS 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Seleccionar los campos nombre, precio_compra y precio_venta de la tabla
-- producto
--------------------------------------------------------------------------------
1. SELECT nombre, precio_compra, precio_venta FROM producto

--------------------------------------------------------------------------------
-- Seleccionar los campos nombre, precio_compra y precio_venta de la tabla 
-- producto donde nombre sea igual a 'HILO DE NYMO'
--------------------------------------------------------------------------------
2. SELECT nombre, precio_compra, precio_venta FROM producto WHERE nombre = 
   'HILO DE NYMO' 

--------------------------------------------------------------------------------
-- Seleccionar los campos nombre, precio_compra y precio_venta de la tabla 
-- producto donde nombre sea igual a 'HILO DE NYMO' Y (O) 'CORDON DE NYLON ELASTICO'
--------------------------------------------------------------------------------
3. SELECT nombre, precio_compra, precio_venta FROM producto WHERE nombre = 
   'HILO DE NYMO' OR nombre = 'CORDON DE NYLON ELASTICO' 

--------------------------------------------------------------------------------
-- Seleccionar los campos nombre, telefono y direccion de la tabla
-- persona donde direccion se igual a 'LA LIBERTAD'
--------------------------------------------------------------------------------
4. SELECT nombre, telefono, direccion FROM persona WHERE direccion = 'LA LIBERTAD' 

--------------------------------------------------------------------------------
-- Seleccionar los campos nombre, telefono y direccion de la tabla
-- persona donde direccion sea igual a 'LA LIBERTAD' Y (O) 'CANDELARIA'
--------------------------------------------------------------------------------
5. SELECT nombre, telefono, direccion FROM persona WHERE direccion = 'LA LIBERTAD' 
   OR direccion = 'CIUDADELA' 

--------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla persona donde tipo_persona sea igual 
-- a '3' Y direccion sea igual a 'BANDERAS
--------------------------------------------------------------------------------
6. SELECT * FROM persona WHERE tipo_persona = '3' AND direccion = 'BANDERAS' 

--------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla producto donde precio_venta sea mayor 
-- a '30000' 
--------------------------------------------------------------------------------
7. SELECT * FROM producto WHERE precio_venta > 30000 

--------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla producto donde precio_venta sea menor 
-- a '30000' 
--------------------------------------------------------------------------------
8. SELECT * FROM producto WHERE precio_venta < 30000 

--------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla usuario donde creacion este entre
-- '2020-01-01' Y '2020-06-20'
--------------------------------------------------------------------------------
9. SELECT * FROM usuario WHERE creacion BETWEEN '2020-01-01' AND '2020-06-20' 

--------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla persona donde tipo_persona sea igual 
-- a '1' Y '3' y que lo ordene por tipo_persona (Ascendente)
--------------------------------------------------------------------------------
10. SELECT * FROM persona WHERE tipo_persona = '1' OR tipo_persona = '3' ORDER BY
    tipo_persona ASC 

--------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla persona donde tipo_persona se igual 
-- a '1' Y '3' y que lo ordene por tipo_persona (Descendente)
--------------------------------------------------------------------------------
11. SELECT * FROM persona WHERE tipo_persona = '1' OR tipo_persona = '3' ORDER BY 
    tipo_persona DESC

--------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla persona donde tipo_persona sea igual 
-- a '1' Y '3' y que lo ordene por direccion
--------------------------------------------------------------------------------
12. SELECT * FROM persona WHERE tipo_persona = '1' OR tipo_persona = '3' ORDER BY
    direccion

-------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla venta donde total se igual a
-- '50000' Y '30000'
-------------------------------------------------------------------------------
13. SELECT * FROM venta WHERE total = '50000' OR total = '30000' 

-------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla venta donde total sea igual a
-- '50000' Y '30000' y lo ordene por id_usuario
-------------------------------------------------------------------------------
14. SELECT * FROM venta WHERE total = '50000' OR total = '30000' ORDER BY
    id_usuario

-------------------------------------------------------------------------------
-- Seleccionar todos los campos de la tabla venta donde total sea igual a
-- '50000' Y '100000' y lo ordene por total e id_caja
-------------------------------------------------------------------------------    
15. SELECT * FROM venta WHERE total = '50000' OR total = '100000' ORDER BY 
    total, id_caja

-------------------------------------------------------------------------------
-- Seleccionar id_persona(agrupación) y sumar el pago de la tabla venta y lo 
-- y lo agrupe por id_persona
-------------------------------------------------------------------------------  
16. SELECT id_persona, SUM(pago) FROM venta GROUP BY id_persona

-------------------------------------------------------------------------------
-- Seleccionar id_categoria(agrupación) y sumar el precio_venta de la tabla 
-- producto y lo agrupe por id_categoria
-------------------------------------------------------------------------------  
17. SELECT id_categoria, SUM(precio_venta) FROM producto GROUP BY id_categoria

-------------------------------------------------------------------------------
-- Seleccionar id_categoria(agrupación) y sacar la media de precio_venta con el 
-- alias media_venta de la tabla producto y lo agrupe por id_categoria donde 
-- id_categoria sea igual a '1' Y (O) '6'
-------------------------------------------------------------------------------  
18.SELECT id_categoria, AVG(precio_venta) AS media_venta FROM producto GROUP BY
   id_categoria HAVING id_categoria = '1' OR id_categoria = '6' 

-------------------------------------------------------------------------------
-- Seleccionar id_categoria y sacar la media de precio_venta con el 
-- alias media_venta de la tabla producto y lo agrupe por id_categoria donde 
-- id_categoria sea igual a '1' Y (O) '6' y lo ordene por media_venta
-------------------------------------------------------------------------------  
19. SELECT id_categoria, AVG(precio_venta) AS media_venta FROM producto GROUP BY 
    id_categoria HAVING id_categoria = '1' OR id_categoria = '6' ORDER BY media_venta

--------------------------------------------------------------------------------
-- Seleccionar direccion, contar el tipo_persona de la tabla persona y agruparlo 
-- por direccion
--------------------------------------------------------------------------------
20. SELECT direccion, COUNT(tipo_persona) FROM persona GROUP BY direccion

--------------------------------------------------------------------------------
-- Seleccionar id_categoria, sumar los precio_compra de la tabla producto y
-- agruparlo por id_categoria
--------------------------------------------------------------------------------
21. SELECT id_categoria, MAX(precio_compra) FROM producto GROUP BY id_categoria

--------------------------------------------------------------------------------
-- Seleccionar id_categoria, sacar el maximo de precio_compra con el alias 
-- precio_alto de la tabla producto y agruparlo por id_categoria y ordenarlos 
-- por precio_alto
--------------------------------------------------------------------------------
22. SELECT id_categoria, MAX(precio_compra) AS precio_alto FROM producto 
    GROUP BY id_categoria ORDER BY precio_alto

--------------------------------------------------------------------------------
-- Seleccionar id_categoria, sacar el maximo de precio_venta de la tabla 
-- producto donde id_catgoria sea igual a '4' y agruparlo por id_categoria
--------------------------------------------------------------------------------
23. SELECT id_categoria, MAX(precio_venta) FROM producto WHERE id_categoria = '4'
    GROUP BY id_categoria

--------------------------------------------------------------------------------
-- Seleccionar nombre, precio_venta, precio_venta por IVA con el alias
-- precio_iva de la tabla producto
--------------------------------------------------------------------------------
24.SELECT nombre, precio_venta, (precio_venta*1.19) AS precio_iva FROM 
   producto

--------------------------------------------------------------------------------
-- Seleccionar nombre, precio_venta y sacar el descuento de 3% con el alias 
-- precio_dto de la tabla producto
--------------------------------------------------------------------------------
25. SELECT nombre, precio_venta, precio_venta-3 AS precio_dto FROM producto

--------------------------------------------------------------------------------
-- Seleccionar nombre_usuario, id_persona y creacion donde se devuelva la hora 
-- actual y fecha NOW() con el alias dia_hoy de la tabla usuario
--------------------------------------------------------------------------------
26. SELECT nombre_usuario, id_persona, creacion, NOW() AS dia_hoy FROM usuario

 DATEDIFF (diasdediferencia)
27.SELECT nombre_usuario, id_persona, creacion, NOW() AS dia_hoy, 
   DATEDIFF(NOW(),creacion) AS diferencia FROM usuario