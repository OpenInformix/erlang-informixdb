-module(dbUpdateData). 
-export([start/0]). 

start() -> 
   odbc:start(), 
   {ok, Ref} = odbc:connect("DSN=erldsn;UID=informix;PWD=****", []), 
   io:fwrite("~p",[ odbc:sql_query(Ref, "UPDATE EMPLOYEE1 SET Name='Nick' WHERE Gender='M'")]).