use DW
go

create procedure Carga_Tempo_DW(@dataInicial date, @dataFinal date) as
declare @dias int,
        @diaAtual int,
        @mesAtual int,
        @AnoAtual int,
        --utilizados nas exceções
        @errorNumber int,
        @errorLevel int
begin
    set @errorNumber = 50001 -->= 50000
    set @errorLevel  = 1     -- 0 - 255

    set @dias = datediff(day, @dataInicial, @dataFinal)
    begin try
        if (@dias < 0 or @dias = 0) begin
            throw @errorNumber,
                  'dataInicial deve ser maior que dataFinal!', 
                  @errorLevel;
        end

        

    end try
    begin catch
        throw;
    end catch
end