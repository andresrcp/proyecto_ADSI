-- consultas de inserción:
--------------------------------------------------------------------------------------------

-- agregar usuario:

INSERT INTO `user`(`name`, `last_name`, `user_name`, `email`, `password`, `is_active`, `created_at`) 
VALUES ('HEIDY','GUARNIZO','HEIDYJGVIRU','HEIDYGVIRU@CORREO.COM','12345','1', NOW());

-- agregar categoría:

INSERT INTO `category`(`name`, `description`, `create_at`) 
VALUES ('plasticos','Elementos desechables', NOW());


-- consultas de datos tabla product:
--------------------------------------------------------------------------------------------

-- buscar por categoria

SELECT * FROM `product` WHERE `category_id` = 1; 

-- buscar por usuario

SELECT * FROM `product` WHERE `user_id` = 2;

-- busqueda combianada por usuarios y categoria

SELECT * FROM `product` WHERE `user_id` = 2 AND `category_id` = 3;

-- busqueda por rango de fecha

SELECT * FROM `product` WHERE `created_at` BETWEEN '2000-03-01' AND '2000-04-30';

-- busqueda por fecha explicita

SELECT * FROM `product` WHERE `created_at` = '2021-4-1';

-- consulta datos tabla user

