USE [OLTP]
GO

------------------------------TABELA PAIS
INSERT INTO [dbo].[Pais]
           ([nome]
           ,[sigla])
     VALUES
           ('Brasil'
           ,'BR')
GO
------------------------------TABELA ESTADO
INSERT INTO [dbo].[Estado]
           ([nome]
           ,[sigla]
           ,[pais_id])
     VALUES
           ('Sergipe'
           ,'SE'
           ,1)
GO
INSERT INTO [dbo].[Estado]
     VALUES
           ('Bahia'
           ,'BA'
           ,1)
GO
INSERT INTO [dbo].[Estado]
     VALUES
           ('São Paulo'
           ,'SP'
           ,1)
GO
INSERT INTO [dbo].[Estado]
     VALUES
           ('Alagoas'
           ,'AL'
           ,1)
GO
INSERT INTO [dbo].[Estado]
     VALUES
           ('Rio de Janeiro'
           ,'RJ'
           ,1)
GO
------------------------------TABELA CIDADE
INSERT INTO [dbo].[Cidade]
           ([nome]
           ,[estado_id])
     VALUES
           ('Tobias Barreto'
           ,1)
GO
INSERT INTO [dbo].[Cidade]
     VALUES
           ('Lagarto'
           ,1)
GO
INSERT INTO [dbo].[Cidade]
     VALUES
           ('Salvador'
           ,2)
GO
INSERT INTO [dbo].[Cidade]
     VALUES
           ('Guarulhos'
           ,3)
GO
INSERT INTO [dbo].[Cidade]
     VALUES
           ('Aracaju'
           ,1)
GO
INSERT INTO [dbo].[Cidade]
     VALUES
           ('Maceió'
           ,4)
GO
INSERT INTO [dbo].[Cidade]
     VALUES
           ('Riacão do Dantas'
           ,1)
GO
INSERT INTO [dbo].[Cidade]
     VALUES
           ('São Critovão'
           ,1)
GO
INSERT INTO [dbo].[Cidade]
     VALUES
           ('Rio das Ostras'
           ,5)
GO
------------------------------TABELA CLIENTE

INSERT INTO [dbo].[Cliente]
           ([nome]
           ,[cpf]
           ,[telefone])
     VALUES
           ('Francisco Neto Zueiro'
           ,'12345678909'
           ,'7999997865')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Fabio Zueiro'
           ,'8965412'
           ,'7999999087')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Beto Zueiro'
           ,'165434'
           ,'7999999987')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Galileu Zueiro'
           ,'123789650'
           ,'7999999012')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Eduardo Zueiro'
           ,'12345'
           ,'7998679087')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Maria Zueira'
           ,'8965445'
           ,'799998888')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Fabiana Zueira'
           ,'1237892'
           ,'7999999087')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Carlos Zueiro'
           ,'1434'
           ,'7999996758')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Luan Zueiro'
           ,'12378965418'
           ,'7999999090')
GO
INSERT INTO [dbo].[Cliente]
     VALUES
           ('Marcos Zueiro'
           ,'12378968976'
           ,'7999999187')
GO

------------------------------TABELA ENDERECO
INSERT INTO [dbo].[Endereco]
           ([rua]
           ,[numero]
           ,[cliente_id]
           ,[cidade_id])
     VALUES
           ('Rua Antonio Viera'
           ,34
           ,1
           ,1)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua H'
           ,3
           ,2
           ,1)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua Marieta'
           ,29
           ,3
           ,3)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua Dr. Carlos Alberto'
           ,3
           ,4
           ,4)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua Maria Antonia'
           ,30
           ,5
           ,5)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua Antonio Prado'
           ,36
           ,6
           ,6)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua Charles José'
           ,34
           ,7
           ,7)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua Isaac Costa'
           ,56
           ,8
           ,8)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua João Antonio'
           ,25
           ,9
           ,9)
GO
INSERT INTO [dbo].[Endereco]
     VALUES
           ('Rua Antonio Carlos'
           ,23
           ,10
           ,5)
GO
------------------------------TABELA MARCA
INSERT INTO [dbo].[Marca]
           ([descricao])
     VALUES
           ('Fiat')
GO
INSERT INTO [dbo].[Marca]
     VALUES
           ('Ford')
GO
INSERT INTO [dbo].[Marca]
     VALUES
           ('Volksvagen')
GO
INSERT INTO [dbo].[Marca]
     VALUES
           ('Ferrary')
GO
INSERT INTO [dbo].[Marca]
     VALUES
           ('Mercedes Benz')
GO
INSERT INTO [dbo].[Marca]
     VALUES
           ('BMW')
