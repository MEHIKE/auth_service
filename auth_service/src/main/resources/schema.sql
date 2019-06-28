DROP TABLE IF EXISTS security_role;
CREATE TABLE security_role (
                             id BIGINT AUTO_INCREMENT PRIMARY KEY,
                             description varchar(100) DEFAULT NULL,
                             role_name varchar(100) DEFAULT NULL
);


DROP TABLE IF EXISTS security_user;
CREATE TABLE security_user (
                             id BIGINT AUTO_INCREMENT PRIMARY KEY,
                             username varchar(255) NOT NULL,
                             password varchar(255) NOT NULL,
                             first_name varchar(255) NOT NULL,
                             last_name varchar(255) NOT NULL
);


DROP TABLE IF EXISTS user_role;
CREATE TABLE user_role (
                         user_id BIGINT NOT NULL,
                         role_id BIGINT NOT NULL,
                         CONSTRAINT FK_SECURITY_USER_ID FOREIGN KEY (user_id) REFERENCES security_user (id),
                         CONSTRAINT FK_SECURITY_ROLE_ID FOREIGN KEY (role_id) REFERENCES security_role (id)
);