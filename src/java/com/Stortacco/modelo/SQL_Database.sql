--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `Rol` varchar(15) NOT NULL,
  `Habilitado` varchar(1) NOT NULL,
  PRIMARY KEY (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'gerente@stortacco.com','123','gerente','S'),(2,'admin@stortacco.com','123','administrador','S'),(3,'cliente@stortacco.com','123','cliente','S'),(4,'david@gmail.com','123','cliente','S'),(5,'daniel@gmail.com','123','cliente','S'),(6,'santi@gmail.com','123','cliente','S'),(7,'carlos@gmail.com','123','cliente','S'),(8,'camilo@gmail.com','123','cliente','S');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table `informacion_usuarios`
--

DROP TABLE IF EXISTS `informacion_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacion_usuarios` (
  `idinformacionusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Registro` date NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(60) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Tarjeta_Identificacion` varchar(45) NOT NULL,
  `Numero_Identificacion` varchar(45) NOT NULL,
  `Direccion` varchar(40) NOT NULL,
  `Telefono` varchar(30) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Habilitado` varchar(1) NOT NULL,
  PRIMARY KEY (`idinformacionusuarios`),
  KEY `IdUsuario_informacionU_idx` (`idUsuario`),
  CONSTRAINT `IdUsuario_informacionU` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_usuarios`
--

LOCK TABLES `informacion_usuarios` WRITE;
/*!40000 ALTER TABLE `informacion_usuarios` DISABLE KEYS */;
INSERT INTO `informacion_usuarios` VALUES (1,'2019-02-07','Santiago','Restrepo Velez','1999-01-01','CC','1036687446','Calle 45# 67SUR','3007486060',1,'S'),(2,'2019-02-07','Jonathan','Madrid Londoño','1970-01-01','CC','1037586268','Carrera 23# 56 - A56','3052909053',2,'S'),(3,'2019-02-07','Juan Jose','Restrepo Cuadros','1999-01-01','CC','1036687393','Calle 62 #12SUR - 23','3105914350',3,'S'),(4,'2019-06-10','Juan david','Cadavid','1997-02-10','CC','1036687441','calle 76 #70-800','3782050',4,'S'),(5,'2019-06-10','daniel','restrepo','1998-05-12','CC','1036445823','Cl. 39 #20-37, ItagÃ¼i, Antioquia','3215821',5,'S'),(6,'2019-06-11','santi','godoy','1999-10-10','CC','1036654452','Cl. 47 #48-503, ItagÃ¼i, Antioquia','3757471',6,'S'),(7,'2019-06-11','carlos','sossa','1990-02-10','CC','1036674445','Cl. 47 #48-90, ItagÃ¼i, Antioquia','3007425060',7,'S'),(8,'2019-06-11','camilo','restrepo','1999-02-10','CC','1032201547','Cl. 50 #20-50, ItagÃ¼i, Antioquia','3502845',8,'S');
/*!40000 ALTER TABLE `informacion_usuarios` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservas` (
  `idreservas` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Reserva` date NOT NULL,
  `Hora_Reserva` time NOT NULL,
  `Numero_Personas` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Habilitado` varchar(1) NOT NULL,
  PRIMARY KEY (`idreservas`),
  KEY `IdUsuario_reservas_idx` (`idUsuario`),
  CONSTRAINT `idUsuario_reservas` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2019-03-04','11:30:00','5',2,'S'),(2,'2019-03-20','07:35:00','8',1,'S');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `idproveedores` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Tipo_Identificacion` varchar(45) NOT NULL,
  `Numero_Identificacion` varchar(45) NOT NULL,
  `Nombre_Contacto` varchar(45) NOT NULL,
  `Habilitado` varchar(1) NOT NULL,
  PRIMARY KEY (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Pilsen','3224545','contacto@pilsen.co.com','Calle 34# 56 - 56','NIT','1-345678433','Gabriel Gomez','S'),(2,'Fabrica de Licores','2345242','contacto@fla.com','Calle 23# 76SUR 2','NIT','2345678543-1','Pedrito Perez','S'),(3,'Dislicores','3205792516','online@dislicores.com','Calle 70# 50SUR','NIT','123-45687','Alejo Zapata','S'),(4,'Jumbo','7230402','jumbo@gmail.com','Cra. 65 ##45-85, MedellÃ­n, Antioquia','NIT','2-2776964','Juan David','S');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `productos`
--
DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idproductos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `Habilitado` varchar(1) NOT NULL,
  PRIMARY KEY (`idproductos`),
  KEY `idProveedor_productos_idx` (`idProveedor`),
  CONSTRAINT `idProveedor_productos` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Don Julio Tequila',3,'S'),(2,'1800 Tequila',3,'S'),(3,'1800 Silver Tequila',3,'S'),(4,'Jose Cuervo Tequila',3,'S'),(5,'Smirnoff Vodka',3,'S'),(6,'Absolut Vodka',3,'S'),(7,'Red Label Whisky',3,'S'),(8,'Jack Daniels Whisky',3,'S'),(9,'Old Parr Whisky',3,'S'),(10,'Ron Medellin',2,'S'),(11,'Aguardiente Antioqueño',2,'S'),(12,'Corona',4,'S'),(13,'Artesanal',4,'S'),(14,'Heineken',4,'S'),(15,'Redd',4,'S'),(16,'Poker',4,'S'),(17,'Aguila',4,'S'),(18,'Aguila-light',4,'S');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `detalles_productos`
--

DROP TABLE IF EXISTS `detalles_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_productos` (
  `iddetallesproductos` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` text NOT NULL,
  `Fecha_Ingreso` date NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Compra` int(11) NOT NULL,
  `Precio_Venta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Habilitado` varchar(1) NOT NULL,
  PRIMARY KEY (`iddetallesproductos`),
  KEY `idProducto_detallesP_idx` (`idProducto`),
  CONSTRAINT `idProducto_detallesP` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_productos`
--

LOCK TABLES `detalles_productos` WRITE;
/*!40000 ALTER TABLE `detalles_productos` DISABLE KEYS */;
INSERT INTO `detalles_productos` VALUES (1,'750ml (Botella)','2019-05-29',35,120000,200000,1,'S'),(2,'750ml (Botella)','2019-05-29',37,90000,170000,2,'S'),(3,'750ml (Botella)','2019-05-29',40,95000,180000,3,'S'),(4,'750ml (Botella)','2019-05-29',40,65000,120000,4,'S'),(5,'750ml (Botella)','2019-05-29',35,60000,115000,5,'S'),(6,'750ml (Botella)','2019-05-29',40,70000,135000,6,'S'),(7,'750ml (Botella)','2019-05-29',45,47000,95000,7,'S'),(8,'750ml (Botella)','2019-05-29',38,60000,110000,8,'S'),(9,'750ml (Botella)','2019-05-29',45,52000,95000,9,'S'),(10,'2000ml (Garrafa)','2019-05-29',40,90000,160000,10,'S'),(11,'1000ml (Litro)','2019-05-29',50,50000,95000,10,'S'),(12,'375ml (Media)','2019-05-29',40,20000,35000,10,'S'),(13,'2000ml (Garrafa)','2019-05-29',67,80000,150000,11,'S'),(14,'2000ml Sin Azucar (Garrafa)','2019-05-29',60,85000,155000,11,'S'),(15,'1000ml (Litro)','2019-05-29',42,43000,85000,11,'S'),(16,'1000ml Sin Azucar (Litro)','2019-05-29',45,45000,90000,11,'S'),(17,'750ml (Botella)','2019-05-29',40,38000,75000,11,'S'),(18,'750ml Sin Azucar (Botella)','2019-05-29',45,40000,80000,11,'S'),(19,'375ml (Media)','2019-05-29',44,16000,28000,11,'S'),(20,'375ml Sin Azucar (Media)','2019-05-29',44,18000,30000,11,'S'),(21,'Cerveza 355ml','2019-06-12',50,2600,3000,12,'S'),(22,'Cerveza 355ml','2019-06-12',60,4500,6000,12,'S'),(23,'Cerveza 330ml','2019-06-12',40,4000,4500,13,'S'),(24,'Cerveza 330ml','2019-06-12',60,3200,3500,14,'S'),(25,'Cerveza 263ml','2019-06-12',45,2100,2500,15,'S'),(26,'Cerveza 355ml','2019-06-12',40,2400,3000,16,'S'),(27,'Cerveza 355ml','2019-06-12',70,2500,3000,17,'S'),(28,'Cerveza 355ml','2019-06-12',65,3000,3500,18,'S');
/*!40000 ALTER TABLE `detalles_productos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `idventas` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(16) NOT NULL,
  `Fecha_Registro` date NOT NULL,
  `Hora_Registro` time NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`idventas`),
  KEY `idUsuario_ventas_idx` (`idUsuario`),
  CONSTRAINT `idUsuario_ventas` FOREIGN KEY (`idUsuario`) REFERENCES `informacion_usuarios` (`idInformacionUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_ventas`
--

DROP TABLE IF EXISTS `detalles_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_ventas` (
  `iddetallesventas` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`iddetallesventas`),
  KEY `idProducto_detallesV_idx` (`idProducto`),
  KEY `idVenta_detallesV_idx` (`idVenta`),
  CONSTRAINT `idProducto_detallesV` FOREIGN KEY (`idProducto`) REFERENCES `detalles_productos` (`idDetallesProductos`),
  CONSTRAINT `idVenta_detallesV` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_ventas`
--

LOCK TABLES `detalles_ventas` WRITE;
/*!40000 ALTER TABLE `detalles_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_ventas` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-24 18:15:08