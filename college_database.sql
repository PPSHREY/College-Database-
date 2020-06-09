CREATE SCHEMA IF NOT EXISTS clg_management DEFAULT CHARACTER SET utf8 ;
USE clg_management ;

DROP TABLE IF EXISTS clg_management.course ;

CREATE TABLE IF NOT EXISTS clg_management.course (
  course_id INT NULL,
  course_name VARCHAR(45) NOT NULL,
  course_duration VARCHAR(45) NULL,
  department_depart_name VARCHAR(50) NOT NULL,
  instructor_instructor_id INT NOT NULL,
  PRIMARY KEY (course_id),
  INDEX fk_course_department1_idx (department_depart_name ASC) VISIBLE,
  INDEX fk_course_instructor1_idx (instructor_instructor_id ASC) VISIBLE,
  CONSTRAINT fk_course_department1
    FOREIGN KEY (department_depart_name)
    REFERENCES clg_management.department (depart_name)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_course_instructor1
    FOREIGN KEY (instructor_instructor_id)
    REFERENCES clg_management.instructor (instructor_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS clg_management.department ;

CREATE TABLE IF NOT EXISTS clg_management.department (
  depart_name VARCHAR(50) NULL,
  location VARCHAR(45) NOT NULL,
  department_head_depart_head VARCHAR(45) NOT NULL,
  PRIMARY KEY (depart_name),
  INDEX fk_department_department_head_idx (department_head_depart_head ASC) VISIBLE,
  CONSTRAINT fk_department_department_head
    FOREIGN KEY (department_head_depart_head)
    REFERENCES clg_management.department_head (depart_head)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS clg_management.department_head ;

CREATE TABLE IF NOT EXISTS clg_management.department_head (
  depart_head VARCHAR(45) NULL,
  instructor_instructor_id INT NOT NULL,
  PRIMARY KEY (depart_head),
  INDEX fk_department_head_instructor1_idx (instructor_instructor_id ASC) VISIBLE,
  CONSTRAINT fk_department_head_instructor1
    FOREIGN KEY (instructor_instructor_id)
    REFERENCES clg_management.instructor (instructor_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS clg_management.instructor ;

CREATE TABLE IF NOT EXISTS clg_management.instructor (
  instructor_id INT NOT NULL,
  instructor_first_name VARCHAR(45) NULL,
  instructor_last_name VARCHAR(45) NULL,
  instructor_phone_no INT NULL,
  instructor_email VARCHAR(45) NOT NULL,
  instructor_address VARCHAR(45) NOT NULL,
  department_depart_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (instructor_id),
  INDEX fk_instructor_department1_idx (department_depart_name ASC) VISIBLE,
  CONSTRAINT fk_instructor_department1
    FOREIGN KEY (department_depart_name)
    REFERENCES clg_management.department (depart_name)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



DROP TABLE IF EXISTS clg_management.student ;

CREATE TABLE IF NOT EXISTS clg_management.student (
  idstudent INT NULL,
  student_first_name VARCHAR(45) NOT NULL,
  student_last_name VARCHAR(45) NOT NULL,
  student_phone_no VARCHAR(45) NOT NULL,
  student_email VARCHAR(45) NOT NULL,
  student_date_of_birth DATETIME NOT NULL,
  PRIMARY KEY (idstudent))
ENGINE = InnoDB;



DROP TABLE IF EXISTS clg_management.student_course ;

CREATE TABLE IF NOT EXISTS clg_management.student_course (
  course_course_id INT NOT NULL,
  student_idstudent INT NOT NULL,
  INDEX fk_student_course_course1_idx (course_course_id ASC) VISIBLE,
  INDEX fk_student_course_student1_idx (student_idstudent ASC) VISIBLE,
  CONSTRAINT fk_student_course_course1
    FOREIGN KEY (course_course_id)
    REFERENCES clg_management.course (course_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_student_course_student1
    FOREIGN KEY (student_idstudent)
    REFERENCES clg_management.student (idstudent)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

