CREATE TABLE `curriculum` (
  `curriculum_ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name_of_study` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_course_credits` float DEFAULT NULL,
  `year_of_start_training` year DEFAULT NULL,
  PRIMARY KEY (`curriculum_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Student(
	student_ID INT NOT NULL,
	surname VARCHAR(50),
	firsname VARCHAR(50),
	birthday DATE,
	gender VARCHAR(50),
	year_of_start_study YEAR,
	curriculum_ID VARCHAR(255),
	PRIMARY KEY (student_ID),
	FOREIGN KEY (curriculum_ID) REFERENCES curriculum(curriculum_ID)

);
CREATE TABLE Teacher(
	teacher_ID INT,
	surname VARCHAR(50),
	firstname VARCHAR(50),
	birthday DATE,
	gender VARCHAR(50),
	academic_rank VARCHAR(255),
	PRIMARY KEY (teacher_ID)
	)
	
CREATE TABLE Subject_class(
	subject_ID VARCHAR(255),
	subject_name VARCHAR(255),
	course_creadits FLOAT,
	year_of_start YEAR,
	category VARCHAR(50),
	brief_description VARCHAR(255),
	detail_description TEXT,
	document VARCHAR(255),
	target VARCHAR(255),
	evaluation_way VARCHAR(255),
	curriculum_ID VARCHAR(255),
	PRIMARY KEY (subject_ID),
	FOREIGN KEY (curriculum_ID) REFERENCES curriculum(curriculum_ID)
	
)	;

CREATE TABLE class(
	class_ID INT,
	year_study YEAR,
	semester INT,
	subject_ID VARCHAR(255),
	teacher_ID INT,
	description TEXT,
	number_of_student INT,
	PRIMARY KEY (class_ID),
	FOREIGN KEY (subject_ID) REFERENCES subject_class(subject_ID),
	FOREIGN KEY (teacher_ID) REFERENCES teacher(teacher_ID)

);

CREATE TABLE participation(
	class_ID INT NOT NULL,
	student_ID INT NOT NULL,
	grade FLOAT,
	FOREIGN KEY (class_ID) REFERENCES class(class_ID),
	FOREIGN KEY (student_ID) REFERENCES student(student_ID),
	CONSTRAINT PK_participation PRIMARY KEY (class_ID, student_ID)
);

CREATE TABLE User(
	username VARCHAR(255),
	password VARCHAR(255),
	category VARCHAR(255),
	student_ID INT,
	teacher_ID INT,
	FOREIGN KEY (student_ID) REFERENCES student(student_ID),
	FOREIGN KEY (teacher_ID) REFERENCES teacher(teacher_ID) 
);
