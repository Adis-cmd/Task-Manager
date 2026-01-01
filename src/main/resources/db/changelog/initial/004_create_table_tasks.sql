-- changelog Adis: 005 create task table
CREATE TABLE tasks (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    author_id BIGINT,
    description VARCHAR(2000),
    status VARCHAR(50),
    due_date TIMESTAMP,
    priority VARCHAR(50),
    CONSTRAINT fk_task_author
        FOREIGN KEY (author_id)
        REFERENCES users(id)
        ON DELETE SET NULL
);

CREATE TABLE task_participants (
    task_id BIGINT,
    user_id BIGINT,
    PRIMARY KEY (task_id, user_id),
    CONSTRAINT fk_task_participants_task
        FOREIGN KEY (task_id)
        REFERENCES tasks(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_task_participants_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);
