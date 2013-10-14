CREATE TABLE form_answer (id BIGINT AUTO_INCREMENT, form_question_id BIGINT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, deleted_at DATETIME, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;

CREATE TABLE form_questionary (id BIGINT AUTO_INCREMENT, name VARCHAR(255), type VARCHAR(255) NOT NULL, max_registrations BIGINT DEFAULT 0 NOT NULL, description TEXT, end_description TEXT, weight BIGINT DEFAULT 0, success_url TEXT, fail_url TEXT, register_text TEXT NOT NULL, register_mailtext TEXT NOT NULL, status VARCHAR(12) DEFAULT 'ok' NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, deleted_at DATETIME, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;

CREATE TABLE form_question (id BIGINT AUTO_INCREMENT, form_questionary_id BIGINT, description TEXT, type VARCHAR(12) NOT NULL, number BIGINT DEFAULT 0 NOT NULL, is_mandatory TINYINT(1) DEFAULT '0' NOT NULL, is_duplicate TINYINT(1) DEFAULT '0' NOT NULL, offered_to VARCHAR(12), tag VARCHAR(12), status VARCHAR(12) DEFAULT 'ok' NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, deleted_at DATETIME, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;

CREATE TABLE form_variant (id BIGINT AUTO_INCREMENT, form_question_id BIGINT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, deleted_at DATETIME, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;

ALTER TABLE form_answer ADD CONSTRAINT fafqi FOREIGN KEY (form_question_id) REFERENCES form_question(id);
ALTER TABLE form_variant ADD CONSTRAINT fvfqi FOREIGN KEY (form_question_id) REFERENCES form_question(id);
ALTER TABLE form_question ADD CONSTRAINT fqfqi FOREIGN KEY (form_questionary_id) REFERENCES form_questionary(id);
