USE `full-stack-ecommerce` ;
-- Create User table
CREATE TABLE user (
    user_name VARCHAR(255) PRIMARY KEY,
    user_first_name VARCHAR(255),
    user_last_name VARCHAR(255),
    user_password VARCHAR(255)
);

-- Create Role table
CREATE TABLE role (
    role_name VARCHAR(255) PRIMARY KEY,
    role_description VARCHAR(255)
);

-- Create junction table for ManyToMany relationship
CREATE TABLE user_role (
    user_id VARCHAR(255),
    role_id VARCHAR(255),
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES user(user_name),
    FOREIGN KEY (role_id) REFERENCES role(role_name)
);
