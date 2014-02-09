use DW
go

/*
    Procedimento para a catga da dimensão cliente no dw,
    com histórico tipo 1.
*/

--TODO: colocar isso em 'tractions'!
create procedure Carga_Cliente_DW(@dataCarga datetime) as
declare @Cli_Id int,
        @Cli_Nome varchar(255),
        @Cli_Endereco varchar(255),
        @Cli_CIdade varchar(255),
        @Cli_Estado varchar(255),
        @Cli_Pais varchar(255),
        @Cli_Telefone varchar(10),
        @Cli_Cpf varchar(11)

declare C_Cliente_St cursor for
select  id_oltp id,
        nome,
        endereco,
        cidade,
        estado,
        pais,
        telefone,
        cpf
from STAGING.dbo.Cliente

begin
    set @dataCarga = isnull(@dataCarga, getdate())
    
    open C_Cliente_st
    -- pega a primeira linha
    fetch C_Cliente_St into @Cli_Id,
                            @Cli_Nome,
                            @Cli_Endereco,
                            @Cli_Cidade,
                            @Cli_Estado,
                            @Cli_Pais,
                            @Cli_Telefone,
                            @Cli_Cpf

    while (@@FETCH_STATUS = 0) begin
        --aqui faz o load dos mano... iow!
        if exists(select * 
                  from DW.dbo.Cliente cl2
                  where cl2.id_oltp = @Cli_Id
                        and cl2.data_fim = null)
        begin
            --finalizamos esse registro
            update DW.dbo.Cliente
                set data_fim = @dataCarga
            where id_oltp = @Cli_Id
                  and data_fim = null
        end
        --inserimos um novo
        insert into DW.dbo.Cliente(
            id_oltp,
            nome,
            endereco,
            cidade,
            estado,
            pais,
            telefone,
            cpf,
            data_inicio
        )
        values(
            @Cli_Id,
            @Cli_Nome,
            @Cli_Endereco,
            @Cli_CIdade,
            @Cli_Estado,
            @Cli_Pais,
            @Cli_Telefone,
            @Cli_Cpf,
            @dataCarga
        )

        --pega mais uma linha
        fetch C_Cliente_St into @Cli_Id,
                            @Cli_Nome,
                            @Cli_Endereco,
                            @Cli_Cidade,
                            @Cli_Estado,
                            @Cli_Pais,
                            @Cli_Telefone,
                            @Cli_Cpf
    end

    close C_Cliente_St
    deallocate C_Cliente_St
end