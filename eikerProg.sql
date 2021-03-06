USE [LoanCalculator]
GO
/****** Object:  Table [dbo].[ConfigurationMonthsTime]    Script Date: 10/18/2019 5:54:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigurationMonthsTime](
	[MonthsTimeId] [int] IDENTITY(1,1) NOT NULL,
	[ConfigurationMonths] [int] NULL,
	[YearsTime] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MonthsTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConfigurationTableCalculator]    Script Date: 10/18/2019 5:54:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigurationTableCalculator](
	[CalculatorId] [int] IDENTITY(1,1) NOT NULL,
	[ConfigurationTimeId] [int] NULL,
	[TimestoLend] [varchar](50) NULL,
	[TimeMax] [int] NULL,
	[TimeMin] [int] NULL,
	[AdministrativeExpense] [decimal](9, 2) NULL,
	[LifeInsuranceTax] [decimal](9, 2) NULL,
	[Discount] [decimal](9, 2) NULL,
	[Surcharge] [decimal](9, 2) NULL,
	[BaseRate] [decimal](9, 2) NULL,
	[TotalRate] [decimal](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CalculatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConfigurationTime]    Script Date: 10/18/2019 5:54:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigurationTime](
	[ConfigurationTimeId] [int] IDENTITY(1,1) NOT NULL,
	[ConfigurationName] [varchar](100) NULL,
	[ConfigurationStatus] [bit] NULL,
	[ConfigurationDiscount] [numeric](18, 8) NULL,
	[ConfigurationLenLoan] [int] NULL,
	[ConfigurationTimeMax] [int] NULL,
	[ConfigurationTimeMin] [int] NULL,
	[ConfigurationAdminexpense] [numeric](18, 8) NULL,
	[ConfigurationMedicaInsurance] [numeric](18, 8) NULL,
	[ConfigurationSurcharge] [numeric](18, 8) NULL,
	[ConfigurationBaseRate] [numeric](18, 8) NULL,
	[ConfigurationMinimumAamount] [numeric](18, 8) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConfigurationTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ConfigurationMonthsTime] ON 

INSERT [dbo].[ConfigurationMonthsTime] ([MonthsTimeId], [ConfigurationMonths], [YearsTime]) VALUES (1, 12, 1)
INSERT [dbo].[ConfigurationMonthsTime] ([MonthsTimeId], [ConfigurationMonths], [YearsTime]) VALUES (2, 24, 2)
INSERT [dbo].[ConfigurationMonthsTime] ([MonthsTimeId], [ConfigurationMonths], [YearsTime]) VALUES (3, 36, 3)
SET IDENTITY_INSERT [dbo].[ConfigurationMonthsTime] OFF
SET IDENTITY_INSERT [dbo].[ConfigurationTableCalculator] ON 

INSERT [dbo].[ConfigurationTableCalculator] ([CalculatorId], [ConfigurationTimeId], [TimestoLend], [TimeMax], [TimeMin], [AdministrativeExpense], [LifeInsuranceTax], [Discount], [Surcharge], [BaseRate], [TotalRate]) VALUES (1, 2, N'hasta 2 veces', 36, 12, CAST(6.00 AS Decimal(9, 2)), CAST(2.50 AS Decimal(9, 2)), CAST(5.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(25.00 AS Decimal(9, 2)), CAST(28.50 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[ConfigurationTableCalculator] OFF
SET IDENTITY_INSERT [dbo].[ConfigurationTime] ON 

INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (1, N'Menos de 1 Año', 1, CAST(0.00000000 AS Numeric(18, 8)), 0, 0, 0, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (2, N'Entre 1 y 2 Años', 1, CAST(2.50000000 AS Numeric(18, 8)), 2, 12, 1, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(35.00000000 AS Numeric(18, 8)), CAST(35000.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (3, N'Entre 2 y 3 Años', 1, CAST(3.50000000 AS Numeric(18, 8)), 2, 24, 1, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(35.00000000 AS Numeric(18, 8)), CAST(35000.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (4, N'Entre 3 y 4 Años', 1, CAST(6.20000000 AS Numeric(18, 8)), 3, 36, 1, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(35.00000000 AS Numeric(18, 8)), CAST(35000.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (5, N'4 o mas Años', 1, CAST(6.00000000 AS Numeric(18, 8)), 3, 36, 1, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(35.00000000 AS Numeric(18, 8)), CAST(35000.00000000 AS Numeric(18, 8)))
SET IDENTITY_INSERT [dbo].[ConfigurationTime] OFF
/****** Object:  StoredProcedure [dbo].[SP_SET_ADD_INFORMATION_CALQULATER]    Script Date: 10/18/2019 5:54:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_SET_ADD_INFORMATION_CALQULATER] 
 --declare
  @RangoTiempo             varchar(50)='',
  @SueldoN                 decimal(9,2)=0.00,   
  @CuotaPrestamoFuera      decimal(9,2)=0.00,   
  @TiempoPrestamo          int=0,                
  @MontoSolicitado         decimal(9,2)=0.00    
   

       --set                  @RangoTiempo = N'4 o mas Años'
       --set                  @SueldoN = 100000
       --set                  @CuotaPrestamoFuera = 0
       --set                  @TiempoPrestamo = 36
       --set                  @Recargos = 0
       --set                  @MontoSolicitado = 200000 
 
AS

       ---Parametros internos

       DECLARE  @ConfigurationLenLoan   int=0                
       DECLARE  @TimeMax                int=0                
       DECLARE  @TimeMin                int=0                
       DECLARE  @GatoAdmin              decimal(9,2)=0.00    
       DECLARE  @Seguro                 decimal(9,2)=0.00    
       DECLARE  @Descuento              decimal(9,2)=0.00    
       DECLARE  @TasaBase               numeric (18,8)=0.00
       DECLARE  @TasaTotal              numeric(18,8)=0.00
       DECLARE  @MontoMinimo            numeric(18,8)=0.00
       DECLARE  @MontoMaximo            numeric(18,8)=0.00
       DECLARE  @MontoPrestar           numeric(18,8)=0.00
       DECLARE  @SalarioMensualDed      numeric(18,8)=0.00
       DECLARE  @Interescuota           numeric(18,8)=0.00
       DECLARE  @ValorCuota             numeric(18,8)=0.00  
       DECLARE  @capitaltotal           numeric(18,8)=0
       DECLARE  @factorinteres          numeric(18,8)=0.00 
       DECLARE  @montocuotaseguro       numeric(18,8)=0.00 
       DECLARE  @Recargos               numeric(18,8)=0.00 
	   DECLARE  @Mensaje                varchar(100)
	   DECLARE  @GastoAdmin             numeric(18,8)=0.00   
	    
	    ---SET Parametros internos
		  
      select @ConfigurationLenLoan=ConfigurationLenLoan,       
	         @TimeMax             =ConfigurationTimeMax,     
	         @TimeMin  		      =ConfigurationTimeMin, 
	         @GastoAdmin		  =ConfigurationAdminexpense,
	         @Seguro   		      =ConfigurationMedicaInsurance,   
	         @Descuento           =ConfigurationDiscount,
			 @Recargos            =ConfigurationSurcharge,
			 @TasaBase			  =ConfigurationBaseRate,
			 @MontoMinimo         =ConfigurationMinimumAamount
			 	    
     from   [dbo].[ConfigurationTime]
     where  ConfigurationStatus=1  and
	        ConfigurationName=@RangoTiempo 
 
  
    IF @TimeMin<1 
       
	     BEGIN 
              SET @Mensaje= 'Es requerido al menos 1 año de estar empleado' 
	    SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguro,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje 
         END
         
    IF @MontoSolicitado < @MontoMinimo

       BEGIN 
              SET @Mensaje= 'Minimo de monto a prestar es : '+CAST(@MontoMinimo AS VARCHAR(50));
			  SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguro,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje
       END 
     ELSE

       BEGIN 
        SET @MontoPrestar= @SueldoN * @ConfigurationLenLoan

       IF @MontoSolicitado > @MontoPrestar
	     BEGIN 
		      SET @Mensaje= 'Maximo de monto a prestar es : '+CAST(@MontoPrestar AS VARCHAR(50));
		 END ELSE BEGIN 
		 SET @Mensaje= 'OK';
		 END

       BEGIN 
              SET  @capitaltotal = @MontoSolicitado * (1+(@GastoAdmin/100))
              SET  @montocuotaseguro = (@MontoSolicitado * ((@Seguro/100)))/12
              SET  @TasaTotal=(@TasaBase)-@Descuento 
            	   
			--SELECT @TasaTotal,@TasaBase,@GatoAdmin,@Seguro,@Descuento
			
         SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100           

         SET @Interescuota= @factorinteres*@capitaltotal 

       SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@TiempoPrestamo,@capitaltotal) 
       
	   SET @SalarioMensualDed=@SueldoN-@CuotaPrestamoFuera        
       
	   SELECT @capitaltotal[BalanceInicial],
	          @Interescuota[Interes],
			  @ValorCuota[ValorCuota],
			  @ValorCuota-@Interescuota [Principal],
			  @montocuotaseguro[MontoCuotaSeguro], 
			  @montocuotaseguro + @ValorCuota [ValorCuotaMensual],
			  @Mensaje[Mensaje]
       END  



 END
  


 

GO
/****** Object:  StoredProcedure [dbo].[SP_SET_ADD_INFORMATION_CALQULATER_20191018]    Script Date: 10/18/2019 5:54:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_SET_ADD_INFORMATION_CALQULATER_20191018] 
 
  @RangoTiempo             varchar(50)='',
  @ConfigurationLenLoan    int=0,
  @TimeMax                 int=0,
  @TimeMin                 int=0,
  @GatoAdmin               decimal(9,2)=0.00,
  @Seguro                  decimal(9,2)=0.00,
  @Descuento               decimal(9,2)=0.00,
  @SueldoN                 decimal(9,2)=0.00,
  @CuotaPrestamoFuera      decimal(9,2)=0.00,
  @TiempoPrestamo          int=0,
  @Recargos                decimal(9,2)=0.00,
  @MontoSolicitado         decimal(9,2)=0.00
  
	AS
	DECLARE @TasaBase        decimal(9,2)=35.00
	DECLARE @TasaTotal       decimal(9,2)=0.00
	DECLARE @MontoMinimo     decimal(9,2)=35000.00
	DECLARE @MontoMaximo     decimal(9,2)=0.00
	DECLARE @MontoPrestar    decimal(9,2)=0.00
	DECLARE @SalarioMensualDed decimal(9,2)=0.00
	DECLARE @InteresTotal    decimal(9,2)=0.00
	DECLARE @ValorCuota      decimal(9,2)=0.00  

	 IF @TimeMin<1 
	 BEGIN 
	       SELECT 'Es requerido al menos 1 año de estar empleado'
	 END
	  
	 ELSE

	 BEGIN 
	 SET @MontoPrestar= @SueldoN * @ConfigurationLenLoan

	 IF @MontoSolicitado > @MontoPrestar

	 BEGIN 
	       SELECT 'Maximo de monto a prestar es : '+CAST(@MontoPrestar AS VARCHAR(50));
	 END 

	 ELSE 

	 IF @MontoSolicitado < @MontoMinimo

	 BEGIN 
	       SELECT 'Minimo de monto a prestar es : '+CAST(@MontoMinimo AS VARCHAR(50));
	 END

	 ELSE

	 BEGIN 
	      SET @TasaTotal=(@TasaBase+@GatoAdmin+@Seguro)-@Descuento 

		  SET @InteresTotal=@MontoSolicitado*@TasaTotal/100;

		  SET @ValorCuota=(@MontoSolicitado+@InteresTotal)/@TiempoPrestamo

		  SET @SalarioMensualDed=@SueldoN-@CuotaPrestamoFuera

		  SELECT  @TasaTotal[Tasa],
		          @MontoPrestar[Monto a Prestar],
				  @SalarioMensualDed[Salario Mansual Neto],
				  @MontoSolicitado[Monto Solicitado],
				  @InteresTotal[Total Interes],
				  @ValorCuota[Valor Cuota Mensual] 

	 END 
	 END
  

 
 
GO
