CREATE DATABASE centrouniversitario;
USE centrouniversitario;

CREATE TABLE Curso (
ID_Curso INT AUTO_INCREMENT PRIMARY KEY,
FK_ID_Turma INT,
Nome_Curso VARCHAR (100),
Duracao_Semestres INT,
FK_ID_Disciplina INT
FOREIGN KEY (FK_ID_Turma) REFERENCES Turmas (ID_Turma),
FOREIGN KEY (FK_ID_Disciplina) REFERENCES Disciplinas (ID_Disciplina)
);

INSERT INTO Curso (ID_Curso, FK_ID_Turma, Nome_Curso, Duracao_Semestres, FK_ID_Disciplina)
VALUES
 (1, 01, 'Administração', 4, 20),
 (2, 02, 'Psicologia', 6, 21),
 (3, 03, 'Análise e Desenvolvimento de Sistemas', 4, 22),
 (4, 04, 'Banco de Dados', 2, 23),
 (5, 05, 'Medicina', 6, 24);

CREATE TABLE Turmas (
ID_Turma INT AUTO_INCREMENT PRIMARY KEY,
Nome_Turma VARCHAR (100),
Periodo VARCHAR (100),
FK_ID_Aluno INT,
FOREIGN KEY(FK_ID_Aluno) REFERENCES Alunos(ID_Aluno)
);

INSERT INTO Turmas (ID_Turma, FK_ID_Aluno, Nome_Turma, Periodo)
VALUES
 (1, 01, '1B', 'Noite'),
 (2, 02, '1A', 'Tarde'),
 (3, 03, '2B', 'Manhã'),
 (4, 04, '2A', 'Tarde'),
 (5, 05, '3A', 'Noite');
 

CREATE TABLE Alunos (
ID_Aluno INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR (100),
Matricula INT,
Email VARCHAR (100),
Telefone INT
);

INSERT INTO Alunos (ID_Aluno, Nome, Matricula, Email, Telefone)
VALUES
 (1, 'Maria Clara', 28349094079, 'mariaclara@gmail.com', 6930154067),
 (2, 'Tiagho Migliorini', 79719769092, 'tiagho@gmail.com', 6338653203),
 (3, 'Yris Zago', 30104405023, 'yris@gmail.com', 6432655441),
 (4, 'Rodrigo Faro', 53891256060, 'rodrigofaro@gmail.com', 3131526672),
 (5, 'Celso Portiolli', 00495524069, 'celso@gmail.com', 74969541763),
 (6, 'Ayrton Senna', 35560767050, 'senna@gmail.com', 92979476696);

CREATE TABLE Disciplinas (
ID_Disciplina INT AUTO_INCREMENT PRIMARY KEY,
Nome_Disciplina VARCHAR (100)
);

INSERT INTO Disciplinas (ID_Disciplina, Nome_Disciplina)
VALUES
 (01, 'Avaliação Psicológica'),
 (02, 'Neuropsicologia'),
 (03, 'Economia'),
 (04, 'Estatística'),
 (05, 'Matemática'),
 (06, 'Algoritmos'),
 (07, 'Sistemas Operacionais'),
 (08, 'MySql'),
 (09, 'Oracle'),
 (10, 'Anatomia'),
 (11, 'Imunologia');

CREATE TABLE Professores_Disciplina (
ID_Professor INT,
ID_Disciplina INT 
FOREIGN KEY (ID_Professor) REFERENCES Professores(ID_Professor),
FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);

INSERT INTO Professores_Disciplina (ID_Professor, ID_Disciplina)
VALUES
 (01, 01),
 (01, 02),
 (02, 03),
 (02, 04),
 (03, 05),
 (03, 06),
 (04, 07),
 (04, 08),
 (04, 09),
 (05, 10),
 (05, 11);

CREATE TABLE Professores (
ID_Professor INT AUTO_INCREMENT PRIMARY KEY,
Nome_Professor VARCHAR (100),
);

INSERT INTO Professores (ID_Professor, Nome_Professor, FK_Professores_Disciplina)
VALUES
 (01, 'Adalberto Moraes', 01),
 (02, 'Roberto Lima', 02),
 (03, 'Alexandre Soares', 03),
 (04, 'Gustavo Santos', 04),
 (05, 'Alice Bragança', 05);

CREATE TABLE Professores_Turma (
ID_Professor INT,
ID_Turma INT
FOREIGN KEY (ID_Professor) REFERENCES Professores (ID_Professor),
FOREIGN KEY (ID_Turma) REFERENCES Turmas (ID_Turma)
);

INSERT INTO Professores_Turma (ID_Professor, ID_Turma)
VALUES
 (01, 1),
 (02, 2),
 (03, 3),
 (04, 4),
 (05, 5);

CREATE TABLE Gastos (
ID_Gastos INT AUTO_INCREMENT PRIMARY KEY,
FK_ID_Cursos INT,
Salario DECIMAL (65, 2),
Contas DECIMAL (65, 2),
Manutencao DECIMAL (65, 2),
FOREIGN KEY (FK_ID_Cursos) REFERENCES Curso (ID_Curso)
);

INSERT INTO Gastos (ID_Gastos, FK_ID_Cursos, Salario, Contas, Manutencao)
VALUES
 (01, 1, 3300, 1200, 500);