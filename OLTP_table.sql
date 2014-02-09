create database OLTP
go
use OLTP
--OLTP tables

CREATE TABLE Cliente(
    id INTEGER NOT NULL identity,
	nome VARCHAR(200) NOT NULL,
    cpf char(11) NOT NULL,
    telefone char(10), --ex: 7999123456
    CONSTRAINT PK_CLIENTE PRIMARY KEY (id),
    CONSTRAINT TUC_CLI_CPF UNIQUE (cpf)
);

--Tabela Endereco
CREATE TABLE Endereco(
    id INTEGER NOT NULL identity,
	rua VARCHAR(200) NOT NULL,
    numero INTEGER NOT NULL,
    cliente_id integer not null,
	cidade_id INTEGER not null,
	CONSTRAINT PK_ENDERECO PRIMARY KEY (id)
);

--Tabela Veiculo
CREATE TABLE Veiculo(
    id INTEGER NOT NULL identity,
    placa CHAR(7) not null,
    modelo varchar(20) not null,
    cor VARCHAR(40) not null,
    tipo_id INTEGER not null,
    marca_id INTEGER not null,
	cliente_id INTEGER not null,
	CONSTRAINT PK_VEICULO PRIMARY KEY (id),
    CONSTRAINT TUC_VEICULO_1 UNIQUE (placa)
);

--Tabela Tipo Veiculo
CREATE TABLE Tipo_Veiculo (
    id INTEGER NOT NULL identity,
    descricao VARCHAR(100) not null,
    CONSTRAINT PK_TIPOVEICULO PRIMARY KEY (id)
);

--Tabela Marca
CREATE TABLE Marca (
    id INTEGER NOT NULL identity,
    descricao VARCHAR(100) not null,
    CONSTRAINT PK_MARCA PRIMARY KEY (id)
);

--Tabela Cidade
CREATE TABLE Cidade (
    id INTEGER NOT NULL identity,
    nome VARCHAR(80) not null,
    estado_id INTEGER NOT NULL,
    CONSTRAINT PK_Cidade PRIMARY KEY (id)
);

--tabela Estado
CREATE TABLE Estado (
    id INTEGER NOT NULL identity,
    nome VARCHAR(80) not null,
    sigla VARCHAR(2) not null,
    pais_id INTEGER NOT NULL,
    CONSTRAINT PK_Estado PRIMARY KEY (id)
);

--Tabela Pais
CREATE TABLE Pais (
    id INTEGER NOT NULL identity,
    nome VARCHAR(80) not null,
    sigla VARCHAR(3) not null,
    CONSTRAINT PK_Pais PRIMARY KEY (id)
);

--Tabela Servico
CREATE TABLE Peca_Servico (
    id INTEGER NOT NULL identity,
    descricao VARCHAR(100) not null,
    CONSTRAINT PK_PECASERVICO PRIMARY KEY (id)
);

--Tabela Manutenção
CREATE TABLE Manutencao (
    id INTEGER NOT NULL identity,
    data_manutencao DATETIME not null,
	veiculo_id INTEGER not null,
    CONSTRAINT PK_MANUTENCAO PRIMARY KEY (id)
);

--Tabela Itens Manutenção
CREATE TABLE Itens_Manutencao (
    id INTEGER NOT NULL identity,
    quantidade INTEGER not null,
    preco FLOAT not null,
    observacao VARCHAR(200),
	manutencao_id INTEGER not null,
    peca_id INTEGER NOT NULL,
    CONSTRAINT PK_ITENS_MANUTENCAO PRIMARY KEY (id),
);

--Criação das Chaves estrangeiras
--tabela Veiculo
ALTER TABLE VEICULO ADD CONSTRAINT VEICULO_CLIENTE
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE (ID);
ALTER TABLE VEICULO ADD CONSTRAINT VEICULO_TIPO_VEICULO
    FOREIGN KEY (tipo_id) REFERENCES TIPO_VEICULO (ID);
ALTER TABLE VEICULO ADD CONSTRAINT VEICULO_MARCA
    FOREIGN KEY (marca_id) REFERENCES MARCA (ID);
--tabela Endereço
alter table endereco add constraint endereco_cliente
    foreign key (cliente_id) references Cliente(id);
ALTER TABLE ENDERECO ADD CONSTRAINT ENDERECO_CIDADE
    FOREIGN KEY (cidade_id) REFERENCES CIDADE (ID);
--tabela Cidade
ALTER TABLE CIDADE ADD CONSTRAINT CIDADE_ESTADO 
    FOREIGN KEY (estado_id) REFERENCES ESTADO (ID);
--tabela Estado
ALTER TABLE ESTADO ADD CONSTRAINT ESTADO_PAIS 
    FOREIGN KEY (pais_id) REFERENCES PAIS (ID);
--tabela Manutenção
ALTER TABLE MANUTENCAO ADD CONSTRAINT MANUTENCAO_VEICULO
    FOREIGN KEY (veiculo_id) REFERENCES VEICULO (ID);
--tabela Itens_Manutenção
ALTER TABLE ITENS_MANUTENCAO ADD CONSTRAINT ITENS_MANUTENCAO_MANUTENCAO
    FOREIGN KEY (manutencao_id) REFERENCES MANUTENCAO (ID);
ALTER TABLE ITENS_MANUTENCAO ADD CONSTRAINT ITENS_MANUTENCAO_PECA_SERVICO
    FOREIGN KEY (peca_id) REFERENCES PECA_SERVICO (ID);
