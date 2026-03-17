CREATE TABLE Aluno (
    id_aluno INTEGER PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_nascimento DATE,
    endereco VARCHAR(200)
);

CREATE TABLE Professor (
    id_professor INTEGER PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE Curso (
    id_curso INTEGER PRIMARY KEY,
    idioma VARCHAR(50) NOT NULL,
    nivel VARCHAR(50),
    carga_horaria INTEGER
);

CREATE TABLE Turma (
    id_turma INTEGER PRIMARY KEY,
    idioma VARCHAR(50),
    turno VARCHAR(20),
    ano INTEGER,
    semestre INTEGER,
    id_curso INTEGER,
    id_professor INTEGER,

    CONSTRAINT fk_turma_curso
        FOREIGN KEY (id_curso)
        REFERENCES Curso(id_curso),

    CONSTRAINT fk_turma_professor
        FOREIGN KEY (id_professor)
        REFERENCES Professor(id_professor)
);

CREATE TABLE Matricula (
    id_matricula INTEGER PRIMARY KEY,
    id_aluno INTEGER,
    id_turma INTEGER,
    data_matricula DATE,
    status VARCHAR(20),

    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (id_aluno)
        REFERENCES Aluno(id_aluno),

    CONSTRAINT fk_matricula_turma
        FOREIGN KEY (id_turma)
        REFERENCES Turma(id_turma)
);