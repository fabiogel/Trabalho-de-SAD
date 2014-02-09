create database DW
go
use DW

--DW tables
-- tabelas dimensões
create table Cliente(
    id integer not null identity,
    id_oltp integer not null,
    nome varchar(255) not null,
    endereco varchar(255) not null, --rua - numero
    cidade varchar(255) not null,
    estado varchar(255) not null,
    pais varchar(255) not null,
    telefone char(10) not null,
    cpf char(11) not null,
    data_inicio datetime not null, --data de criação do registro
    data_fim datetime null,             --data em que o registro deixou de ser o atual
    constraint cliente_pk primary key (id)
);

create table Tempo(
    id integer not null identity,
    nivel char(8) not null,
    datat date not null,
    ano integer not null,
    mes tinyint null,
    dia tinyint null,
    quinzena tinyint null,
    trimestre tinyint null,
    semestre tinyint null,
    fimMes char(3) null,
    diaUtil char(3) null,
    feriado char(3) null,
    fimsemana char(3) null,
    diaSemana varchar(25) null,
    nomeMes varchar(10) null,
    nomeTrimestre varchar(20) null,
    nomeSemestre varchar(20) null,
    estacao varchar(20) null,
    constraint TEMPO_PK primary key (id)
);

create table Veiculo(
    id integer not null identity,
    id_oltp integer not null,
    placa char(7) not null,
    modelo varchar(255) not null,
    tipo varchar(255) not null,
    cor varchar(255) not null,
    marca varchar(255) not null,
    constraint VEICULO_PK primary key (id)
);

-- tabela fato
create table Manutencao(
    id integer not null identity,
    data_manutencao integer not null,
    id_cliente integer not null,
    id_veiculo integer not null,
    --atributos aditivos
    valor real not null,
    --constraints
    constraint MANUTENCAO_PK primary key (id),
    constraint DATA_FK foreign key (data_manutencao) 
        references Tempo (id),
    constraint ID_CLIENTE foreign key (id_cliente)
        references Cliente(id),
    constraint ID_VEICULO foreign key (id_veiculo)
        references Veiculo(id)
);