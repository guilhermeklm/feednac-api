CREATE DATABASE feednac;

\c feednac;

CREATE TABLE curso (
    cur_id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    categoria INT
);

CREATE TABLE turma (
    tur_id SERIAL PRIMARY KEY,
    nome VARCHAR(25)
);

CREATE TABLE estudante (
    est_id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    email  VARCHAR(255),
    status BOOLEAN default true,
    data_nascimento VARCHAR(10),
    telefone VARCHAR(13),
    curso_id INT,
    turma_id INT,
    CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES curso(cur_id),
    CONSTRAINT fk_turma FOREIGN KEY (turma_id) REFERENCES turma(tur_id)
);

CREATE TABLE professor (
    prf_id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    usuario VARCHAR(20),
    email  VARCHAR(255),
    senha VARCHAR(30),
    telefone VARCHAR(13)
);

CREATE TABLE disciplina (
    dsp_id SERIAL PRIMARY KEY,
    nome varchar(100),
    professor_id INT,
    CONSTRAINT fk_professor FOREIGN KEY (professor_id) REFERENCES professor(prf_id)
);

CREATE TABLE estudante_disciplina (
      estudante_disciplina_id SERIAL PRIMARY KEY,
      estudante_id INT,
      disciplina_id INT,
      CONSTRAINT fk_estudante FOREIGN KEY (estudante_id) REFERENCES estudante(est_id),
      CONSTRAINT fk_disciplina FOREIGN KEY (disciplina_id) REFERENCES disciplina(dsp_id),
      CONSTRAINT estudante_disciplina_unique UNIQUE (estudante_id, disciplina_id)
);

CREATE TABLE aula (
    aul_id SERIAL PRIMARY KEY,
    professor_id INT,
    disciplina_id INT,
    turma_id INT,
    duracao VARCHAR(20),
    andar INTEGER,
    sala INTEGER,
    CONSTRAINT fk_professor FOREIGN KEY (professor_id) REFERENCES professor(prf_id),
    CONSTRAINT fk_disciplina FOREIGN KEY (disciplina_id) REFERENCES disciplina(dsp_id),
    CONSTRAINT fk_turma FOREIGN KEY (turma_id) REFERENCES turma(tur_id)
);


--- INSERT CURSO ---
INSERT INTO curso (nome, categoria)
VALUES ('Analise e Desenvolvimento de Sistemas', 0);

INSERT INTO curso (nome, categoria)
VALUES ('Sistemas para Internet', 0);


--- INSERT TURMA ---
INSERT INTO turma (nome)
VALUES ('ADS4N24/1');

INSERT INTO turma (nome)
VALUES ('ADS5N24/1');


--- INSERT ESTUDANTE ---
INSERT INTO estudante (nome, email, status, data_nascimento, telefone, curso_id, turma_id)
VALUES ('João', 'joao@gmail.com', true, '10/12/2000', '51985063945', 1, 1);

INSERT INTO estudante (nome, email, status, data_nascimento, telefone, curso_id, turma_id)
VALUES ('Maria', 'maria@gmail.com', true, '03/05/2001', '51957430684', 2, 2);


--- INSERT PROFESSOR ---
INSERT INTO professor (nome, email, usuario, senha, telefone) VALUES
('Alberto', 'alberto@gmail.com', 'alberto', 'senha', '4328472384'),
('Beatriz', 'beatriz@gmail.com', 'beatriz', 'senha', '9876543210'),
('Carlos', 'carlos@gmail.com', 'carlos', 'senha', '1234567890');


--- INSERT DISCIPLINA ---
INSERT INTO disciplina (nome, professor_id) VALUES
('Computacao em nuvem', 1), -- Alberto
('Logica de programacao', 2), -- Beatriz
('Sistemas distribuidos', 3); -- Carlos


--- INSERT DISCIPLINA DO ALUNO ---
INSERT INTO estudante_disciplina (estudante_id, disciplina_id) VALUES
(1, 1), -- Joao - Computacao em nuvem
(1, 2), -- Joao - Logica de programaçao
(1, 3), -- Joao - Sistemas distribuidos
(2, 1), -- Maria - Computacao em nuvem
(2, 2), -- Maria - Logica de programaçao
(2, 3); -- Maria - Sistemas distribuidos


--- INSERT AULA ---
INSERT INTO aula (professor_id, disciplina_id, turma_id, duracao, andar, sala) VALUES
(1, 2, 1, '3 horas', 3, 203);

INSERT INTO aula (professor_id, disciplina_id, turma_id, duracao, andar, sala) VALUES
(1, 2, 2, '3 horas', 3, 203);