CREATE DATABASE IF NOT EXISTS star_schema_professor;
USE star_schema_professor;

-- ==============================
-- DIMENSÃO PROFESSOR
-- ==============================
CREATE TABLE DimProfessor (
    ProfessorID INT AUTO_INCREMENT PRIMARY KEY,
    ProfessorOriginalID INT,
    Nome VARCHAR(100),
    Titulacao VARCHAR(50),
    TempoCasa INT,
    StatusProfessor VARCHAR(30)
);

-- ==============================
-- DIMENSÃO DEPARTAMENTO
-- ==============================
CREATE TABLE DimDepartamento (
    DepartamentoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeDepartamento VARCHAR(100),
    Centro VARCHAR(100),
    Campus VARCHAR(100)
);

-- ==============================
-- DIMENSÃO CURSO
-- ==============================
CREATE TABLE DimCurso (
    CursoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCurso VARCHAR(100),
    Nivel VARCHAR(50),
    Modalidade VARCHAR(50)
);

-- ==============================
-- DIMENSÃO DISCIPLINA
-- ==============================
CREATE TABLE DimDisciplina (
    DisciplinaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeDisciplina VARCHAR(100),
    CargaHoraria INT,
    Categoria VARCHAR(50)
);

-- ==============================
-- DIMENSÃO DATA
-- ==============================
CREATE TABLE DimData (
    DataID INT AUTO_INCREMENT PRIMARY KEY,
    DataCompleta DATE,
    Ano INT,
    Semestre INT,
    Trimestre INT,
    Mes INT,
    Dia INT
);

-- ==============================
-- DIMENSÃO LOCALIDADE (opcional)
-- ==============================
CREATE TABLE DimLocalidade (
    LocalidadeID INT AUTO_INCREMENT PRIMARY KEY,
    Cidade VARCHAR(100),
    Bloco VARCHAR(50),
    Sala VARCHAR(50)
);

-- ==============================
-- TABELA FATO
-- ==============================
CREATE TABLE Fato_Professor_Curso (
    FatoID BIGINT AUTO_INCREMENT PRIMARY KEY,
    ProfessorID INT,
    DepartamentoID INT,
    CursoID INT,
    DisciplinaID INT,
    DataID INT,
    LocalidadeID INT,
    CargaHorariaMinistrada INT,
    QuantidadeTurmas INT,
    NumeroAlunos INT,
    ValorHoraProfessor DECIMAL(10,2),
    CustoTotal DECIMAL(10,2),

    FOREIGN KEY (ProfessorID) REFERENCES DimProfessor(ProfessorID),
    FOREIGN KEY (DepartamentoID) REFERENCES DimDepartamento(DepartamentoID),
    FOREIGN KEY (CursoID) REFERENCES DimCurso(CursoID),
    FOREIGN KEY (DisciplinaID) REFERENCES DimDisciplina(DisciplinaID),
    FOREIGN KEY (DataID) REFERENCES DimData(DataID),
    FOREIGN KEY (LocalidadeID) REFERENCES DimLocalidade(LocalidadeID)
);
