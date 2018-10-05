CREATE DATABASE oauth2;

--USE oauth2;

DROP TABLE IF EXISTS oauth_client_details;
CREATE TABLE oauth_client_details (
  client_id varchar(255) NOT NULL,
  resource_ids varchar(255) DEFAULT NULL,
  client_secret varchar(255) DEFAULT NULL,
  scope varchar(255) DEFAULT NULL,
  authorized_grant_types varchar(255) DEFAULT NULL,
  web_server_redirect_uri varchar(255) DEFAULT NULL,
  authorities varchar(255) DEFAULT NULL,
  access_token_validity int DEFAULT NULL,
  refresh_token_validity int DEFAULT NULL,
  additional_information varchar(4096) DEFAULT NULL,
  autoapprove varchar(255) DEFAULT NULL,
  PRIMARY KEY (client_id)
);


INSERT INTO oauth_client_details VALUES ('adminapp','mw/adminapp,ms/admin,ms/user','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','role_admin,role_superadmin','authorization_code,password,refresh_token,implicit',NULL,NULL,900,3600,'{}',NULL);

--
-- Table structure for table oauth_access_token
--
DROP TABLE IF EXISTS oauth_access_token;
CREATE TABLE oauth_access_token (
  token_id varchar(256) DEFAULT NULL,
  token bytea,
  authentication_id varchar(256) DEFAULT NULL,
  user_name varchar(256) DEFAULT NULL,
  client_id varchar(256) DEFAULT NULL,
  authentication bytea,
  refresh_token varchar(256) DEFAULT NULL
);


--
-- Table structure for table oauth_refresh_token
--

DROP TABLE IF EXISTS oauth_refresh_token;
CREATE TABLE oauth_refresh_token (
  token_id varchar(256) DEFAULT NULL,
  token bytea,
  authentication bytea
);


--
-- Table structure for table permission
--

DROP TABLE IF EXISTS permission;
	CREATE TABLE permission (
	  id serial NOT NULL,
	  name varchar(60) NOT NULL,
	  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  updated_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  version bigint check (version>=0) NOT NULL DEFAULT '0',
	  PRIMARY KEY (id),
	  constraint name_UNIQUE UNIQUE(name)
	);

INSERT INTO permission VALUES (1,'can_delete_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(2,'can_create_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(3,'can_update_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(4,'can_read_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0);

--
-- Table structure for table role
--

DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id serial NOT NULL,
  name varchar(60) NOT NULL,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  version bigint check(version>=0) NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  constraint role_UNIQUE UNIQUE(name)
);

INSERT INTO role VALUES (1,'role_admin','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(2,'role_user','1970-01-01 00:00:00','1970-01-01 00:00:00',0);


--
-- Table structure for table permission_role
--

DROP TABLE IF EXISTS permission_role;
CREATE TABLE permission_role (
  permission_id bigint NOT NULL,
  role_id bigint NOT NULL,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  version bigint check(version>=0) NOT NULL DEFAULT '0',
  PRIMARY KEY (permission_id,role_id)
  --KEY permission_role_fk2 (role_id)
  --CONSTRAINT permission_role_fk1 FOREIGN KEY (permission_id) REFERENCES permission (id) ON DELETE CASCADE ON UPDATE CASCADE,
  --CONSTRAINT permission_role_fk2 FOREIGN KEY (role_id) REFERENCES role (id) ON DELETE CASCADE ON UPDATE CASCADE
);
alter table permission_role 
add constraint permission_role_fk1 foreign key (permission_id) references permission (id) on delete cascade on update cascade; 
alter table permission_role
add constraint permission_role_fk2 foreign key (role_id) references role (id) on delete cascade on update cascade;
create index katse on permission_role (role_id);

INSERT INTO permission_role VALUES (1,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(2,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(3,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(4,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(4,2,'1970-01-01 00:00:00','1970-01-01 00:00:00',0);



--
-- Table structure for table user
--

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id serial NOT NULL,
  username varchar(24) NOT NULL,
  password varchar(200) NOT NULL,
  email varchar(255) NOT NULL,
  enabled bit(1) NOT NULL,
  account_expired bit(1) NOT NULL,
  credentials_expired bit(1) NOT NULL,
  account_locked bit(1) NOT NULL,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  version bigint check(version>=0) NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  constraint username_UNIQUE UNIQUE(username),
  constraint email_UNIQUE UNIQUE(email)
);


INSERT INTO users VALUES (1,'admin','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','admin@example.com',b'1','0','0','0','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(2,'user','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','user@example.com',b'1','0','0','0','1970-01-01 00:00:00','1970-01-01 00:00:00',0);


--
-- Table structure for table role_user
--

DROP TABLE IF EXISTS role_user;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE role_user (
  role_id bigint NOT NULL,
  user_id bigint NOT NULL,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  version bigint check(version>=0) NOT NULL DEFAULT '0',
  PRIMARY KEY (role_id,user_id)
  --KEY role_user_fk2 (user_id),
  --CONSTRAINT role_user_fk1 FOREIGN KEY (role_id) REFERENCES role (id) ON DELETE CASCADE ON UPDATE CASCADE,
  --CONSTRAINT role_user_fk2 FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE ON UPDATE CASCADE
);
alter table role_user 
add constraint role_user_fk1 foreign key (role_id) references role (id) on delete cascade on update cascade; 
alter table role_user 
add constraint role_user_fk2 foreign key (user_id) references users (id) on delete cascade on update cascade;
create index katse2 on role_user (role_id);


INSERT INTO role_user VALUES (1,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0),(2,2,'1970-01-01 00:00:00','1970-01-01 00:00:00',0); 