/*
    Procedure para carga do OLTP para o Staging da tabela
    Manutenção..
*/
use OLTP
go

create procedure Carga_Manutencao_Staging(@dataCarga datetime) as
declare @Man_Id int,
        @Man_Data datetime,
        @Man_Vei int, --veiculo id
        @Man_Cli int, --cliente id
        @Man_Valor real

declare C_Manutencao cursor for
select olMan.id id,
       olMan.data_manutencao data_manutencao,
       olVei.id id_veiculo,
       olCli.id id_cliente,
       (select sum(itMan.preco*itMan.quantidade)
        from OLTP.dbo.Itens_Manutencao itMan
        where itMan.manutencao_id = olMan.id) valor
from OLTP.dbo.Manutencao olMan
     join OLTP.dbo.Veiculo olVei
        on olMan.veiculo_id = olVei.id
     join OLTP.dbo.Cliente olCli
        on olVei.cliente_id = olCli.id
begin
    set @dataCarga = isnull(@dataCarga, getdate());
    open C_Manutencao
    fetch C_Manutencao into @Man_Id,
                            @Man_Data,
                            @Man_Vei,
                            @Man_Cli,
                            @Man_Valor
    while (@@FETCH_STATUS = 0) begin
        insert into STAGING.dbo.Manutencao
            (id_oltp,
             id_cliente,
             id_veiculo,
             valor,
             data_manutencao,
             data_carga)
        values(@Man_id,
               @Man_Vei,
               @Man_Cli,
               @Man_Valor,
               @Man_Data,
               @dataCarga);
        fetch C_Manutencao into @Man_Id,
                                @Man_Data,
                                @Man_Vei,
                                @Man_Cli,
                                @Man_Valor
    end
    close C_Manutencao
    deallocate C_Manutencao
end
