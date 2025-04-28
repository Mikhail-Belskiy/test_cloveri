CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Создаем таблицу навыков
CREATE TABLE skills (
    id_skills SERIAL PRIMARY KEY NOT NULL,
    skill_name text
);

-- Создаем таблицу компетенций
CREATE TABLE competencies (
    id_competencies SERIAL PRIMARY KEY NOT NULL,
    ai NUMERIC(3,1) CHECK (ai >= 0 AND ai <= 10) DEFAULT 0,
    programming NUMERIC(3,1) CHECK (programming >= 0 AND programming <= 10) DEFAULT 0,
    architecture NUMERIC(3,1) CHECK (architecture >= 0 AND architecture <= 10) DEFAULT 0,
    project_management NUMERIC(3,1) CHECK (project_management >= 0 AND project_management <= 10) DEFAULT 0,
    communications NUMERIC(3,1) CHECK (communications >= 0 AND communications <= 10) DEFAULT 0,
    management NUMERIC(3,1) CHECK (management >= 0 AND management <= 10) DEFAULT 0,
    working_data NUMERIC(3,1) CHECK (working_data >= 0 AND working_data <= 10) DEFAULT 0,
    infrastructure NUMERIC(3,1) CHECK (infrastructure >= 0 AND infrastructure <= 10) DEFAULT 0,
    data_management NUMERIC(3,1) CHECK (data_management >= 0 AND data_management <= 10) DEFAULT 0,
    maths NUMERIC(3,1) CHECK (maths >= 0 AND maths <= 10) DEFAULT 0,
    data_analysis NUMERIC(3,1) CHECK (data_analysis >= 0 AND data_analysis <= 10) DEFAULT 0
);

-- Создаем таблицу стажировок
CREATE TABLE intership (
    id_intership SERIAL PRIMARY KEY NOT NULL,
    intership_name VARCHAR(100),
    name_project VARCHAR(250),
    id_skills INTEGER REFERENCES skills(id_skills),
    start DATE,
    finish DATE
);

-- Создаем таблицу пользователей
CREATE TABLE users (
    id_user SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    id_intership INTEGER REFERENCES intership(id_intership),
    id_competencies INTEGER REFERENCES competencies(id_competencies)
);

-- Создаем таблицу сертификатов
CREATE TABLE certificate (
    id SERIAL PRIMARY KEY NOT NULL,
    number UUID DEFAULT gen_random_uuid(),
    id_user INTEGER REFERENCES users(id_user)
);
    
-- Добавление индекса для email пользователей
CREATE INDEX idx_users_email ON users(email);