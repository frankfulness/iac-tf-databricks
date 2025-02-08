DROP TABLE IF EXISTS test_work_employee_names;

CREATE TABLE test_work_employee_names (
  id INT PRIMARY KEY,
  name STRING
);

INSERT INTO test_work_employee_names (id, name)
VALUES 
  (1, 'Anu'),
  (2, 'Brian'),
  (3, 'Charles'),
  (4, 'Charlie'),
  (5, 'Courtney'),
  (6, 'Drew'),
  (7, 'Eli'),
  (8, 'Evan'),
  (9, 'Frank'),
  (10, 'Hatem'),
  (11, 'Katya'),
  (12, 'Princess'),
  (13, 'Phillip'),
  (14, 'Nathan');

SELECT * FROM test_work_employee_names;
