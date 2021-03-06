USE [LoanCalculator]
GO
/****** Object:  UserDefinedFunction [dbo].[PMT]    Script Date: 10/23/2019 5:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE function [dbo].[PMT]
(
@rate float,
@periods smallint,
@principal numeric(18,7)
)
returns numeric (18,7)
as
begin
declare @pmt numeric (18,7)

declare @WK_periods numeric (18,7),
@WK_principal numeric (18,7),
@wk_One numeric (18,7),
@WK_power numeric (18,7)

select  @WK_periods = @periods,
@WK_principal = @principal,
@WK_One = 1

select  @pmt =

( @WK_principal * (@rate*power(@WK_One+@rate,@WK_periods)))
/ (power(@WK_One+@rate,@WK_periods)-@WK_One)


return @pmt

end

GO
/****** Object:  Table [dbo].[ConfigurationMonthsTime]    Script Date: 10/23/2019 5:32:22 PM ******/
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
/****** Object:  Table [dbo].[ConfigurationTableCalculator]    Script Date: 10/23/2019 5:32:22 PM ******/
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
/****** Object:  Table [dbo].[ConfigurationTime]    Script Date: 10/23/2019 5:32:22 PM ******/
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
/****** Object:  Table [dbo].[LoanCalculator_LOG]    Script Date: 10/23/2019 5:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanCalculator_LOG](
	[Log_Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Procedure_Id] [varchar](50) NULL,
	[Log_Value] [varchar](max) NOT NULL,
	[Create_Date] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PARAMETERS]    Script Date: 10/23/2019 5:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARAMETERS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FriendlyName] [nvarchar](100) NULL,
	[Description] [nvarchar](4000) NULL,
	[Value] [nvarchar](2000) NULL
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

INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (1, N'Seleccionar', 1, CAST(0.00000000 AS Numeric(18, 8)), 0, 0, 0, CAST(0.00000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (2, N'Menos de 1 Año', 0, CAST(0.00000000 AS Numeric(18, 8)), 0, 0, 0, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (3, N'Entre 1 y 2 Años', 1, CAST(2.50000000 AS Numeric(18, 8)), 2, 12, 1, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(35.00000000 AS Numeric(18, 8)), CAST(35000.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (4, N'Entre 2 y 3 Años', 1, CAST(3.50000000 AS Numeric(18, 8)), 2, 24, 1, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(35.00000000 AS Numeric(18, 8)), CAST(35000.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (5, N'Entre 3 y 4 Años', 1, CAST(6.20000000 AS Numeric(18, 8)), 3, 36, 1, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(35.00000000 AS Numeric(18, 8)), CAST(35000.00000000 AS Numeric(18, 8)))
INSERT [dbo].[ConfigurationTime] ([ConfigurationTimeId], [ConfigurationName], [ConfigurationStatus], [ConfigurationDiscount], [ConfigurationLenLoan], [ConfigurationTimeMax], [ConfigurationTimeMin], [ConfigurationAdminexpense], [ConfigurationMedicaInsurance], [ConfigurationSurcharge], [ConfigurationBaseRate], [ConfigurationMinimumAamount]) VALUES (6, N'4 o mas Años', 1, CAST(6.00000000 AS Numeric(18, 8)), 3, 36, 1, CAST(6.00000000 AS Numeric(18, 8)), CAST(2.50000000 AS Numeric(18, 8)), CAST(0.00000000 AS Numeric(18, 8)), CAST(35.00000000 AS Numeric(18, 8)), CAST(35000.00000000 AS Numeric(18, 8)))
SET IDENTITY_INSERT [dbo].[ConfigurationTime] OFF
SET IDENTITY_INSERT [dbo].[LoanCalculator_LOG] ON 

INSERT [dbo].[LoanCalculator_LOG] ([Log_Id], [Procedure_Id], [Log_Value], [Create_Date]) VALUES (1, N'SP_SET_ADD_INFORMATION_CALQULATER', N'["PARAMETERS: {\"RangoTiempo\":\"4 o mas Años\",\"SueldoN\":50000.0,\"CuotaPrestamoFuera\":0.0,\"TiempoPrestamo\":3,\"MontoSolicitado\":800000.0}"," RESPONSE: {\"BalanceInicial\":159000.00,\"Interes\":3842.50,\"Principal\":2820.51,\"ValorCuotaMensual\":6975.51,\"Mensaje\":\"Maximo de monto a prestar es : 150000.00\",\"ValorCuotas\":6663.01,\"MontoCuotaSeguros\":312.50,\"MontoPrestar\":150000.00,\"NivelMensaje\":\"MM \"}"]', CAST(N'2019-10-23T13:23:59.673' AS DateTime))
INSERT [dbo].[LoanCalculator_LOG] ([Log_Id], [Procedure_Id], [Log_Value], [Create_Date]) VALUES (2, N'SP_SET_ADD_INFORMATION_CALQULATER', N'["PARAMETERS: {\"RangoTiempo\":\"4 o mas Años\",\"SueldoN\":905555.0,\"CuotaPrestamoFuera\":0.0,\"TiempoPrestamo\":3,\"MontoSolicitado\":5000.0}"," RESPONSE: {\"BalanceInicial\":0.00,\"Interes\":0.00,\"Principal\":0.00,\"ValorCuotaMensual\":0.00,\"Mensaje\":\"Minimo de monto a prestar es RD$: 35000.00 Peso Dominicano\",\"ValorCuotas\":0.00,\"MontoCuotaSeguros\":0.00,\"MontoPrestar\":2716665.00,\"NivelMensaje\":\"MP \"}"]', CAST(N'2019-10-23T15:36:11.970' AS DateTime))
INSERT [dbo].[LoanCalculator_LOG] ([Log_Id], [Procedure_Id], [Log_Value], [Create_Date]) VALUES (3, N'SP_SET_ADD_INFORMATION_CALQULATER', N'["PARAMETERS: {\"RangoTiempo\":\"4 o mas Años\",\"SueldoN\":905555.0,\"CuotaPrestamoFuera\":0.0,\"TiempoPrestamo\":3,\"MontoSolicitado\":5000.0}"," RESPONSE: {\"BalanceInicial\":0.00,\"Interes\":0.00,\"Principal\":0.00,\"ValorCuotaMensual\":0.00,\"Mensaje\":\"Minimo de monto a prestar es RD$: 35000.00 Peso Dominicano\",\"ValorCuotas\":0.00,\"MontoCuotaSeguros\":0.00,\"MontoPrestar\":2716665.00,\"NivelMensaje\":\"MP \"}"]', CAST(N'2019-10-23T15:36:27.690' AS DateTime))
INSERT [dbo].[LoanCalculator_LOG] ([Log_Id], [Procedure_Id], [Log_Value], [Create_Date]) VALUES (4, N'SP_SET_ADD_INFORMATION_CALQULATER', N'["PARAMETERS: {\"RangoTiempo\":\"4 o mas Años\",\"SueldoN\":905555.0,\"CuotaPrestamoFuera\":0.0,\"TiempoPrestamo\":3,\"MontoSolicitado\":5000.0}"," RESPONSE: {\"BalanceInicial\":0.00,\"Interes\":0.00,\"Principal\":0.00,\"ValorCuotaMensual\":0.00,\"Mensaje\":\"Minimo de monto a prestar es RD$: 35000.00 Peso Dominicano\",\"ValorCuotas\":0.00,\"MontoCuotaSeguros\":0.00,\"MontoPrestar\":2716665.00,\"NivelMensaje\":\"MP \"}"]', CAST(N'2019-10-23T15:37:11.830' AS DateTime))
INSERT [dbo].[LoanCalculator_LOG] ([Log_Id], [Procedure_Id], [Log_Value], [Create_Date]) VALUES (5, N'SP_SET_ADD_INFORMATION_CALQULATER', N'["PARAMETERS: {\"RangoTiempo\":\"4 o mas Años\",\"SueldoN\":905555.0,\"CuotaPrestamoFuera\":0.0,\"TiempoPrestamo\":3,\"MontoSolicitado\":5000.0}"," RESPONSE: {\"BalanceInicial\":0.00,\"Interes\":0.00,\"Principal\":0.00,\"ValorCuotaMensual\":0.00,\"Mensaje\":\"Minimo de monto a prestar es RD$: 35000.00 Peso Dominicano\",\"ValorCuotas\":0.00,\"MontoCuotaSeguros\":0.00,\"MontoPrestar\":2716665.00,\"NivelMensaje\":\"MP \"}"]', CAST(N'2019-10-23T15:37:43.647' AS DateTime))
INSERT [dbo].[LoanCalculator_LOG] ([Log_Id], [Procedure_Id], [Log_Value], [Create_Date]) VALUES (6, N'SP_SET_ADD_INFORMATION_CALQULATER', N'["PARAMETERS: {\"RangoTiempo\":\"4 o mas Años\",\"SueldoN\":250000.0,\"CuotaPrestamoFuera\":0.0,\"TiempoPrestamo\":1,\"MontoSolicitado\":522222.0}"," RESPONSE: {\"BalanceInicial\":0.00,\"Interes\":0.00,\"Principal\":0.00,\"ValorCuotaMensual\":0.00,\"Mensaje\":\"No tiene capacidad de pago\",\"ValorCuotas\":0.00,\"MontoCuotaSeguros\":0.00,\"MontoPrestar\":750000.00,\"NivelMensaje\":\"MP \"}"]', CAST(N'2019-10-23T15:43:34.980' AS DateTime))
SET IDENTITY_INSERT [dbo].[LoanCalculator_LOG] OFF
SET IDENTITY_INSERT [dbo].[PARAMETERS] ON 

INSERT [dbo].[PARAMETERS] ([Id], [Name], [FriendlyName], [Description], [Value]) VALUES (1, N'PARAMETER_KEY_TIME_MAX_LOAN', N'', N'Tiempo Maximo de Prestamos', N'36')
INSERT [dbo].[PARAMETERS] ([Id], [Name], [FriendlyName], [Description], [Value]) VALUES (2, N'PARAMETER_KEY_TIME_MIN_LOAN', NULL, N'Tiempo Minimo de Prestamos', N'1')
INSERT [dbo].[PARAMETERS] ([Id], [Name], [FriendlyName], [Description], [Value]) VALUES (3, N'PARAMETER_KEY_MINIMUM_TO_LEND_MONEY', NULL, N'Minimo de prestamos', N'35000.00')
SET IDENTITY_INSERT [dbo].[PARAMETERS] OFF
/****** Object:  StoredProcedure [dbo].[FILL_DROP_DOWN]    Script Date: 10/23/2019 5:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[FILL_DROP_DOWN] 
   
@DropDownName VARCHAR(100)='',
@DropDownatribute  VARCHAR(100)=''
AS 
   IF @DropDownName='tiempos'
   BEGIN 
   --[Key],'Tarjeta de Credito'as [Values],0 as[ValuesNum]
   SELECT 
         ConfigurationTimeId[Key],
         ConfigurationName[Values],
         ConfigurationTimeMax[ValuesNum] 
   FROM
   [dbo].[ConfigurationTime] where ConfigurationStatus=1
   END

   IF @DropDownName='tiemposRecomendado' 
    IF @DropDownatribute='Menos de 1 Año'
   BEGIN 
    SELECT 
         MonthsTimeId[Key],
         ''[Values],
         ConfigurationMonths[ValuesNum] 
   FROM
   [dbo].[ConfigurationMonthsTime] where ConfigurationMonths in(0)  
   END 

   IF @DropDownatribute='Entre 1 y 2 Años'
   BEGIN 
    SELECT 
         MonthsTimeId[Key],
         ''[Values],
         ConfigurationMonths[ValuesNum] 
   FROM
   [dbo].[ConfigurationMonthsTime] where ConfigurationMonths in(12) 
   END 

   IF @DropDownatribute='Entre 2 y 3 Años'
   BEGIN 
    SELECT 
         MonthsTimeId[Key],
         ''[Values],
         ConfigurationMonths[ValuesNum] 
   FROM
   [dbo].[ConfigurationMonthsTime] where ConfigurationMonths in(12,24)
   
   END  

   IF @DropDownatribute='Entre 3 y 4 Años'
   BEGIN 
    SELECT 
          MonthsTimeId[Key],
         ''[Values],
         ConfigurationMonths[ValuesNum] 
   FROM
   [dbo].[ConfigurationMonthsTime] where ConfigurationMonths in(12,24,36)
 
   END

      IF @DropDownatribute='4 o mas Años'
   BEGIN 
    SELECT 
         MonthsTimeId[Key],
         ''[Values],
         ConfigurationMonths[ValuesNum] 
   FROM
   [dbo].[ConfigurationMonthsTime] where ConfigurationMonths in(12,24,36)
 
   END

 
  

GO
/****** Object:  StoredProcedure [dbo].[SP_SET_ADD_INFORMATION_CALQULATER]    Script Date: 10/23/2019 5:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_SET_ADD_INFORMATION_CALQULATER] 
--  declare 
  @RangoTiempo             varchar(50)='4 o mas Años',
  @SueldoN                 decimal(9,2)=100000,   
  @CuotaPrestamoFuera      decimal(9,2)=50000,   
  @TiempoPrestamo          int=3,                
  @MontoSolicitado         decimal(9,2)=300000    
 
 
AS 

       DECLARE  @ConfigurationLenLoan   int=0                
       DECLARE  @TimeMax                int=0                
       DECLARE  @TimeMin                int=0                
       DECLARE  @GatoAdmin              decimal(9,2)=0.00    
       DECLARE  @Seguro                 decimal(9,2)=0.00    
       DECLARE  @Descuento              decimal(9,2)=0.00    
       DECLARE  @TasaBase               numeric (18,8)=0.00
       DECLARE  @TasaTotal              numeric(18,8)=0.00
       DECLARE  @MontoMinimo            numeric(18,2)=0.00
       DECLARE  @MontoMaximo            numeric(18,8)=0.00
       DECLARE  @MontoPrestar           numeric(18,2)=0.00
       DECLARE  @SalarioMensualDed      numeric(18,8)=0.00
       DECLARE  @Interescuota           numeric(18,8)=0.00
       DECLARE  @ValorCuota             numeric(18,8)=0.00  
       DECLARE  @capitaltotal           numeric(18,8)=0
       DECLARE  @factorinteres          numeric(18,8)=0.00 
       DECLARE  @montocuotaseguro       numeric(18,8)=0.00 
       DECLARE  @Recargos               numeric(18,8)=0.00 
	   DECLARE  @Mensaje                varchar(100)
	   DECLARE  @GastoAdmin             numeric(18,8)=0.00   
	   DECLARE  @Tiempo                 int
	   DECLARE  @EspecialParametro      char(12)
	   DECLARE  @MAXIMO_PRESTAR         numeric(18,8)=0.00   
	    
	    ---SET Parametros internos
        DECLARE @Result TABLE (
		 BalanceInicial     numeric(18,2),
		 Interes            numeric(18,2),
		 ValorCuotas        numeric(18,2),
		 Principal          numeric(18,2),
		 MontoCuotaSeguros  numeric(18,2),
		 ValorCuotaMensual  numeric(18,2),
		 Mensaje            varchar(100),
		 MontoPrestar       numeric(18,2),
		 NivelMensaje       CHAR(50)
 )


		  
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
	        ConfigurationName=@RangoTiempo;
			
			SELECT  
                   @Tiempo=ConfigurationMonths       
             FROM  [dbo].[ConfigurationMonthsTime] where MonthsTimeId=@TiempoPrestamo
 
SET @MontoPrestar= @SueldoN * @ConfigurationLenLoan 


IF @TimeMin<1        
BEGIN 
              SET @Mensaje= 'Es requerido al menos 1 año de estar empleado' 
	   INSERT INTO @Result
	    SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje ,
			 @MontoPrestar AS MontoPrestar,
			 'R1' AS NivelMensaje

			 SELECT * FROM @Result
END 

IF @MontoSolicitado < @MontoMinimo
BEGIN 
              SET @Mensaje= 'Minimo de monto a prestar es RD$: '+CAST(@MontoMinimo AS VARCHAR(50))+' Peso Dominicano';
			  INSERT INTO @Result
			
			  SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje,
			 @MontoPrestar AS MontoPrestar,
			 'MP' AS NivelMensaje
              SELECT * FROM @Result
END 

SET  @TasaTotal=(@TasaBase)-@Descuento  
SET @MAXIMO_PRESTAR=@MontoPrestar
SET  @capitaltotal = @MAXIMO_PRESTAR * (1+(@GastoAdmin/100))
SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100   
--select @factorinteres,@Tiempo,@capitaltotal

SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
--select (@montocuotaseguro + @ValorCuota),(@SueldoN-@CuotaPrestamoFuera)
IF (@montocuotaseguro + @ValorCuota)/(@SueldoN-@CuotaPrestamoFuera)>0.25
BEGIN 
              SET @Mensaje= 'No tiene capacidad de pago';
			  INSERT INTO @Result
			
			  SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje,
			 @MontoPrestar AS MontoPrestar,
			 'MP' AS NivelMensaje
              SELECT * FROM @Result
END 










ELSE  
 
IF @MontoSolicitado > @MontoPrestar
	     BEGIN 
		      SET @Mensaje= 'Maximo de monto a prestar es : '+CAST(@MontoPrestar AS VARCHAR(50));
			  SET @EspecialParametro='MM'
			  	   SET @MAXIMO_PRESTAR=@MontoPrestar
		    
			  SET  @capitaltotal = @MAXIMO_PRESTAR * (1+(@GastoAdmin/100))
              SET  @montocuotaseguro = (@MAXIMO_PRESTAR * ((@Seguro/100)))/12
              SET  @TasaTotal=(@TasaBase)-@Descuento  
			 
			
              SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100           
	          
              SET @Interescuota= @factorinteres*@capitaltotal 
	          
              SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
              
	          SET @SalarioMensualDed=@SueldoN-@CuotaPrestamoFuera        
              
	          INSERT INTO @Result
	         SELECT @capitaltotal[BalanceInicial],
	               CONVERT (numeric  (18,2), @Interescuota)[Interes],
			     @ValorCuota[ValorCuotas],
			     @ValorCuota-@Interescuota [Principal],
			     @montocuotaseguro[MontoCuotaSeguro], 
			     @montocuotaseguro + @ValorCuota [ValorCuotaMensual],
			     @Mensaje[Mensaje],
			     @MontoPrestar[MontoPrestar],
			     @EspecialParametro[NivelMensaje]
	          
	         SELECT *  FROM @Result   
		 END
  ELSE 
    
	   BEGIN 
	     SET @Mensaje= 'OK';
		 SET @EspecialParametro='TB' 
              SET  @capitaltotal = @MontoSolicitado * (1+(@GastoAdmin/100))
              SET  @montocuotaseguro = (@MontoSolicitado * ((@Seguro/100)))/12
              SET  @TasaTotal=(@TasaBase)-@Descuento  
			 
			
       SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100           

       SET @Interescuota= @factorinteres*@capitaltotal 

       SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
       
	   SET @SalarioMensualDed=@SueldoN-@CuotaPrestamoFuera        
       
	   INSERT INTO @Result
	   SELECT @capitaltotal[BalanceInicial],
	         CONVERT (numeric  (18,2), @Interescuota)[Interes],
			  @ValorCuota[ValorCuotas],
			  @ValorCuota-@Interescuota [Principal],
			  @montocuotaseguro[MontoCuotaSeguro], 
			  @montocuotaseguro + @ValorCuota [ValorCuotaMensual],
			  @Mensaje[Mensaje],
			  @MontoPrestar[MontoPrestar],
			  @EspecialParametro[NivelMensaje]
      
	  select *  from @Result 
 END  

	   

  
       
 


 


GO
/****** Object:  StoredProcedure [dbo].[SP_SET_ADD_INFORMATION_CALQULATER_20191018]    Script Date: 10/23/2019 5:32:22 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SET_ADD_INFORMATION_CALQULATER_JALMONTE]    Script Date: 10/23/2019 5:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_SET_ADD_INFORMATION_CALQULATER_JALMONTE] 
--  declare 
  @RangoTiempo             varchar(50)='4 o mas Años',
  @SueldoN                 decimal(9,2)=100000,   
  @CuotaPrestamoFuera      decimal(9,2)=50000,   
  @TiempoPrestamo          int=3,                
  @MontoSolicitado         decimal(9,2)=300000    
 
 
AS 

       DECLARE  @ConfigurationLenLoan   int=0                
       DECLARE  @TimeMax                int=0                
       DECLARE  @TimeMin                int=0                
       DECLARE  @GatoAdmin              decimal(9,2)=0.00    
       DECLARE  @Seguro                 decimal(9,2)=0.00    
       DECLARE  @Descuento              decimal(9,2)=0.00    
       DECLARE  @TasaBase               numeric (18,8)=0.00
       DECLARE  @TasaTotal              numeric(18,8)=0.00
       DECLARE  @MontoMinimo            numeric(18,2)=0.00
       DECLARE  @MontoMaximo            numeric(18,8)=0.00
       DECLARE  @MontoPrestar           numeric(18,2)=0.00
       DECLARE  @SalarioMensualDed      numeric(18,8)=0.00
       DECLARE  @Interescuota           numeric(18,8)=0.00
       DECLARE  @ValorCuota             numeric(18,8)=0.00  
       DECLARE  @capitaltotal           numeric(18,8)=0
       DECLARE  @factorinteres          numeric(18,8)=0.00 
       DECLARE  @montocuotaseguro       numeric(18,8)=0.00 
       DECLARE  @Recargos               numeric(18,8)=0.00 
	   DECLARE  @Mensaje                varchar(100)
	   DECLARE  @GastoAdmin             numeric(18,8)=0.00   
	   DECLARE  @Tiempo                 int
	   DECLARE  @EspecialParametro      char(12)
	   DECLARE  @MAXIMO_PRESTAR         numeric(18,8)=0.00   
	    
	    ---SET Parametros internos
        DECLARE @Result TABLE (
		 BalanceInicial     numeric(18,2),
		 Interes            numeric(18,2),
		 ValorCuotas        numeric(18,2),
		 Principal          numeric(18,2),
		 MontoCuotaSeguros  numeric(18,2),
		 ValorCuotaMensual  numeric(18,2),
		 Mensaje            varchar(100),
		 MontoPrestar       numeric(18,2),
		 NivelMensaje       CHAR(3)
 )


		  
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
	        ConfigurationName=@RangoTiempo;
			
			SELECT  
                   @Tiempo=ConfigurationMonths       
             FROM  [dbo].[ConfigurationMonthsTime] where MonthsTimeId=@TiempoPrestamo
 
SET @MontoPrestar= @SueldoN * @ConfigurationLenLoan 


IF @TimeMin<1        
BEGIN 
              SET @Mensaje= 'Es requerido al menos 1 año de estar empleado' 
	   INSERT INTO @Result
	    SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje ,
			 @MontoPrestar AS MontoPrestar,
			 'R1' AS NivelMensaje

			 SELECT * FROM @Result
END 

IF @MontoSolicitado < @MontoMinimo
BEGIN 
              SET @Mensaje= 'Minimo de monto a prestar es RD$: '+CAST(@MontoMinimo AS VARCHAR(50))+' Peso Dominicano';
			  INSERT INTO @Result
			
			  SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje,
			 @MontoPrestar AS MontoPrestar,
			 'MP' AS NivelMensaje
              SELECT * FROM @Result
END 

SET  @TasaTotal=(@TasaBase)-@Descuento  
SET @MAXIMO_PRESTAR=@MontoPrestar
SET  @capitaltotal = @MAXIMO_PRESTAR * (1+(@GastoAdmin/100))
SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100   
--select @factorinteres,@Tiempo,@capitaltotal

SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
--select (@montocuotaseguro + @ValorCuota),(@SueldoN-@CuotaPrestamoFuera)
IF (@montocuotaseguro + @ValorCuota)/(@SueldoN-@CuotaPrestamoFuera)>0.25
BEGIN 
              SET @Mensaje= 'No tiene capacidad de pago';
			  INSERT INTO @Result
			
			  SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			  @Mensaje AS Mensaje,
			  @MontoPrestar AS MontoPrestar,
			 'MP' AS NivelMensaje
              SELECT * FROM @Result
END 










ELSE  
 
IF @MontoSolicitado > @MontoPrestar
	     BEGIN 
		      SET @Mensaje= 'Maximo de monto a prestar es : '+CAST(@MontoPrestar AS VARCHAR(50));
			  SET @EspecialParametro='MM'
			  	   SET @MAXIMO_PRESTAR=@MontoPrestar
		    
			  SET  @capitaltotal = @MAXIMO_PRESTAR * (1+(@GastoAdmin/100))
              SET  @montocuotaseguro = (@MAXIMO_PRESTAR * ((@Seguro/100)))/12
              SET  @TasaTotal=(@TasaBase)-@Descuento  
			 
			
              SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100           
	          
              SET @Interescuota= @factorinteres*@capitaltotal 
	          
              SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
              
	          SET @SalarioMensualDed=@SueldoN-@CuotaPrestamoFuera        
              
	          INSERT INTO @Result
	         SELECT @capitaltotal[BalanceInicial],
	               CONVERT (numeric  (18,2), @Interescuota)[Interes],
			     @ValorCuota[ValorCuotas],
			     @ValorCuota-@Interescuota [Principal],
			     @montocuotaseguro[MontoCuotaSeguro], 
			     @montocuotaseguro + @ValorCuota [ValorCuotaMensual],
			     @Mensaje[Mensaje],
			     @MontoPrestar[MontoPrestar],
			     @EspecialParametro[NivelMensaje]
	          
	         SELECT *  FROM @Result   
		 END
  ELSE 
    
	   BEGIN 
	     SET @Mensaje= 'OK';
		 SET @EspecialParametro='TB' 
              SET  @capitaltotal = @MontoSolicitado * (1+(@GastoAdmin/100))
              SET  @montocuotaseguro = (@MontoSolicitado * ((@Seguro/100)))/12
              SET  @TasaTotal=(@TasaBase)-@Descuento  
			 
			
       SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100           

       SET @Interescuota= @factorinteres*@capitaltotal 

       SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
       
	   SET @SalarioMensualDed=@SueldoN-@CuotaPrestamoFuera        
       
	   INSERT INTO @Result
	   SELECT @capitaltotal[BalanceInicial],
	         CONVERT (numeric  (18,2), @Interescuota)[Interes],
			  @ValorCuota[ValorCuotas],
			  @ValorCuota-@Interescuota [Principal],
			  @montocuotaseguro[MontoCuotaSeguro], 
			  @montocuotaseguro + @ValorCuota [ValorCuotaMensual],
			  @Mensaje[Mensaje],
			  @MontoPrestar[MontoPrestar],
			  @EspecialParametro[NivelMensaje]
      
	  select *  from @Result 
 END  

	   

  
       
 


 


GO
/****** Object:  StoredProcedure [dbo].[SP_SET_ADD_INFORMATION_CALQULATER20191023]    Script Date: 10/23/2019 5:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_SET_ADD_INFORMATION_CALQULATER20191023] 
--  declare 
  @RangoTiempo             varchar(50)='4 o mas Años',
  @SueldoN                 decimal(9,2)=100000,   
  @CuotaPrestamoFuera      decimal(9,2)=50000,   
  @TiempoPrestamo          int=3,                
  @MontoSolicitado         decimal(9,2)=300000    
 
 
AS 

       DECLARE  @ConfigurationLenLoan   int=0                
       DECLARE  @TimeMax                int=0                
       DECLARE  @TimeMin                int=0                
       DECLARE  @GatoAdmin              decimal(9,2)=0.00    
       DECLARE  @Seguro                 decimal(9,2)=0.00    
       DECLARE  @Descuento              decimal(9,2)=0.00    
       DECLARE  @TasaBase               numeric (18,8)=0.00
       DECLARE  @TasaTotal              numeric(18,8)=0.00
       DECLARE  @MontoMinimo            numeric(18,2)=0.00
       DECLARE  @MontoMaximo            numeric(18,8)=0.00
       DECLARE  @MontoPrestar           numeric(18,2)=0.00
       DECLARE  @SalarioMensualDed      numeric(18,8)=0.00
       DECLARE  @Interescuota           numeric(18,8)=0.00
       DECLARE  @ValorCuota             numeric(18,8)=0.00  
       DECLARE  @capitaltotal           numeric(18,8)=0
       DECLARE  @factorinteres          numeric(18,8)=0.00 
       DECLARE  @montocuotaseguro       numeric(18,8)=0.00 
       DECLARE  @Recargos               numeric(18,8)=0.00 
	   DECLARE  @Mensaje                varchar(100)
	   DECLARE  @GastoAdmin             numeric(18,8)=0.00   
	   DECLARE  @Tiempo                 int
	   DECLARE  @EspecialParametro      char(12)
	   DECLARE  @MAXIMO_PRESTAR         numeric(18,8)=0.00   
	    
	    ---SET Parametros internos
        DECLARE @Result TABLE (
		 BalanceInicial     numeric(18,2),
		 Interes            numeric(18,2),
		 ValorCuotas        numeric(18,2),
		 Principal          numeric(18,2),
		 MontoCuotaSeguros  numeric(18,2),
		 ValorCuotaMensual  numeric(18,2),
		 Mensaje            varchar(100),
		 MontoPrestar       numeric(18,2),
		 NivelMensaje       CHAR(3)
 )


		  
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
	        ConfigurationName=@RangoTiempo;
			
			SELECT  
                   @Tiempo=ConfigurationMonths       
             FROM  [dbo].[ConfigurationMonthsTime] where MonthsTimeId=@TiempoPrestamo
 
SET @MontoPrestar= @SueldoN * @ConfigurationLenLoan 


IF @TimeMin<1        
BEGIN 
              SET @Mensaje= 'Es requerido al menos 1 año de estar empleado' 
	   INSERT INTO @Result
	    SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje ,
			 @MontoPrestar AS MontoPrestar,
			 'R1' AS NivelMensaje

			 SELECT * FROM @Result
END 

IF @MontoSolicitado < @MontoMinimo
BEGIN 
              SET @Mensaje= 'Minimo de monto a prestar es RD$: '+CAST(@MontoMinimo AS VARCHAR(50))+' Peso Dominicano';
			  INSERT INTO @Result
			
			  SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje,
			 @MontoPrestar AS MontoPrestar,
			 'MP' AS NivelMensaje
              SELECT * FROM @Result
END 

SET  @TasaTotal=(@TasaBase)-@Descuento  
SET @MAXIMO_PRESTAR=@MontoPrestar
SET  @capitaltotal = @MAXIMO_PRESTAR * (1+(@GastoAdmin/100))
SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100   
--select @factorinteres,@Tiempo,@capitaltotal

SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
--select (@montocuotaseguro + @ValorCuota),(@SueldoN-@CuotaPrestamoFuera)
IF (@montocuotaseguro + @ValorCuota)/(@SueldoN-@CuotaPrestamoFuera)>0.25
BEGIN 
              SET @Mensaje= 'No tiene capacidad de pago';
			  INSERT INTO @Result
			
			  SELECT 
			  0 AS BalanceInicial,
			  0 AS Interes,
			  0 AS ValorCuota,
			  0 AS Principal,
			  0 AS MontoCuotaSeguros,
			  0 AS ValorCuotaMensual,
			 @Mensaje AS Mensaje,
			 @MontoPrestar AS MontoPrestar,
			 'MP' AS NivelMensaje
              SELECT * FROM @Result
END 










ELSE  
 
IF @MontoSolicitado > @MontoPrestar
	     BEGIN 
		      SET @Mensaje= 'Maximo de monto a prestar es : '+CAST(@MontoPrestar AS VARCHAR(50));
			  SET @EspecialParametro='MM'
			  	   SET @MAXIMO_PRESTAR=@MontoPrestar
		    
			  SET  @capitaltotal = @MAXIMO_PRESTAR * (1+(@GastoAdmin/100))
              SET  @montocuotaseguro = (@MAXIMO_PRESTAR * ((@Seguro/100)))/12
              SET  @TasaTotal=(@TasaBase)-@Descuento  
			 
			
              SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100           
	          
              SET @Interescuota= @factorinteres*@capitaltotal 
	          
              SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
              
	          SET @SalarioMensualDed=@SueldoN-@CuotaPrestamoFuera        
              
	          INSERT INTO @Result
	         SELECT @capitaltotal[BalanceInicial],
	               CONVERT (numeric  (18,2), @Interescuota)[Interes],
			     @ValorCuota[ValorCuotas],
			     @ValorCuota-@Interescuota [Principal],
			     @montocuotaseguro[MontoCuotaSeguro], 
			     @montocuotaseguro + @ValorCuota [ValorCuotaMensual],
			     @Mensaje[Mensaje],
			     @MontoPrestar[MontoPrestar],
			     @EspecialParametro[NivelMensaje]
	          
	         SELECT *  FROM @Result   
		 END
  ELSE 
    
	   BEGIN 
	     SET @Mensaje= 'OK';
		 SET @EspecialParametro='TB' 
              SET  @capitaltotal = @MontoSolicitado * (1+(@GastoAdmin/100))
              SET  @montocuotaseguro = (@MontoSolicitado * ((@Seguro/100)))/12
              SET  @TasaTotal=(@TasaBase)-@Descuento  
			 
			
       SET @factorinteres= CAST(@TasaTotal/ CAST(12 AS NUMERIC(18,7)) AS NUMERIC(18,7)) /100           

       SET @Interescuota= @factorinteres*@capitaltotal 

       SELECT @ValorCuota= [dbo].[PMT](@factorinteres,@Tiempo,@capitaltotal) 
       
	   SET @SalarioMensualDed=@SueldoN-@CuotaPrestamoFuera        
       
	   INSERT INTO @Result
	   SELECT @capitaltotal[BalanceInicial],
	         CONVERT (numeric  (18,2), @Interescuota)[Interes],
			  @ValorCuota[ValorCuotas],
			  @ValorCuota-@Interescuota [Principal],
			  @montocuotaseguro[MontoCuotaSeguro], 
			  @montocuotaseguro + @ValorCuota [ValorCuotaMensual],
			  @Mensaje[Mensaje],
			  @MontoPrestar[MontoPrestar],
			  @EspecialParametro[NivelMensaje]
      
	  select *  from @Result 
 END  

	   

  
       
 


 


GO
/****** Object:  StoredProcedure [dbo].[SP_SET_SAVE_LOG]    Script Date: 10/23/2019 5:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SET_SAVE_LOG]
 
@Procedure_Id VARCHAR(50), 
@Log_Value    varchar(max)
 

AS
BEGIN 

INSERT INTO [dbo].[LoanCalculator_LOG]
           ([Procedure_Id]
           ,[Log_Value]
           ,[Create_Date])
     VALUES
           (
		    @Procedure_Id
           ,@Log_Value
           ,GETDATE()
		   )

		 SELECT 0[Key],'Ok'[Values],0[ValuesNum]
 
END 

 
GO
