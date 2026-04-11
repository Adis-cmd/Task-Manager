CREATE TABLE project_members (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT,
    project_id BIGINT,
    role VARCHAR(50),
    CONSTRAINT fk_project_members_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_project_members_project
        FOREIGN KEY (project_id)
        REFERENCES projects(id)
        ON DELETE CASCADE
);
