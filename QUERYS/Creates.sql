CREATE TABLE Lugar (
    Codigo_lugar NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Tipo_lugar varchar(30) not null,
    Nombre_lugar varchar(30) not null,
    FK_Lugar number,
    Poblacion_lugar number,
    bandera_lugar BLOB,
    constraint FK_Lugar foreign key(FK_Lugar) references Lugar(Codigo_lugar)
);

CREATE TABLE Persona (
    Codigo_persona NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Genero varchar(10) not null,
    foto_persona BLOB,
    Datos_basicos Datos_basicos_personas,
    Direccion_persona Complemento_direccion,
    FK_Lugar number,
    constraint FK_Lugar_Persona foreign key(FK_Lugar) references Lugar(Codigo_lugar)
);

CREATE TABLE Clinica(
    Codigo_clinica NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre_clinica varchar(30) not null,
    Direccion_clinica Complemento_direccion,
    Numero_camas number not null,
    FK_Lugar_Clinica number,
    constraint FK_Lugar_Clinica foreign key(FK_Lugar_Clinica) references Lugar(Codigo_lugar)
);

CREATE TABLE Condicion(
    Codigo_condicion NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre_condicion varchar(30) not null
);

CREATE TABLE Patologia(
    Codigo_patologia NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre_patologia varchar(30) not null
);

CREATE TABLE Sintoma(
    Codigo_sintoma NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre_sintoma varchar(30) not null
);

CREATE TABLE Modelo_Aislamiento(
    Codigo_aislamiento NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre_aislamiento varchar(30) not null,
    Descripcion_aislamiento varchar(1000) not null
);

CREATE TABLE Frontera(
    Codigo_frontera NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Fecha_frontera Fecha_inicio_fin 
);

CREATE TABLE Ayuda_Humanitaria(
    Codigo_ayuda NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Fecha_ayuda date not null,
    Dinero_donado number not null,
    FK_Lugar_ofrece_ayuda number,
    FK_Lugar_recibe_ayuda number,
    constraint FK_Lugar_ofrece_ayuda foreign key(FK_Lugar_ofrece_ayuda) references Lugar(Codigo_lugar),
    constraint FK_Lugar_recibe_ayuda foreign key(FK_Lugar_recibe_ayuda) references Lugar(Codigo_lugar)
);

CREATE TABLE Vuelo(
    Numero_vuelo NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Aerolinea_vuelo varchar(100) not null,
    Fecha_hora_llegada date not null,
    FK_Lugar_origen number,
    FK_Lugar_destino number,
    constraint FK_Lugar_origen foreign key(FK_Lugar_origen) references Lugar(Codigo_lugar),
    constraint FK_Lugar_destino foreign key(FK_Lugar_destino) references Lugar(Codigo_lugar)
);

CREATE TABLE Viaje(
    Codigo_viaje NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Fecha_viaje Fecha_inicio_fin 
);

CREATE TABLE Insumo(
    Codigo_insumo NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre_insumo varchar(100) not null,
    Descripcion_insumo varchar(1000) not null
);

CREATE TABLE Proveedor_Internet(
    Codigo_proveedor NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Nombre_proveedor varchar(30) not null,
    Direccion_proveedor  Complemento_direccion
);

CREATE TABLE Condicion_Persona(
    Codigo_condicion_persona NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Fecha_condicion date not null,
    FK_Condicion number,
    FK_Persona number,
    CONSTRAINT FK_Condicion_Persona_Condicion FOREIGN KEY(FK_Condicion) references Condicion(Codigo_condicion),
    CONSTRAINT FK_Condicion_Persona_Persona FOREIGN KEY(FK_Persona) references Persona(Codigo_persona)
);

CREATE TABLE Persona_Patologia(
    Codigo_persona_patologia NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    FK_Patologia number,
    FK_Persona number,
    CONSTRAINT FK_Persona_Patologia_Patologia FOREIGN KEY(FK_Patologia) references Patologia(Codigo_patologia),
    CONSTRAINT FK_Persona_Patologia_Persona FOREIGN KEY(FK_Persona) references Persona(Codigo_persona)
);

