/*
    Procedure para carga do OLTP para o Staging da tabela
    veiculo.
*/
use OLTP
go

create procedure Carga_veiculo_Staging(@dataCarga datetime) as
declare @Vei_Id int,
        @Vei_Cor varchar(40),
        @Vei_Modelo varchar(20),
        @Vei_Placa char(7),
        @Vei_Tipo varchar(100),
        @Vei_Marca varchar(100)

declare C_Veiculo cursor for
select olVei.id id,
       olVei.cor cor,
       olVei.modelo modelo,
       olVei.placa placa,
       olTVei.descricao tipo_veiculo,
       olMarca.descricao marca
from OLTP.dbo.Veiculo olVei
     join OLTP.dbo.Marca olMarca
         on olVei.marca_id = olMarca.id
     join OLTP.dbo.Tipo_Veiculo olTVei
         on olVei.tipo_id = olTVei.id
begin
    set @dataCarga = isnull(@dataCarga, getdate());
    open C_Veiculo 
    fetch C_Veiculo into @Vei_Id,
                         @Vei_Cor,
                         @Vei_Modelo,
                         @Vei_Placa,
                         @Vei_Tipo,
                         @Vei_Marca
    while (@@FETCH_STATUS = 0) begin
        insert into STAGING.dbo.Veiculo
            (id_oltp,
             cor,
             modelo,
             placa,
             tipo,
             marca,
             data_carga)
        values(@Vei_Id,
               @Vei_Cor,
               @Vei_Modelo,
               @Vei_Placa,
               @Vei_Tipo,
               @Vei_Marca,
               @dataCarga);
        fetch C_Veiculo into @Vei_Id,
                         @Vei_Cor,
                         @Vei_Modelo,
                         @Vei_Placa,
                         @Vei_Tipo,
                         @Vei_Marca
    end
    close C_Veiculo
    deallocate C_Veiculo
end
