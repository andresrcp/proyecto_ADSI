CREATE DATABASE IF NOT EXISTS Proyecto DEFAULT CHARACTER SET utf8 ;
USE Proyecto ;

CREATE TABLE categoria (
  id_categoria INT NOT NULL COMMENT 'identificador de la categoria',
  imagen VARCHAR(200) NULL COMMENT 'imagen descriptiva de la categoria',
  nombre VARCHAR(50) NOT NULL DEFAULT 'new' COMMENT 'titulo de identificacion  de la categoria',
  descripcion TEXT NULL DEFAULT 'objects' COMMENT 'pequeña descripcion del contenido de la categoria',
  PRIMARY KEY (`id_categoria`),
  UNIQUE INDEX `id_categoria_UNIQUE` (`id_categoria` ASC))
ENGINE = InnoDB
COMMENT = 'agrupaciones de algunos tipos de productos';

CREATE TABLE `persona` (
  `id_persona` INT NOT NULL COMMENT 'numero de identificacion de la persona, cedeula para persona natural y nit para personas juridicas.',
  `nombre` VARCHAR(60) NOT NULL DEFAULT 'name' COMMENT 'palabra o palabras que identifican a una persona (se puede repetir)',
  `apellido` VARCHAR(60) NOT NULL DEFAULT 'last name' COMMENT 'palabra o palabras que identifican a una persona (se puede repetir)',
  `telefono` VARCHAR(50) NOT NULL DEFAULT '1234567890' COMMENT 'numero de contacto de la persona',
  `correo` VARCHAR(50) NOT NULL DEFAULT 'correo@correo.com' COMMENT 'direccion de correo electronico ',
  `direccion` VARCHAR(50) NOT NULL DEFAULT 'false street' COMMENT 'ubicacion de residencia de la persona',
  `tipo_persona` INT NOT NULL DEFAULT 1 COMMENT 'diferenciacion entre cliente, proveedor o trabajador',
  PRIMARY KEY (`id_persona`),
  UNIQUE INDEX `id_persona_UNIQUE` (`id_persona` ASC),
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC))
ENGINE = InnoDB
COMMENT = 'Tabla que contiene los datos de los clientes, trabajadores y proveedores';

