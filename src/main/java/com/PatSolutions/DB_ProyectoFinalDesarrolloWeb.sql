/*Se crea la base de datos */
drop schema if exists PatSolutions;
drop user if exists usuario_prueba;
CREATE SCHEMA PatSolutions ;

use PatSolutions;


/*Se crea un usuario para la base de datos llamado "usuario_prueba" y tiene la contraseña "Usuario_Clave."*/
create user 'usuario_prueba'@'%' identified by 'Usuar1o_Clave.';


grant all privileges on PatSolutions.* to 'usuario_prueba'@'%';
flush privileges;


create table PatSolutions.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

insert into PatSolutions.categoria(id_categoria, descripcion, activo)
values(1, 'SUV', true),
(2, 'Sedán', true),
(3, 'Pick-Up', true),
(4, 'Deportivo', true);

create table PatSolutions.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  año int,
  combustible VARCHAR(50) NOT NULL,
  transmision VARCHAR(50) NOT NULL,
  cilindrada VARCHAR(50) NOT NULL,
  precio double, 
  ruta_imagen varchar(1024),
  existencias int,
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_categoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

insert into PatSolutions.producto(id_producto, id_categoria, marca, modelo, año, combustible, transmision,
cilindrada, precio, ruta_imagen, existencias, activo)
values(1, 3, 'Nissan', 'Frontier', '2021', 'Diesel', 'Automática', '2500cc', 40000, 'https://automotiva.com.ar/wp-content/uploads/2020/11/Nissan_Frontier_2021-5.jpg', 1, true),
(2, 1, 'Toyota', 'Prado', '2020', 'Diesel', 'Automática', '3000cc', 60000, 'https://kelwaysvillage.com/wp-content/uploads/2019/11/25-The-Toyota-Prado-2020-Model-Price-for-Toyota-Prado-2020-Model.jpg', 1, true),
(3, 2, 'Hyundai', 'Elantra', '2018', 'Gasolina', 'Manual', '1800cc', 30000, 'https://www.autodetective.com/uploads/photos/hyundai/elantra/2018/1662647.jpg', 1, true),
(4, 4, 'Audi', 'R8', '2022', 'Gasolina', 'Automática', '5000cc', 150000, 'https://cdn.carbuzz.com/gallery-images/2022-audi-r8-coupe-carbuzz-803897-1600.jpg', 1, true);

/*Se crea la tabla de usuarios llamada usuario... igual que la clase Usuario*/
CREATE TABLE PatSolutions.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (id_usuario))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de roles de usuarios llamada rol... igual que la clase Rol*/
create table PatSolutions.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table PatSolutions.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table PatSolutions.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_venta_factura (id_factura) references factura(id_factura),
  foreign key fk_venta_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO PatSolutions.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'juan','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan', 'Castro Mora',    'jcastro@gmail.com',    '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true),
(2,'rebeca','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Rebeca',  'Contreras Mora', 'acontreras@gmail.com', '5456-8789','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',true),
(3,'pedro','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Pedro', 'Mena Loria',     'lmena@gmail.com',      '7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',true);

insert into PatSolutions.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);
 
select*from usuario;