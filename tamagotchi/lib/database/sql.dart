String dbCreation = ""
"CREATE TABLE user ("
"id INTEGER  AUTO_INCREMENT,"
"username VARCHAR(50) NOT NULL,"
"password VARCHAR(15) NOT NULL,"
"PRIMARY KEY (id)"
");"
"CREATE TABLE pet ("
"id INTEGER AUTO_INCREMENT,"
"user_id INTERGER,"
"icon VARCHAR(50),"
"name VARCHAR(50),"
"last_time VARCHAR(30),"
"health REAL,"
"happy REAL,"
"hunger REAL,"
"dirt BOOLEAN,"
"sleeping BOOLEAN,"
"health_rate REAL,"
"happy_rate REAL,"
"hunger_rate REAL,"
"PRIMARY KEY (id),"
"FOREIGN KEY (userId) REFERENCES user (id) ON DELETE CASCADE ON UPDATE CASCADE"
");";