CREATE TABLE `rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT COMMENT 'identificador del rol',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'nombre del rol',
  PRIMARY KEY (`id_rol`),
  UNIQUE INDEX `id_rol_UNIQUE` (`id_rol` ASC))
ENGINE = InnoDB
COMMENT = 'rol del usuario en el sistema';

CREATE TABLE `usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT COMMENT 'codigo de usuario o identificador de usuario',
  `nombre_usuario` VARCHAR(50) NOT NULL COMMENT 'nombre de usuario para ingresar al sistema',
  `contraseña` VARCHAR(50) NOT NULL DEFAULT 'password' COMMENT 'clave del usuario para ingreso al sistema',
  `imagen` VARCHAR(200) NULL COMMENT 'foto del usuario o avatar del mismo',
  `activo` TINYINT NOT NULL DEFAULT 1 COMMENT 'Bandera de confirmacion de usuario conectado',
  `creacion` DATETIME NOT NULL DEFAULT NOW() COMMENT 'fecha de creacion del usuario',
  `id_persona` INT NOT NULL COMMENT 'identificador de la persona',
  `rol_id_rol` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC),
  UNIQUE INDEX `nombre_usuario_UNIQUE` (`nombre_usuario` ASC),
  INDEX `fk_usuario_persona_idx` (`id_persona` ASC),
  UNIQUE INDEX `rol_id_rol_UNIQUE` (`rol_id_rol` ASC),
  UNIQUE INDEX `id_persona_UNIQUE` (`id_persona` ASC),
  CONSTRAINT `fk_usuario_persona`
    FOREIGN KEY (`id_persona`)
    REFERENCES `Proyecto`.`persona` (`id_persona`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`rol_id_rol`)
    REFERENCES `Proyecto`.`rol` (`id_rol`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Tabla que contiene los usuarios del sistema';

CREATE TABLE `caja` (
  `id_caja` INT NOT NULL AUTO_INCREMENT COMMENT 'identificador de la caja',
  `creacion` DATETIME NOT NULL DEFAULT '2021-06-10' COMMENT 'fecha de creacion de esta caja',
  `dinero_base` DOUBLE NOT NULL DEFAULT 100000 COMMENT 'Dinero dejado inicialmente en caja para dar cambio a los clientes',
  `total_dia` DOUBLE NOT NULL DEFAULT 0 COMMENT 'total de ventas del dia',
  PRIMARY KEY (`id_caja`),
  UNIQUE INDEX `id_caja_UNIQUE` (`id_caja` ASC))
ENGINE = InnoDB
COMMENT = 'caja que recibe el pago';

CREATE TABLE `tipo_operacion` (
  `id_tipoOperacion` INT NOT NULL AUTO_INCREMENT COMMENT 'identificador de la operacion',
  `nombre` VARCHAR(50) NOT NULL COMMENT 'nombre de la operacion (entrada o salida)',
  PRIMARY KEY (`id_tipoOperacion`),
  UNIQUE INDEX `id_tipoOperacion_UNIQUE` (`id_tipoOperacion` ASC))
ENGINE = InnoDB
COMMENT = 'especificacion del tipo de operacionque se realiza como venta o compra de productos';

CREATE TABLE `venta` (
  `id_venta` INT NOT NULL AUTO_INCREMENT COMMENT 'identificador de la venta',
  `total_venta` DOUBLE NOT NULL COMMENT 'valor total de la venta realizada, valor calculado',
  `pago` DOUBLE NULL COMMENT 'valor pagado por el cliente',
  `descuento` DOUBLE NOT NULL DEFAULT 0 COMMENT 'valor de porcentaje del descuento realizado',
  `persona_id_persona` INT NOT NULL COMMENT 'refernecia a la persona (cliente o proveedor)',
  `usuario_id_usuario` INT NOT NULL COMMENT 'referencia al usuario que realiza la operacion',
  `caja_id_caja` INT NOT NULL COMMENT 'referencia a la caja en la que se realiza la operacion',
  `tipo_operacion_id_tipoOperacion` INT NOT NULL COMMENT 'identificador que referencia si es compra o venta',
  PRIMARY KEY (`id_venta`),
  INDEX `fk_venta_persona1_idx` (`persona_id_persona` ASC),
  INDEX `fk_venta_usuario1_idx` (`usuario_id_usuario` ASC),
  INDEX `fk_venta_caja1_idx` (`caja_id_caja` ASC),
  INDEX `fk_venta_tipo_operacion1_idx` (`tipo_operacion_id_tipoOperacion` ASC),
  UNIQUE INDEX `id_venta_UNIQUE` (`id_venta` ASC),
  UNIQUE INDEX `persona_id_persona_UNIQUE` (`persona_id_persona` ASC),
  UNIQUE INDEX `usuario_id_usuario_UNIQUE` (`usuario_id_usuario` ASC),
  UNIQUE INDEX `caja_id_caja_UNIQUE` (`caja_id_caja` ASC),
  UNIQUE INDEX `tipo_operacion_id_tipoOperacion_UNIQUE` (`tipo_operacion_id_tipoOperacion` ASC),
  CONSTRAINT `fk_venta_persona1`
    FOREIGN KEY (`persona_id_persona`)
    REFERENCES `Proyecto`.`persona` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `Proyecto`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_caja1`
    FOREIGN KEY (`caja_id_caja`)
    REFERENCES `Proyecto`.`caja` (`id_caja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_tipo_operacion1`
    FOREIGN KEY (`tipo_operacion_id_tipoOperacion`)
    REFERENCES `Proyecto`.`tipo_operacion` (`id_tipoOperacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'informacion de la venta realizada ';

CREATE TABLE `producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT COMMENT 'identificador del producto',
  `nombre` VARCHAR(50) NOT NULL DEFAULT 'new product' COMMENT 'nombre del producto',
  `descripcion` TEXT NULL COMMENT 'breve descripcion del producto',
  `min_inventario` INT NOT NULL DEFAULT 1 COMMENT 'limite minimo de unidades del producto, tambien puede ser cantidades en Kg o Lt',
  `precio_compra` FLOAT NOT NULL COMMENT 'valor costo de compra al proveedor',
  `precio_venta` FLOAT NOT NULL COMMENT 'valor costo de venta al cliente',
  `presentacion` VARCHAR(155) NULL COMMENT 'descripcion del empaque o contenedor del producto',
  `unidad` VARCHAR(155) NULL COMMENT 'indicativo de la unidad de medida de cantidad del producto por ejemplo: por Kg, Lt, unidad, metro, metro cuadrado, etc.',
  `activo` TINYINT NOT NULL DEFAULT 1 COMMENT 'indica si hay existencias del producto',
  `categoria_id_categoria` INT NOT NULL COMMENT 'identificador de la categoria del producto (foreign key)',
  `usuario_id_usuario` INT NOT NULL COMMENT 'identificador del usuario que lo creo (foreign key)',
  `cantidad_total` INT NOT NULL DEFAULT 1 COMMENT 'Cantidad total de unidades en existencia del producto',
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_categoria_idx` (`categoria_id_categoria` ASC),
  INDEX `fk_producto_usuario1_idx` (`usuario_id_usuario` ASC),
  UNIQUE INDEX `id_producto_UNIQUE` (`id_producto` ASC),
  CONSTRAINT `fk_producto_categoria`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `Proyecto`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `Proyecto`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'productos de la empresa';

CREATE TABLE `operacion` (
  `id_operacion` INT NOT NULL AUTO_INCREMENT COMMENT 'identificador de la operacion (compra o venta)',
  `cant_producto` VARCHAR(45) NOT NULL COMMENT 'cantidad de producto vendido o comprado en unidades representativas',
  `producto_id_producto` INT NOT NULL COMMENT 'referencia al producto del que se habla',
  `venta_id_venta` INT NOT NULL COMMENT 'identificador de la venta',
  `tipo_operacion_id_tipoOperacion` INT NOT NULL COMMENT 'identificador del tipo de la operacion',
  PRIMARY KEY (`id_operacion`),
  INDEX `fk_operacion_producto1_idx` (`producto_id_producto` ASC),
  INDEX `fk_operacion_venta1_idx` (`venta_id_venta` ASC),
  INDEX `fk_operacion_tipo_operacion1_idx` (`tipo_operacion_id_tipoOperacion` ASC),
  UNIQUE INDEX `id_operacion_UNIQUE` (`id_operacion` ASC),
  UNIQUE INDEX `producto_id_producto_UNIQUE` (`producto_id_producto` ASC),
  UNIQUE INDEX `venta_id_venta_UNIQUE` (`venta_id_venta` ASC),
  UNIQUE INDEX `tipo_operacion_id_tipoOperacion_UNIQUE` (`tipo_operacion_id_tipoOperacion` ASC),
  CONSTRAINT `fk_operacion_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `Proyecto`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacion_venta1`
    FOREIGN KEY (`venta_id_venta`)
    REFERENCES `Proyecto`.`venta` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacion_tipo_operacion1`
    FOREIGN KEY (`tipo_operacion_id_tipoOperacion`)
    REFERENCES `Proyecto`.`tipo_operacion` (`id_tipoOperacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'tabla que relaciona los productos con cada venta o compra y la cantidad de estos (listado de producotos)';

