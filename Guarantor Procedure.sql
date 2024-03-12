USE [AphaComptaDB2019_08_01_2024_TEST]
GO

/****** Object:  StoredProcedure [dbo].[GuarantorLoans]    Script Date: 3/11/2024 11:48:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Alter PROCEDURE [dbo].[GuarantorLoans]
	
AS
BEGIN
	
	SET NOCOUNT ON;
with ConsumerLoansGuarantor(accountNumber,country,dateOfBirth,guarantorType,foreName1,foreName2,foreName3,homeTelephone,
mobileTelephone,nationalId,nationality,passportNumber,placeOfBirth,postalAddressNumber,postalCode,surName,town,workTelephone,recordType) as (


select
'90'+'-'+convert(nvarchar, TLn04IntGntor.ClientId)+'-'+convert(nvarchar, TLn04IntGntor.LoanId) AS accountNumber,'RWANDA' AS country,
CASE
    WHEN DATEDIFF(Year,dbo.TCl01Client.DateBirth,GETDATE()) BETWEEN 18 AND 100 THEN  CONVERT(char(8), dbo.TCl01Client.DateBirth ,112) 
	ELSE '19900101'
END AS dateOfBirth,'I' AS guarantorType,


 
      ltrim( rtrim( substring( concat(case when LastName<>'' then LastName else ' ' end,' ', case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), 1, charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) - 1 ) ) ) surName
    , 
	
	ltrim( rtrim( 
	
	substring( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) , 1, 
	charindex( ' ', substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) )  ) - 1 ) ) ) foreName1
	

	,

	ltrim( rtrim( substring( substring( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ), 
	charindex( ' ', substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) + 1, 
	len( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) ), 1, 
	
	charindex( ' ', substring( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ), 
	charindex( ' ', substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) + 1, 
	len( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) ) ) - 1 ) ) ) foreName2

	,

	substring( substring( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ), 
	charindex( ' ', substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) + 1, 
	len( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) ), 
	
	charindex( ' ', substring( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ), 
	charindex( ' ', substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) + 1, 
	len( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) ) ) + 1, 
	
	len( substring( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ), 
	charindex( ' ', substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) + 1, 
	len( substring( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' '), charindex( ' ', concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) + 1, len( concat(case when LastName<>'' then LastName else ' ' end,' ',case when FirstName<>'' then FirstName else '_' end,' ',' ',' ',' ',' ',' ',' ',' ',' ') ) ) ) ) ) ) foreName3,


CASE 
	WHEN LEN(dbo.TCl01Client.MobPhone1)=12 THEN dbo.TCl01Client.MobPhone1 
	WHEN LEN(dbo.TCl01Client.MobPhone1)=10 THEN '25'+dbo.TCl01Client.MobPhone1
	WHEN LEN(dbo.TCl01Client.MobPhone1)=9 THEN '250'+dbo.TCl01Client.MobPhone1
	ELSE '250788888888' 
END AS mobileTelephone,'' as homeTelephone,
CASE
    WHEN LEN(dbo.TCl01Client.NatIDNber)=16 THEN dbo.TCl01Client.NatIDNber
	ELSE '1199011111111111'
END AS nationalId,dbo.TCl550Country.Descript as nationality,' ' AS passportNumber,' ' AS placeOfBirth,'' AS postalAddressNumber,' ' AS postalCode,'' as Town,
 '' AS workTelephone,'GI' AS recordType

from dbo.TLn04IntGntor
	inner join dbo.TCl01Client on dbo.TLn04IntGntor.ClientId=dbo.TCl01Client.ID
	INNER JOIN dbo.TCl550Country on dbo.TCl01Client.NationalityID=dbo.TCl550Country.ID
	inner Join dbo.TLn03Loan on dbo.TLn04IntGntor.CreditID = TLn03Loan.LoanID
	


)
insert into dbo.CRBGuarantorTable (accountNumber,country,dateOfBirth,guarantorType,foreName1,foreName2,foreName3,homeTelephone,
mobileTelephone,nationalId,nationality,passportNumber,placeOfBirth,postalAddressNumber,postalCode,surName,town,workTelephone,recordType)
SELECT accountNumber,country,dateOfBirth,guarantorType,foreName1,foreName2,foreName3,homeTelephone,
mobileTelephone,nationalId,nationality,passportNumber,placeOfBirth,postalAddressNumber,postalCode,surName,town,workTelephone,recordType from ConsumerLoansGuarantor;
    
END

GO


