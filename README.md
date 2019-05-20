# Erlang steps to connect with the Informix Database

### Description: This connectivity will use Informix ODBC driver internally.

## Prerequisites:
1) Erlang
2) Informix ODBC Driver (CSDK)
3) DSN for the Database

### How to Install Erlang
Go to [https://erlang.org/](https://erlang.org/) official website.
Click on [Download Erlang/OTP](https://www.erlang.org/downloads)
Select the OTP version according to the requirement (for ex: OTP 21.3 Windows 64-bit Binary File)
Once the Erlang packages are downloaded
Run the otp_win64_21.3 installer and follow the installation process.


#### For more information follow this video:
https://www.youtube.com/watch?v=uhsIu-zP7Hs

### How to install Informix ODBC Driver

Informix ODBC Driver comes with the Informix CSDK Package, and to install Informix ODBC Driver we will need to install Informix CSDK Package.


### How to Setup the DSN (in Windows)
1) Open ODBC Data Source(64 bit)
2) Uder the **User DSN** tab click on the **Add...** button
3) Select the **IBM INFORMIX ODBC DRIVER(64-bit)** and click on **Finish**.
4) It will prompt **IBM Informix ODBC Driver Setup** Window
5) Under the **General** tab put **Data Source Name** and **Description** (optional)
6) Now, go to the **Connection** tab and fill all the required fields (which is nothing but the connection details for the Database)
7) After filling the details click on the **Apply & Test Connection** button to test the Database connectivity.
8) If connection gets successful click on **Apply** and then **OK**.
9) And That's Done! :relaxed:

## Now, we are ready to use Erlang API:
### Open command prompt and type "erl" (now, we can use the Erlang APIs).
**Getting started with the odbc connection:**
```
1> odbc:start().
      ok  

2> {ok, Ref} = odbc:connect("DSN=erldsn;UID=informix;PWD=", []).
      {ok,<0.83.0>}  
```

**Create a table:**	
```
3> odbc:sql_query(Ref, "CREATE TABLE EMPLOYEE (RollNo integer,Name char  varying(20),GENDER char(1),PRIMARY KEY (RollNo))").
      {updated,0} 
```

**Insert some data:**
```
4> odbc:sql_query(Ref, "INSERT INTO EMPLOYEE VALUES(1, 'Pratishtha, 'F')").
      {updated,1}
```

**Check what data types the database assigned for the columns:**
```
5> odbc:describe_table(Ref, "EMPLOYEE").
      {ok, [{"RollNo", sql_integer},
            {"NAME", {sql_varchar, 20}},
            {"GENDER", {sql_char, 1}}]}
```

**Use a parameterized query to insert many rows in one go:**
```
6> odbc:param_query(Ref,"INSERT INTO EMPLOYEE (RollNo, NAME, GENDER) VALUES(?, ?, ?)"
                   [{sql_integer,[2,3]},
                    {{sql_varchar, 20},
                   ["John", "Sophie"]},
                   {{sql_char, 1}, ["M","F"]}]).
      {updated, 2}	
```
	
**Fetch all data from the table employee:**
```
7> odbc:sql_query(Ref, "SELECT * FROM EMPLOYEE").
          {selected,["rollno","name","gender"],
          [{1,"Pratishtha","F"},{2,"John","M"},{3,"Sophie","F"}]}
```	
	   
**Associate a result set containing the whole table EMPLOYEE to the connection. The number of rows in the result set is returned.**
```
8> odbc:select_count(Ref, "SELECT * FROM EMPLOYEE").
      {ok,undefined}
```
**Informix odbc is not returning the numer of rows count.**	