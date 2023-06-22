/*  

DESIGN E DESENVOLVIMENTO DE BANCO DE DADOS 2023/1, PROJETO INTEGRADO

CC1Mc
Kyevenn Mendes Rezende
Lucas Bonato Soares
Nathan Álex da Silva Oliveira
Nicolas Salvador
Paulo Guilherme Goldner Ribeiro

Contato:
lucasbonato4546@gmail.com

*/



-- Primeiro, inicia-se o processo de criar o banco de dados 'unifortes'.

DROP DATABASE IF EXISTS unifortes;   --APAGAR ISSO DEPOIS APAGAR ISSO DEPOIS APAGAR ISSO DEPOIS APAGAR ISSO DEPOIS APAGAR ISSO DEPOIS APAGAR ISSO DEPOIS APAGAR ISSO DEPOIS


-- Criação do banco de dados 'unifortes'
CREATE DATABASE unifortes
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    CONNECTION LIMIT = -1;


-- Definição de um comentário para o banco de dados 'unifortes'
COMMENT ON DATABASE uvv IS 'Contêm dados relacionados à plataforma UNIFORTES e todos os seus serviços, processos, usuários, etc.';


-- Conexão ao banco de dados 'uvv' (Sem gerar prompt de senha!!)
\c unifortes





CREATE TABLE Cursos (
                curso_id NUMERIC(38) NOT NULL,
                Nome_curso VARCHAR(255) NOT NULL,
                carga_horaria VARCHAR(5),
                CONSTRAINT cursos_pk PRIMARY KEY (curso_id)
);
COMMENT ON TABLE Cursos IS 'Tabela contendo informações sobre os cursos disponiveis na plataforma.';
COMMENT ON COLUMN Cursos.curso_id IS 'PK da tabela cursos, identifica cada linha da tabela.';
COMMENT ON COLUMN Cursos.Nome_curso IS 'Coluna que armazena o nome de cada curso disponivel na plataforma.';
COMMENT ON COLUMN Cursos.carga_horaria IS 'Coluna que armazena qual é a carga horaria do curso (30h, 120h, etc)';


CREATE TABLE funcionarios (
                Matricula NUMERIC(38) NOT NULL,
                Nome VARCHAR(255) NOT NULL,
                Posicao_no_rank NUMERIC(10),
                Logradouro VARCHAR(50),
                Bairro VARCHAR(100),
                Cidade VARCHAR(100),
                UF VARCHAR(25) NOT NULL,
                CONSTRAINT funcionarios_pk PRIMARY KEY (Matricula)
);
COMMENT ON TABLE funcionarios IS 'Tabela contendo os dados dos funcionários inscritos na plataforma.';
COMMENT ON COLUMN funcionarios.Matricula IS 'PK da tabela funcionarios. Identifica cada linha da tabela.';
COMMENT ON COLUMN funcionarios.Nome IS 'Coluna que armazena o nome de cada funcionário, como no RG.';
COMMENT ON COLUMN funcionarios.Posicao_no_rank IS 'Coluna que consta em qual posição no rank da plataforma o funcionário está.';
COMMENT ON COLUMN funcionarios.Logradouro IS 'Consta a rua do funcionário.';
COMMENT ON COLUMN funcionarios.Bairro IS 'Consta o bairro do funcionário.';
COMMENT ON COLUMN funcionarios.Cidade IS 'Consta a cidade do funcionário.';
COMMENT ON COLUMN funcionarios.UF IS 'Consta o estado (unidade federativa) do funcionário.';


CREATE TABLE Progresso_curso (
                Matricula NUMERIC(38) NOT NULL,
                curso_id NUMERIC(38) NOT NULL,
                cursos_completos NUMERIC(2) NOT NULL,
                pontos_adquiridos NUMERIC(10),
                aulas_completadas VARCHAR(100),
                CONSTRAINT progresso_curso_pk PRIMARY KEY (Matricula, curso_id)
);
COMMENT ON TABLE Progresso_curso IS 'Tabela que guarda informações relacionadas ao progresso de cada funcionário em cada curso.';
COMMENT ON COLUMN Progresso_curso.Matricula IS 'Faz parte da PK da tabela e é uma FK para a tabela funcionarios.';
COMMENT ON COLUMN Progresso_curso.curso_id IS 'Faz parte da PK da tabela e é uma FK para a tabela cursos.';
COMMENT ON COLUMN Progresso_curso.cursos_completos IS 'Coluna que armazena quantos cursos um usuario finalizou na plataforma.';
COMMENT ON COLUMN Progresso_curso.pontos_adquiridos IS 'Coluna que armazena quantos pontos um funcionario acumulou ao fazer os cursos.';
COMMENT ON COLUMN Progresso_curso.aulas_completadas IS 'Coluna constando quantas aulas um funcionario completou nos cursos.';


