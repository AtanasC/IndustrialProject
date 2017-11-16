Create Proc CheckUser
@username varchar(50),
@password varchar(50)
as
Begin
	Select * from [dbo].UserLogin where username = @username and password = @password
End