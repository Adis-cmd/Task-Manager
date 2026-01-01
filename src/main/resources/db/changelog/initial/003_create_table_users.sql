-- changelog Adis: 003 create user table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255),
    password VARCHAR(255),
    enabled BOOLEAN,
    name VARCHAR(255),
    user_name VARCHAR(255),
    avatar VARCHAR(255),
    authorities_id BIGINT,
    CONSTRAINT fk_authority
        FOREIGN KEY (authorities_id)
        REFERENCES authorities(id)
        ON DELETE SET NULL
);
