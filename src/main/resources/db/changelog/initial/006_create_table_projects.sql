-- changelog Adis: 007 create board table
CREATE TABLE projects (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    leader_id BIGINT,
    CONSTRAINT fk_projects_leader
        FOREIGN KEY (leader_id)
        REFERENCES users(id)
        ON DELETE SET NULL
)