--SECTION B
Create or alter procedure cast_act_to_movie (@act_id int,@mov_id int, @mv varchar(20))
As
Begin
--Declaring a variable which can be used to check weather the actor is already casted or not
Declare @check int
--assigning the checking value to declared variable
Select @check=count( mov_id) 
From moviecast
Where actid=@act_id and mov_id=@mov_id
--checking weather the actor is already casted or acted in the movie
If(@check=0)
Begin
   Insert into moviecast(actid,mov_id,ROLE) values(@act_id,@mov_id,@mv)
End
--Giving a message to user if actors is already casted in the movie
Else
  Begin
   Print 'can not allow actors to be cast more than once for each movie'
  End
End



--Cast George Faraday (# 124) in Slumdog Millionaire (# 921).
EXECUTE cast_act_to_movie 124, 921, 'George Faraday'

--Cast George Faraday in Back to the Future (# 928).
EXECUTE cast_act_to_movie 125, 928, 'George Faraday'

--Cast George Faraday (# 124) in Slumdog Millionaire (# 921)
EXECUTE cast_act_to_movie 124, 921, 'George Faraday'







