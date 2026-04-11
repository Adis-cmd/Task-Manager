-- changelog Adis: 007 create columns table
CREATE TABLE board_columns (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
     project_id BIGINT,
        CONSTRAINT fk_boards_project
            FOREIGN KEY (project_id)
            REFERENCES projects(id)
            ON DELETE CASCADE
);
ALTER TABLE tasks
ADD COLUMN column_id BIGINT;

ALTER TABLE tasks
ADD CONSTRAINT fk_tasks_column
FOREIGN KEY (column_id)
REFERENCES board_columns(id)
ON DELETE SET NULL;

