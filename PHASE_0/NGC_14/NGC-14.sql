CREATE TABLE `employees` (
  `employee_id` integer PRIMARY KEY AUTO_INCREMENT,
  `nik` integer NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
);

CREATE TABLE `departments` (
  `department_id` integer PRIMARY KEY AUTO_INCREMENT,
  `manager_id` integer UNIQUE NOT NULL,
  `dep_name` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `projects` (
  `project_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL
);

CREATE TABLE `employee_project` (
  `employee_id` integer,
  `project_id` integer,
  PRIMARY KEY (`employee_id`, `project_id`)
);

ALTER TABLE `employees` ADD FOREIGN KEY (`employee_id`) REFERENCES `departments` (`manager_id`);

ALTER TABLE `employee_project` ADD FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

ALTER TABLE `employee_project` ADD FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);
