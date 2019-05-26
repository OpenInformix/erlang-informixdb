-module(dbInsertData).
-export([start/0]).

start() ->
   odbc:start(),
   {ok, Ref} = odbc:connect("DSN=erldsn;UID=informix;PWD=*****", []),
   io:fwrite("~p", [odbc:sql_query(Ref, "INSERT INTO EMPLOYEE1 VALUES(1, 'Pratishtha', 'F')")]).