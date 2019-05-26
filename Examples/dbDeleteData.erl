-module(dbDeleteData). 
-export([start/0]). 

start() -> 
   odbc:start(), 
   {ok, Ref} = odbc:connect("DSN=erldsn;UID=informix;PWD=****", []), 
   io:fwrite("~p",[ odbc:sql_query(Ref, "DELETE EMPLOYEE1 WHERE Name= 'Nick'")]).