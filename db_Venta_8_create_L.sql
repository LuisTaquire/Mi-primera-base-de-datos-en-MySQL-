
CREATE TABLE Cliente (
    idClient int NOT NULL COMMENT 'Este campo es Identificador de cada cliente registrado.',
    nomClient varchar(70) NULL COMMENT 'Contiene los Nombres del cliente',
    apeClinet varchar(100) NULL COMMENT 'Contiene los Apellidos del cliente.',
    dniClient char(8) NULL COMMENT 'Contiene el número de DNI(Documento Nacional de Idenetidad) del Cliente',
    dirClient varchar(100) NOT NULL COMMENT 'contiene la Dirección del domicilio del Cliente.',
    Telef_Client varchar(9) NOT NULL,
    Email_Client varchar(50) NOT NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY (idClient)
) COMMENT 'Esta tabla contiene toda la información de los clientes.';

-- Table: Producto
CREATE TABLE Producto (
    idProd int NOT NULL COMMENT 'Contiene el identificador de cada Producto',
    descProd varchar(150) NULL COMMENT 'Contiene la Descripción del Producto',
    preunitProd decimal(6,2) NULL COMMENT 'Contiene el precio unitario en Soles Peruanos',
    CONSTRAINT Producto_pk PRIMARY KEY (idProd)
) COMMENT 'Contiene toda la información de los productos que se van a vender';

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    idVentDet int NOT NULL COMMENT 'Contiene el Identificador de cada producto vendido.',
    idProd int NOT NULL COMMENT 'Identificador del Producto que se esta vendiendo.',
    Venta_codVent char(4) NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (idVentDet)
) COMMENT 'Contiene el detalle de Productos Vendidos a los Clientes.';

-- Table: Venta
CREATE TABLE Venta (
    codVent char(4) NOT NULL COMMENT 'Contiene el identificador de cada venta teniendo en cuenta que el código esta conformado una letra y tres números,por ejemplo:V001',
    fecVenta date NULL COMMENT 'Contiene la fecha en que se realizó la venta',
    idClient int NOT NULL COMMENT 'Identificador del Cliente al que voy a vender el producto',
    CONSTRAINT Venta_pk PRIMARY KEY (codVent)
) COMMENT 'Contiene los datos referentes al cliente y fecha de venta';

-- foreign keys
-- Reference: VENTA_DETALLE_Producto (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_Producto FOREIGN KEY VENTA_DETALLE_Producto (idProd)
    REFERENCES Producto (idProd);

-- Reference: VENTA_DETALLE_Venta (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_Venta FOREIGN KEY VENTA_DETALLE_Venta (Venta_codVent)
    REFERENCES Venta (codVent);

-- Reference: Venta_Cliente (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Cliente FOREIGN KEY Venta_Cliente (idClient)
    REFERENCES Cliente (idClient);

-- End of file.

