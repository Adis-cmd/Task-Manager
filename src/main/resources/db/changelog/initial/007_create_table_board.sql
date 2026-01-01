-- changelog Adis: 007 create board table
CREATE TABLE boards (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    project_id BIGINT,
    CONSTRAINT fk_boards_project
        FOREIGN KEY (project_id)
        REFERENCES projects(id)
        ON DELETE CASCADE
);