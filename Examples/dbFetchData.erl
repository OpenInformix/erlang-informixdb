-module(dbFetchData). 
-export([start/0]). 

start() ->
   odbc:start(), 
   {ok, Ref} = odbc:connect("DSN=erldsn;UID=informix;PWD=****", []), 
   io:fwrite("~p",[odbc:sql_query(Ref, "SELECT * FROM EMPLOYEE1") ]).