CREATE DATABASE project_management_DB
GO

use project_management_DB

GO

CREATE TABLE users (
    id int IDENTITY(1,1) PRIMARY KEY,
    full_names varchar(250) NOT NULL,
    email varchar(250) UNIQUE NOT NULL,
    gender varchar,
    department VARCHAR(250) NOT NULL,
    created_at TIMESTAMP,
    is_deleted BIT,
    is_team_lead BIT
)

GO

CREATE TABLE projects (
    id varchar(20) PRIMARY KEY,
    title varchar(100) NOT NULL,
    "description" VARCHAR(max) NOT NULL,
    team_lead_id int REFERENCES users(id),
    predicted_completion_date DATETIME,
    actual_completion_date DATETIME,
    is_completed bit,
    discontinued bit
)


GO

CREATE TABLE tasks (
    id varchar(20) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    "description" varchar(max) NOT NULL,
    "status" varchar(20) NOT NULL,
    complexity_level INT NOT NULL,
    "priority" VARCHAR(20),
    created_at TIMESTAMP,
    project_id varchar(20) REFERENCES projects(id),
    assigned_to INT REFERENCES users(id),
    assigned_at DATETIME
)

GO 

CREATE TABLE comments (
    id VARCHAR(20)  PRIMARY KEY,
    text varchar(250) NOT NULL,
    task VARCHAR(20) REFERENCES tasks(id),
    commentor INT REFERENCES users(id),
    submitted_at TIMESTAMP,
    is_deleted bit 
)

GO

CREATE TABLE teams(
    user_id INT REFERENCES users(id),
    project_id VARCHAR(20) REFERENCES projects(id),
    added_at TIMESTAMP
)