CREATE TABLE funcionarios_telefones (
                Numero_telefone NUMERIC(9) NOT NULL,
                DDD NUMERIC(2) NOT NULL,
                Matricula NUMERIC(38) NOT NULL,
                CONSTRAINT funcionarios_telefones_pk PRIMARY KEY (Numero_telefone, DDD)
);
COMMENT ON TABLE funcionarios_telefones IS 'Tabela que armazena os telefones dos funcionários.';
COMMENT ON COLUMN funcionarios_telefones.Numero_telefone IS 'Faz parte da PK e armazena o número de telefone de um funcionário.';
COMMENT ON COLUMN funcionarios_telefones.DDD IS 'Faz parte da PK, armazenando o DDD do número de telefone armazenado.';
COMMENT ON COLUMN funcionarios_telefones.Matricula IS 'FK para a tabela funcionários. Consta a qual funcionário cada telefone armazenado se refere.';


CREATE TABLE funcionarios_emails (
                Email VARCHAR(100) NOT NULL,
                Matricula NUMERIC(38) NOT NULL,
                CONSTRAINT funcionarios_emails_pk PRIMARY KEY (Email, Matricula)
);
COMMENT ON TABLE funcionarios_emails IS 'Tabela contendo os emails dos funcionários.';
COMMENT ON COLUMN funcionarios_emails.Email IS 'Coluna que faz parte da PK composta da tabela. Consta um email de um determinado funcionario.';
COMMENT ON COLUMN funcionarios_emails.Matricula IS 'Faz parte da PK da tabela, e é uma FK para a tabela funcionários. Identifica de qual funcionário são os emails da tabela.';


CREATE TABLE recompensas (
                recompensa_id NUMERIC(38) NOT NULL,
                nome_recomp VARCHAR(255) NOT NULL,
                tipo VARCHAR(255) NOT NULL,
                custo NUMERIC(10,2) NOT NULL,
                descricao VARCHAR(255),
                Matricula NUMERIC(38) NOT NULL,
                CONSTRAINT recompensas_pk PRIMARY KEY (recompensa_id)
);
COMMENT ON TABLE recompensas IS 'Tabela contendo dados sobre as recompensas disponíveis para reinvidicação pelos funcionários na plataforma.';
COMMENT ON COLUMN recompensas.recompensa_id IS 'PK da tabela, identifica cada linha.';
COMMENT ON COLUMN recompensas.nome_recomp IS 'Coluna que armazena o nome da recompensa.';
COMMENT ON COLUMN recompensas.tipo IS 'Coluna que consta o tipo de recompensa (dinheiro, viagem, folga, etc)';
COMMENT ON COLUMN recompensas.custo IS 'Coluna que consta quanto a recompensa custa em pontos.';
COMMENT ON COLUMN recompensas.descricao IS 'Coluna utilizada para qualquer descricao adicional da recompensa.';
COMMENT ON COLUMN recompensas.Matricula IS 'FK para a tabela funcionarios. Consta a qual funcionário cada recompensa reinvidicada se refere.';


ALTER TABLE Progresso_curso ADD CONSTRAINT cursos_progresso_curso_fk
FOREIGN KEY (curso_id)
REFERENCES Cursos (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE funcionarios_emails ADD CONSTRAINT funcionarios_funcionarios_emails_fk
FOREIGN KEY (Matricula)
REFERENCES funcionarios (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE funcionarios_telefones ADD CONSTRAINT funcionarios_funcionarios_telefones_fk
FOREIGN KEY (Matricula)
REFERENCES funcionarios (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Progresso_curso ADD CONSTRAINT funcionarios_progresso_curso_fk
FOREIGN KEY (Matricula)
REFERENCES funcionarios (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE recompensas ADD CONSTRAINT funcionarios_recompensas_fk
FOREIGN KEY (Matricula)
REFERENCES funcionarios (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
