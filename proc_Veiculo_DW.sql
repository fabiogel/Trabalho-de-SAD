/*
    PRocedure de carga do banco staging para o DW da dimensão
    veiculo, tipo 2.
*/

USE DW
go

create procedure Carga_Veiculo_DW(@dataCarga datetime) as
declare @Vei_Id int,
        @Vei_Placa char(7),
        @Vei_Modelo varchar(20),
        @Vei_Marca varchar(100),
        @Vei_Tipo varchar(100),
        @Vei_Cor varchar(40)

declare C_Cliente_St cursor for
select id_oltp id,
       placa,
       modelo,
       marca,
       tipo,
       cor
from STAGING.dbo.Veiculo

begin
    open C_Cliente_St
    fetch C_Cliente_St into @Vei_Id,
                            @Vei_Placa,
                            @Vei_Modelo,
                            @Vei_Marca,
                            @Vei_Tipo,
                            @Vei_Cor

    while (@@FETCH_STATUS = 0) begin
        if exists (select * 
                   from DW.dbo.Veiculo v1
                   where v1.id_oltp = @Vei_Id)
        begin
            update DW.dbo.Veiculo
            set id_oltp = @Vei_Id,
                placa   = @Vei_Placa,
                modelo  = @Vei_Modelo,
                tipo    = @Vei_Tipo,
                cor     = @Vei_Cor,
                marca   = @Vei_Marca
            where id_oltp = @Vei_Id
        end
        else begin
            insert into DW.dbo.Veiculo(
                id_oltp,
                placa,
                modelo,
                tipo,
                cor,
                marca)
            values(@Vei_Id,
                   @Vei_Placa,
                   @Vei_Modelo,
                   @Vei_Tipo,
                   @Vei_Cor,
                   @Vei_Marca)
        end
        fetch C_Cliente_St into @Vei_Id,
                            @Vei_Placa,
                            @Vei_Modelo,
                            @Vei_Marca,
                            @Vei_Tipo,
                            @Vei_Cor
    end

    close C_Cliente_St
    deallocate C_Cliente_St
end