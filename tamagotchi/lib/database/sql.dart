String userCreation = ""
"CREATE TABLE user ("
"id INTEGER PRIMARY KEY,"
"username VARCHAR(50) NOT NULL,"
"password VARCHAR(15) NOT NULL"
");";
String petCreation = ""
"CREATE TABLE pet ("
"id INTEGER PRIMARY KEY,"
"user_id INTERGER,"
"icon VARCHAR(50),"
"name VARCHAR(50),"
"last_time VARCHAR(30),"
"health REAL,"
"happy REAL,"
"hunger REAL,"
"dirt BOOLEAN,"
"sleeping BOOLEAN,"
"FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE ON UPDATE CASCADE"
");";
