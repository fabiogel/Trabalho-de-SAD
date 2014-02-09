/*
    Procedure para carga do OLTP para o Staging da tabela
    cliente.
*/
use OLTP
go

create procedure Carga_Cliente_Staging(@dataCarga datetime) as
declare @Cli_Id int,
        @Cli_Nome varchar(255),
        @Cli_Telefone char(11),
        @Cli_Cpf char(10),
        @Cli_Cidade varchar(255),
        @Cli_Estado varchar(255),
        @Cli_Endereco varchar(255),
        @Cli_Pais varchar(255)

declare C_Cliente cursor for
select olCli.id id,
       olCli.nome nome,
       olCli.telefone telefone,
       olCli.cpf cpf,
       olEnd.rua + '-'+ CAST(olEnd.numero as varchar(10)) endereco,
       olCid.nome cidade,
       olEst.nome estado,
       olPais.nome pais
from OLTP.dbo.Cliente olCli
     join OLTP.dbo.Endereco olEnd
        on olCli.id = olEnd.cliente_id
     join OLTP.dbo.Cidade olCid
        on olCid.id = olEnd.cidade_id
     join OLTP.dbo.Estado olEst
        on olCId.estado_id = olEst.id
     join OLTP.dbo.Pais olPais
        on olEst.pais_id = olPais.id
begin
    set @dataCarga = isnull(@dataCarga, getdate());
    open C_Cliente 
    -- pega uma linha
    fetch C_Cliente into @Cli_Id,
                         @Cli_Nome,
                         @Cli_Telefone,
                         @Cli_Cpf,
                         @Cli_Endereco,
                         @Cli_Cidade,
                         @CLI_Estado,
                         @CLI_Pais
    while (@@FETCH_STATUS = 0) begin
        insert into STAGING.dbo.Cliente 
            (id_oltp,
             nome,
             telefone,
             cpf,
             endereco,
             cidade,
             estado,
             pais,
             data_carga)
        values(@Cli_Id,
               @Cli_Nome,
               @Cli_Telefone,
               @Cli_Cpf,
               @Cli_Endereco,
               @Cli_Cidade,
               @Cli_Estado,
               @Cli_Pais,
               @dataCarga);

        -- pega mais uma linha
        fetch C_Cliente into @Cli_Id,
                             @Cli_Nome,
                             @Cli_Telefone,
                             @Cli_Cpf,
                             @Cli_Endereco,
                             @Cli_Cidade,
                             @CLI_Estado,
                             @CLI_Pais
    end
    close C_Cliente
    deallocate C_Cliente
end
