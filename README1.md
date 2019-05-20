## How to Compile Erlang Program:
### After Erlang installation, make sure Erlang compiler is installed on your system.
# Establishing Database Connection:
**To establish a connection to the database, the following code can be used.**
```
-module(sample1). 
-export([start/0]). 

start() ->
   odbc:start(), 
   {ok, Ref} = odbc:connect("DSN = erldsn;UID = informix;PWD = ***", []), 
   io:fwrite("~p",[Ref]).
```
# Compile the module:
```
D:\erl>erlc sample1.erl
```
**It should create sample.beam file.**

# Now, Run below command to execute complied program:
```
D:\erl>erl -noshell -s sample1 start -s init stop
```
**It should return <0.83.0>**




