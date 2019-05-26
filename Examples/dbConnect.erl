% Before running this program do following steps
% 1: Make a DSN (erldsn) in ODBC Data Source (64-bit)
% 2: Use the same provided credentials here in connection string.

-module(dbConnect). 
-export([start/0]). 

start() ->
   odbc:start(), 
   {ok, Ref} = odbc:connect("DSN=erldsn;UID=informix;PWD=*****", []), 
   io:fwrite("Connected Successfully : ~p",[Ref]).