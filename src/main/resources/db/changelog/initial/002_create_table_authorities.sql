-- changelog Adis: 002 create authority table
CREATE TABLE authorities (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(55) NOT NULL UNIQUE
);