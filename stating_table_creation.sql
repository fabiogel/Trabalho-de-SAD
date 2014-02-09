create database STAGING
go
use STAGING


--staging tables
create table Cliente(
    id_oltp integer not null,
    nome varchar(255) not null,
    endereco varchar(255) not null,
    cidade varchar(255) not null,
    estado varchar(255) not null,
    pais varchar(255) not null,
    telefone char(10) not null,
    cpf char(11) not null,
    data_carga datetime not null
);

create table Veiculo(
    id_oltp integer not null,
    placa char(7) not null,
    modelo varchar(20) not null,
    marca varchar(100) not null,
    tipo varchar(100) not null,
    cor varchar(40) not null,
    data_carga datetime not null
);

create table Manutencao(
    id_oltp integer not null, --fato evolui ?
    id_cliente integer not null,
    id_veiculo integer not null,
    valor real not null,
    data_manutencao datetime not null,
    data_carga datetime not null
);