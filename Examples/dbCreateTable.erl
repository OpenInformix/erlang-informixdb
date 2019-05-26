-module(dbCreateTable).
-export([start/0]).

start() ->
   odbc:start(), 
   {ok, Ref} = odbc:connect("DSN=erldsn;UID=informix;PWD=***", []),
odbc:sql_query(Ref, "CREATE TABLE EMPLOYEE1 (RollNo integer,Name char  varying(20), 
   GENDER char(1))"),
   io:fwrite("Table Created").