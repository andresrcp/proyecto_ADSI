
CREATE DATABASE IF NOT EXISTS inventory_management DEFAULT CHARACTER SET utf8;
USE inventory_management;

CREATE TABlE categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  imagen VARCHAR(200),
  nombre VARCHAR(50),
  descripcion TEXT,
  PRIMARY KEY (id_categoria)
  ) ENGINE=InnoDB;

CREATE TABlE persona (
  id_persona INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  telefono VARCHAR(50),
  correo VARCHAR(50),
  direccion VARCHAR(50),
  tipo_persona INT(11),
  PRIMARY KEY (id_persona)
  ) ENGINE=InnoDB;

CREATE TABlE rol (
  id_rol INT(11) NOT NULL AUTO_INCREMENT,
  cargo VARCHAR(45),
  PRIMARY KEY (id_rol)
  ) ENGINE=InnoDB;

CREATE TABlE usuario (
  id_usuario INT(11) NOT NULL AUTO_INCREMENT,
  nombre_usuario VARCHAR(50),
  contraseña VARCHAR(50),
  imagen VARCHAR(200),
  activo TINYINT,
  creacion DATETIME,
  id_persona INT(11) NOT NULL,
  id_rol INT(11) NOT NULL,
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_usuario_id_persona
  FOREIGN KEY (id_persona)
  REFERENCES persona(id_persona)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_usuario_id_rol
  FOREIGN KEY (id_rol)
  REFERENCES rol(id_rol)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  ) ENGINE=InnoDB;

CREATE TABlE producto (
  id_producto INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50),
  descripcion TEXT,
  min_inventario INT,
  precio_compra FLOAT,
  precio_venta FLOAT,
  presentacion VARCHAR(155),
  unidad VARCHAR(155),
  activo TINYINT,
  id_categoria INT(11) NOT NULL,
  id_usuario INT(11) NOT NULL,
  cantidad_total INT(11),
  PRIMARY KEY (id_producto),
  CONSTRAINT fk_producto_id_categoria
  FOREIGN KEY (id_categoria)
  REFERENCES categoria(id_categoria)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_producto_id_usuario
  FOREIGN KEY (id_usuario)
  REFERENCES usuario(id_usuario)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  ) ENGINE=InnoDB;

CREATE TABlE tipo_operacion (
  id_tipoOperacion INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50),
  PRIMARY KEY (id_tipoOperacion)
  ) ENGINE=InnoDB;


CREATE TABlE caja (
  id_caja INT(11) NOT NULL AUTO_INCREMENT,
  creacion DATETIME,
  dinero_base DOUBLE,
  total_dia DOUBLE,
  PRIMARY KEY (id_caja)
  ) ENGINE=InnoDB;

CREATE TABlE venta (
  id_venta INT(11) NOT NULL AUTO_INCREMENT,
  total DOUBLE,
  pago DOUBLE,
  descuento DOUBLE,
  id_persona INT(11) NOT NULL,
  id_usuario INT(11) NOT NULL,
  id_caja INT(11) NOT NULL,
  id_tipoOperacion INT(11) NOT NULL,
  PRIMARY KEY (id_venta),
  CONSTRAINT fk_venta_id_persona
  FOREIGN KEY (id_persona)
  REFERENCES persona(id_persona)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_venta_id_usuario
  FOREIGN KEY (id_usuario)
  REFERENCES usuario(id_usuario)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_venta_id_caja
  FOREIGN KEY (id_caja)
  REFERENCES caja(id_caja)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_venta_id_tipoOperacion
  FOREIGN KEY (id_tipoOperacion)
  REFERENCES tipo_operacion(id_tipoOperacion)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  ) ENGINE=InnoDB;

CREATE TABlE operacion (
  id_operacion INT(11) NOT NULL AUTO_INCREMENT,
  cant_producto VARCHAR(50),
  id_producto INT(11) NOT NULL,
  id_venta INT(11) NOT NULL,
  id_tipoOperacion INT(11) NOT NULL,
  PRIMARY KEY (id_operacion),
  CONSTRAINT fk_operacion_id_producto
  FOREIGN KEY (id_producto)
  REFERENCES producto(id_producto)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_operacion_id_venta
  FOREIGN KEY (id_venta)
  REFERENCES venta(id_venta)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT fk_operacion_id_tipoOperacion
  FOREIGN KEY (id_tipoOperacion)
  REFERENCES tipo_operacion(id_tipoOperacion)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  ) ENGINE=InnoDB;

