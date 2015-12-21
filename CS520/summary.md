# Database System Principle

## Update Password

```
use mysql
update user set password = password("pwd12345") where user = "root";
```

## Create User

```
mysql> create user 'svu'@'localhost' identified by 'svuwins'; 
Query OK, 0 rows affected (0.00 sec)

mysql> Grant all on proj1.* to 'svu'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)
```

## Listing Users

`select user, password, host from user;`