GO
INSERT INTO [dbo].[Marca]
     VALUES
           ('Honda')
GO
------------------------------TABELA TIPO VEICULO
INSERT INTO [dbo].[Tipo_Veiculo]
           ([descricao])
     VALUES
           ('Carro')
GO
INSERT INTO [dbo].[Tipo_Veiculo]
     VALUES
           ('Moto')
GO


------------------------------TABELA VEICULO
INSERT INTO [dbo].[Veiculo]
           ([placa]
           ,[modelo]
           ,[cor]
           ,[tipo_id]
           ,[marca_id]
           ,[cliente_id])
     VALUES
           ('HZO3456'
           ,'Gol'
           ,'Preto'
           ,1
           ,1
           ,1)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('HZO3478'
           ,'Uno'
           ,'Preto'
           ,1
           ,2
           ,2)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('HZU3418'
           ,'Uno'
           ,'Branco'
           ,1
           ,3
           ,3)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('HZT8976'
           ,'CLK'
           ,'Prata'
           ,1
           ,4
           ,4)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('HZO3218'
           ,'Punto'
           ,'Cinza'
           ,1
           ,5
           ,5)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('OEN3478'
           ,'Meriva'
           ,'Preto'
           ,1
           ,4
           ,6)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('UTR6785'
           ,'Chevette'
           ,'Verde'
           ,1
           ,5
           ,7)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('HZI1234'
           ,'Uno'
           ,'Preto'
           ,1
           ,6
           ,8)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('HZR7890'
           ,'CG'
           ,'Preto'
           ,2
           ,7
           ,9)
GO
INSERT INTO [dbo].[Veiculo]
     VALUES
           ('HZO4567'
           ,'Bros'
           ,'Laranja'
           ,2
           ,7
           ,10)
GO
------------------------------TABELA MANUTENÇÃO

INSERT INTO [dbo].[Manutencao]
           ([data_manutencao]
           ,[veiculo_id])
     VALUES
           ('07-08-2011 13:34:00'
           ,1)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('07-06-2014 13:56:00'
           ,2)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('08-08-2013 10:34:00'
           ,3)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('07-03-2011 13:45:00'
           ,4)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('06-08-2012 10:34:00'
           ,5)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('07-08-2013 13:34:00'
           ,6)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('07-10-2013 13:23:00'
           ,7)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('07-01-2014 16:34:00'
           ,8)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('07-09-2013 10:34:00'
           ,9)
GO
INSERT INTO [dbo].[Manutencao]
     VALUES
           ('07-08-2011 14:34:00'
           ,10)
GO
------------------------------TABELA SERVIÇO
INSERT INTO [dbo].[Peca_Servico]
           ([descricao])
     VALUES
           ('Pastilha de Freio')
GO
INSERT INTO [dbo].[Peca_Servico]
     VALUES
           ('Escapamento')
GO
INSERT INTO [dbo].[Peca_Servico]
     VALUES
           ('Biela')
GO
INSERT INTO [dbo].[Peca_Servico]
     VALUES
           ('Velas')
GO
INSERT INTO [dbo].[Peca_Servico]
     VALUES
           ('Cabo de Vela')
GO
INSERT INTO [dbo].[Peca_Servico]
     VALUES
           ('Cabo Acelerador')
GO
INSERT INTO [dbo].[Peca_Servico]
     VALUES
           ('Bomba de freio')
GO
INSERT INTO [dbo].[Peca_Servico]
     VALUES
           ('Oleo Motor')
GO


------------------------------TABELA ITENS MANUTENÇÃO
INSERT INTO [dbo].[Itens_Manutencao]
           ([quantidade]
           ,[preco]
           ,[observacao]
           ,[manutencao_id]
           ,[peca_id])
     VALUES
           (2
           ,45.90
           ,'Nenhuma'
           ,1
           ,1)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (1
           ,45.90
           ,'Nenhuma'
           ,2
           ,2)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (1
           ,30.00
           ,'Nenhuma'
           ,3
           ,3)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (1
           ,45.90
           ,'Nenhuma'
           ,4
           ,4)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (2
           ,50.00
           ,'Nenhuma'
           ,5
           ,5)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (1
           ,57.00
           ,'Nenhuma'
           ,6
           ,6)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (3
           ,15.00
           ,'Nenhuma'
           ,7
           ,7)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (1
           ,45.00
           ,'Nenhuma'
           ,8
           ,8)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (4
           ,30.00
           ,'Nenhuma'
           ,9
           ,1)
GO
INSERT INTO [dbo].[Itens_Manutencao]
     VALUES
           (1
           ,70.00
           ,'Nenhuma'
           ,10
           ,2)
GO








