INSERT INTO users (name, surname, email) VALUES 
('Иван', 'Иванов', 'ivan.ivanov@example.com'),
('Петр', 'Петров', 'petr.petrov@example.com');

INSERT INTO competencies (ai, programming, architecture, project_management, communications, 
                          management, working_data, infrastructure, data_management, maths, data_analysis) 
VALUES 
(8.0, 9.0, 7.5, 6.0, 5.0, 4.5, 6.0, 3.5, 7.0, 8.5, 9.0), 
(7.0, 6.5, 8.0, 9.0, 6.5, 7.0, 5.0, 6.0, 7.5, 8.0, 8.5); 


INSERT INTO certificate (id_user) VALUES 
(1),  -- для Ивана
(2);  -- для Петра


INSERT into skills(skill_name) values
('Pycaret, Random Forest, Anomaly Detеction, Gradient Boosting, Cluster analysis,
 K-fold');

INSERT INTO intership (intership_name, name_project, id_skills, start, finish) VALUES 
('Internship A', 'Project A', 1, '2023-01-01', '2023-02-01');


UPDATE users SET id_intership = 1, id_competencies = 1 WHERE id_user = 1;  

SELECT u .*
FROM users u
WHERE u.id_intership IS NULL