CREATE TABLE Lugar_Modelo(
    Codigo_Lugar_Modelo NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Fecha_Lugar_Modelo Fecha_Inicio_Fin,
    FK_Modelo_Aislamiento number,
    FK_Lugar number,
    CONSTRAINT FK_Lugar_Modelo_Modelo_Aislamiento FOREIGN KEY(FK_Modelo_Aislamiento) references Modelo_Aislamiento(Codigo_aislamiento),
    CONSTRAINT FK_Lugar_Modelo_Lugar FOREIGN KEY(FK_Lugar) references Lugar(Codigo_lugar)
);

CREATE TABLE Lugar_Proveedor(
    Codigo_Lugar_Proveedor NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Fecha date not null,
    Velocidad_subida number not null,
    Velocidad_descarga number not null,
    Horas_interrupcion number not null,
    FK_Proveedor_Internet number,
    FK_Lugar number,
    CONSTRAINT FK_Lugar_Proveedor_Proveedor_Internet FOREIGN KEY(FK_Proveedor_Internet) references Proveedor_Internet(Codigo_proveedor),
    CONSTRAINT FK_Lugar_Proveedor_Lugar FOREIGN KEY(FK_Lugar) references Lugar(Codigo_lugar)
);

CREATE TABLE Lugar_Viaje(
    Codigo_lugar_viaje NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    FK_Lugar number,
    FK_Viaje number,
    CONSTRAINT FK_Lugar_Viaje_Lugar FOREIGN KEY(FK_Lugar) references Lugar(Codigo_lugar),
    CONSTRAINT FK_Lugar_Viaje_Viaje FOREIGN KEY(FK_Viaje) references Viaje(Codigo_viaje)
);

CREATE TABLE Vuelo_Viaje(
    Codigo_vuelo_viaje NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    FK_Viaje number,
    FK_Vuelo number,
    CONSTRAINT FK_Vuelo_Viaje_Viaje FOREIGN KEY(FK_Viaje) references Viaje(Codigo_viaje),
    CONSTRAINT FK_Vuelo_Viaje FOREIGN KEY(FK_Vuelo) references Vuelo(Numero_vuelo)
);

CREATE TABLE Vuelo_Persona(
    Codigo_vuelo_persona NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    FK_Vuelo number,
    FK_Persona number,
    CONSTRAINT FK_Vuelo_Persona_Vuelo FOREIGN KEY(FK_Vuelo) references Vuelo(Numero_vuelo),
    CONSTRAINT FK_Vuelo_Persona_Persona FOREIGN KEY(FK_Persona) references Persona(Codigo_persona)
);

CREATE TABLE Clinica_Insumo(
    Codigo_clinica_insumo NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    FK_Insumo number,
    FK_Clinica number,
    CONSTRAINT FK_Clinica_Insumo_Insumo FOREIGN KEY(FK_Insumo) references Insumo(Codigo_insumo),
    CONSTRAINT FK_Clinica_Insumo_Clinica FOREIGN KEY (FK_Clinica) references Clinica(Codigo_clinica)
);

CREATE TABLE Ayuda_Insumo(
    Codigo_ayuda_insumo NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Cantidad_donada number not null,
    FK_Insumo number,
    FK_Ayuda_Humanitaria number,
    CONSTRAINT FK_Ayuda_Insumo_Insumo FOREIGN KEY(FK_Insumo) references Insumo(Codigo_insumo),
    CONSTRAINT FK_Ayuda_Insumo_Ayuda_Humanitaria FOREIGN KEY(FK_Ayuda_Humanitaria) references Ayuda_Humanitaria(Codigo_ayuda)
);

CREATE TABLE Persona_Clinica(
    Codigo_persona_clinica NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Tratado_persona_clinica varchar(25) not null,
    FK_Clinica number,
    FK_Persona number,
    CONSTRAINT FK_Persona_Clinica_Clinica FOREIGN KEY(FK_Clinica) references Clinica(Codigo_clinica),
    CONSTRAINT FK_Persona_Clinica_Persona FOREIGN KEY(FK_Persona) references Persona(Codigo_persona)
);
CREATE TABLE Persona_Sintoma(
    Codigo_persona_sintoma NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Fecha_sintoma date,
    FK_Sintoma number,
    FK_Persona number,
    CONSTRAINT FK_Persona_Sintoma_Sintoma FOREIGN KEY(FK_Sintoma) references Sintoma(Codigo_sintoma),
    CONSTRAINT FK_Persona_Sintoma_Persona FOREIGN KEY(FK_Persona) references Persona(Codigo_persona)
);