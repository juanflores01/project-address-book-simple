USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[Person_Insert]    Script Date: 4/4/2018 10:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC	[dbo].[Person_Insert]
			@FirstName nvarchar(50)
           ,@LastName nvarchar(50)
           ,@Email nvarchar(50)
           ,@Phone nvarchar(50)
           ,@Address1 nvarchar(100)
           ,@Address2 nvarchar(100) = null
           ,@City nvarchar(50)
           ,@State nvarchar(50)
           ,@PostalCode nvarchar(50)
           ,@Country nvarchar(50)
		   ,@Id INT OUTPUT
AS

/*			TEST 

DECLARE
			@FirstName nvarchar(50) = 'Jenny'
           ,@LastName nvarchar(50) = 'Doe'
           ,@Email nvarchar(50) = 'jane@doe.com'
           ,@Phone nvarchar(50) = '818-555-1234'
           ,@Address1 nvarchar(100) = '101 Main Street'
           ,@Address2 nvarchar(100) = null
           ,@City nvarchar(50) = 'Lincoln'
           ,@State nvarchar(50) = 'CA'
           ,@PostalCode nvarchar(50) = '90210'
           ,@Country nvarchar(50) = 'USA'
		   ,@Id INT = 0;

EXEC		dbo.Person_Insert
			@FirstName
           ,@LastName 
           ,@Email
           ,@Phone
           ,@Address1
           ,@Address2
           ,@City 
           ,@State
           ,@PostalCode 
           ,@Country
		   ,@Id OUTPUT

SELECT	@Id

SELECT	*
FROM	dbo.Person
WHERE	Id = @Id

*/

BEGIN

INSERT INTO dbo.Person
           (FirstName
           ,LastName
           ,Email
           ,Phone
           ,Address1
           ,Address2
           ,City
           ,State
           ,PostalCode
           ,Country)
     VALUES
           (@FirstName
           ,@LastName 
           ,@Email
           ,@Phone
           ,@Address1
           ,@Address2
           ,@City 
           ,@State
           ,@PostalCode 
           ,@Country)

	SET @Id = SCOPE_IDENTITY()

END
