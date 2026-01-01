-- changelog Adis: 004 create comments table
CREATE TABLE comments (
    id BIGSERIAL PRIMARY KEY,
    author_id BIGINT,
    task_id BIGINT,
    text VARCHAR(1000),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_comment_author
        FOREIGN KEY (author_id)
        REFERENCES users(id)
        ON DELETE SET NULL,
    CONSTRAINT fk_comment_task
        FOREIGN KEY (task_id)
        REFERENCES tasks(id)
        ON DELETE CASCADE
);
