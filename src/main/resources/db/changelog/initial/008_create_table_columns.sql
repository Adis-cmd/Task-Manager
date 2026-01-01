-- changelog Adis: 006 create columns table
CREATE TABLE board_columns (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    board_id BIGINT,
    CONSTRAINT fk_board_columns_board
        FOREIGN KEY (board_id)
        REFERENCES boards(id)
        ON DELETE CASCADE
);
ALTER TABLE tasks
ADD COLUMN column_id BIGINT;

ALTER TABLE tasks
ADD CONSTRAINT fk_tasks_column
FOREIGN KEY (column_id)
REFERENCES board_columns(id)
ON DELETE SET NULL;

