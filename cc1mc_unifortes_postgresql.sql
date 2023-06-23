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



/*
Primeiro, deve-se criar todas as tabelas e comentar tanto as tabelas criadas quanto suas colunas.
Adicionalmente, já atribui-se as colunas que constituem a PK de cada tabela.
*/



-- Criação da tabela 'Cursos', já definindo a coluna 'curso_id' como a PK.
CREATE TABLE Cursos (
                curso_id NUMERIC(38) NOT NULL,
                Nome_curso VARCHAR(255) NOT NULL,
                carga_horaria VARCHAR(5),
                CONSTRAINT cursos_pk PRIMARY KEY (curso_id)
);


-- Definição de um comentário para a tabela 'cursos'.
COMMENT ON TABLE Cursos IS 'Tabela contendo informações sobre os cursos disponiveis na plataforma.';


-- Definição de um comentário para a coluna 'curso_id' da tabela 'cursos'.
COMMENT ON COLUMN Cursos.curso_id IS 'PK da tabela cursos, identifica cada linha da tabela.';


-- Definição de um comentário para a coluna 'nome_curso' da tabela 'cursos'.
COMMENT ON COLUMN Cursos.Nome_curso IS 'Coluna que armazena o nome de cada curso disponivel na plataforma.';


-- Definição de um comentário para a coluna 'carga_horaria' da tabela 'cursos'.
COMMENT ON COLUMN Cursos.carga_horaria IS 'Coluna que armazena qual é a carga horaria do curso (30h, 120h, etc)';




-- Criação da tabela 'funcionarios', já definindo a coluna 'Matricula' como a PK.
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


-- Definição de um comentário para a tabela 'funcionarios'.
COMMENT ON TABLE funcionarios IS 'Tabela contendo os dados dos funcionários inscritos na plataforma.';


-- Definição de um comentário para a coluna 'Matricula' da tabela 'funcionarios'.
COMMENT ON COLUMN funcionarios.Matricula IS 'PK da tabela funcionarios. Identifica cada linha da tabela.';


-- Definição de um comentário para a coluna 'Nome' da tabela 'funcionarios'.
COMMENT ON COLUMN funcionarios.Nome IS 'Coluna que armazena o nome de cada funcionário, como no RG.';


-- Definição de um comentário para a coluna 'Posicao_no_rank' da tabela 'funcionarios'.
COMMENT ON COLUMN funcionarios.Posicao_no_rank IS 'Coluna que consta em qual posição no rank da plataforma o funcionário está.';


-- Definição de um comentário para a coluna 'Logradouro' da tabela 'funcionarios'.
COMMENT ON COLUMN funcionarios.Logradouro IS 'Consta a rua do funcionário.';


-- Definição de um comentário para a coluna 'Bairro' da tabela 'funcionarios'.
COMMENT ON COLUMN funcionarios.Bairro IS 'Consta o bairro do funcionário.';


-- Definição de um comentário para a coluna 'Cidade' da tabela 'funcionarios'.
COMMENT ON COLUMN funcionarios.Cidade IS 'Consta a cidade do funcionário.';


-- Definição de um comentário para a coluna 'UF' da tabela 'funcionarios'.
COMMENT ON COLUMN funcionarios.UF IS 'Consta o estado (unidade federativa) do funcionário.';




-- Criação da tabela 'Progresso_curso', já definindo as colunas 'Matricula' e 'curso_id' como partes da PK composta.
CREATE TABLE Progresso_curso (
                Matricula NUMERIC(38) NOT NULL,
                curso_id NUMERIC(38) NOT NULL,
                cursos_completos NUMERIC(2) NOT NULL,
                pontos_adquiridos NUMERIC(10),
                aulas_completadas VARCHAR(100),
                CONSTRAINT progresso_curso_pk PRIMARY KEY (Matricula, curso_id)
);


-- Definição de um comentário para a tabela 'Porgresso_curso'.
COMMENT ON TABLE Progresso_curso IS 'Tabela que guarda informações relacionadas ao progresso de cada funcionário em cada curso.';


-- Definição de um comentário para a coluna 'Matricula' da tabela 'Progresso_curso'.
COMMENT ON COLUMN Progresso_curso.Matricula IS 'Faz parte da PK da tabela e é uma FK para a tabela funcionarios.';


-- Definição de um comentário para a coluna 'curso_id' da tabela 'Progresso_curso'.
COMMENT ON COLUMN Progresso_curso.curso_id IS 'Faz parte da PK da tabela e é uma FK para a tabela cursos.';


-- Definição de um comentário para a coluna 'cursos_completos' da tabela 'Progresso_curso'.
COMMENT ON COLUMN Progresso_curso.cursos_completos IS 'Coluna que armazena quantos cursos um usuario finalizou na plataforma.';


-- Definição de um comentário para a coluna 'pontos_adquiridos' da tabela 'Progresso_curso'.
COMMENT ON COLUMN Progresso_curso.pontos_adquiridos IS 'Coluna que armazena quantos pontos um funcionario acumulou ao fazer os cursos.';


-- Definição de um comentário para a coluna 'aulas_completadas' da tabela 'Progresso_curso'.
COMMENT ON COLUMN Progresso_curso.aulas_completadas IS 'Coluna constando quantas aulas um funcionario completou nos cursos.';




-- Criação da tabela 'funcionarios_telefones', já definindo as colunas 'Numero_telefone' e 'DDD' como partes da PK composta.
CREATE TABLE funcionarios_telefones (
                Numero_telefone NUMERIC(9) NOT NULL,
                DDD NUMERIC(2) NOT NULL,
                Matricula NUMERIC(38) NOT NULL,
                CONSTRAINT funcionarios_telefones_pk PRIMARY KEY (Numero_telefone, DDD)
);


-- Definição de um comentário para a tabela 'funcionarios_telefones' 
COMMENT ON TABLE funcionarios_telefones IS 'Tabela que armazena os telefones dos funcionários.';


-- Definição de um comentário para a coluna 'Numero_telefone' da tabela 'funcionarios_telefones'.
COMMENT ON COLUMN funcionarios_telefones.Numero_telefone IS 'Faz parte da PK e armazena o número de telefone de um funcionário.';


-- Definição de um comentário para a coluna 'DDD' da tabela 'funcionarios_telefones'.
COMMENT ON COLUMN funcionarios_telefones.DDD IS 'Faz parte da PK, armazenando o DDD do número de telefone armazenado.';


-- Definição de um comentário para a coluna 'Matricula' da tabela 'funcionarios_telefones'.
COMMENT ON COLUMN funcionarios_telefones.Matricula IS 'FK para a tabela funcionários. Consta a qual funcionário cada telefone armazenado se refere.';




-- Criação da tabela 'funcionarios_emails', já definindo as colunas 'Email' e 'Matricula' como partes da PK composta.
CREATE TABLE funcionarios_emails (
                Email VARCHAR(100) NOT NULL,
                Matricula NUMERIC(38) NOT NULL,
                CONSTRAINT funcionarios_emails_pk PRIMARY KEY (Email, Matricula)
);


-- Definição de um comentário para a tabela 'funcionarios_emails'.
COMMENT ON TABLE funcionarios_emails IS 'Tabela contendo os emails dos funcionários.';


-- Definição de um comentário para a coluna 'Email' da tabela 'funcionarios_emails'.
COMMENT ON COLUMN funcionarios_emails.Email IS 'Coluna que faz parte da PK composta da tabela. Consta um email de um determinado funcionario.';


-- Definição de um comentário para a coluna 'Matricula' da tabela 'funcionarios_emails'.
COMMENT ON COLUMN funcionarios_emails.Matricula IS 'Faz parte da PK da tabela, e é uma FK para a tabela funcionários. Identifica de qual funcionário são os emails da tabela.';




-- Criação da tabela 'recompensas', já definindo a coluna 'recompensa_id' a PK.
CREATE TABLE recompensas (
                recompensa_id NUMERIC(38) NOT NULL,
                nome_recomp VARCHAR(255) NOT NULL,
                tipo VARCHAR(255) NOT NULL,
                custo NUMERIC(10,2) NOT NULL,
                descricao VARCHAR(255),
                Matricula NUMERIC(38) NOT NULL,
                CONSTRAINT recompensas_pk PRIMARY KEY (recompensa_id)
);


-- Definição de um comentário para a tabela 'recompensas'.
COMMENT ON TABLE recompensas IS 'Tabela contendo dados sobre as recompensas disponíveis para reinvidicação pelos funcionários na plataforma.';


-- Definição de um comentário para a coluna 'recompensa_id' da tabela 'recompensas'.
COMMENT ON COLUMN recompensas.recompensa_id IS 'PK da tabela, identifica cada linha.';


-- Definição de um comentário para a coluna 'nome_recomp' da tabela 'recompensas'.
COMMENT ON COLUMN recompensas.nome_recomp IS 'Coluna que armazena o nome da recompensa.';


-- Definição de um comentário para a coluna 'tipo' da tabela 'recompensas'.
COMMENT ON COLUMN recompensas.tipo IS 'Coluna que consta o tipo de recompensa (dinheiro, viagem, folga, etc)';


-- Definição de um comentário para a coluna 'custo' da tabela 'recompensas'.
COMMENT ON COLUMN recompensas.custo IS 'Coluna que consta quanto a recompensa custa em pontos.';


-- Definição de um comentário para a coluna 'descricao' da tabela 'recompensas'.
COMMENT ON COLUMN recompensas.descricao IS 'Coluna utilizada para qualquer descricao adicional da recompensa.';


-- Definição de um comentário para a coluna 'Matricula' da tabela 'recompensas'.
COMMENT ON COLUMN recompensas.Matricula IS 'FK para a tabela funcionarios. Consta a qual funcionário cada recompensa reinvidicada se refere.';




/*
Agora, todas as tabelas foram criadas, já tendo suas PKs definidas.
Além disso, comentários foram adicionados a todas as tabelas e colunas criadas.
Agora, deve-se adicionar todas as constraints de FK.
*/




-- Criação da FK que relaciona a tabela 'Progresso_curso' com a tabela 'cursos' por meio da coluna 'curso_id' presente nas duas tabelas.
ALTER TABLE Progresso_curso ADD CONSTRAINT cursos_progresso_curso_fk
FOREIGN KEY (curso_id)
REFERENCES Cursos (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



-- Criação da FK que relaciona a tabela 'funcionarios_email' com a tabela 'funcionarios' por meio da coluna 'Matricula' presente nas duas tabelas.
ALTER TABLE funcionarios_emails ADD CONSTRAINT funcionarios_funcionarios_emails_fk
FOREIGN KEY (Matricula)
REFERENCES funcionarios (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



-- Criação da FK que relaciona a tabela 'funcionarios_telefones' com a tabela 'funcionarios' por meio da coluna 'Matricula' presente nas duas tabelas.
ALTER TABLE funcionarios_telefones ADD CONSTRAINT funcionarios_funcionarios_telefones_fk
FOREIGN KEY (Matricula)
REFERENCES funcionarios (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



-- Criação da FK que relaciona a tabela 'Progresso_curso' com a tabela 'funcionarios' por meio da coluna 'Matricula' presente nas duas tabelas.
ALTER TABLE Progresso_curso ADD CONSTRAINT funcionarios_progresso_curso_fk
FOREIGN KEY (Matricula)
REFERENCES funcionarios (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



-- Criação da FK que relaciona a tabela 'recompensas' com a tabela 'funcionarios' por meio da coluna 'Matricula' presente nas duas tabelas.
ALTER TABLE recompensas ADD CONSTRAINT funcionarios_recompensas_fk
FOREIGN KEY (Matricula)
REFERENCES funcionarios (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;




/*
Agora, todas as tabelas possuem relacionamentos entre si por meio das FKs.
Com isso feito, resta apenas criar as constraints de CHECK para as colunas das tabelas.
*/



--Definição de uma constraint CHECK para a coluna 'carga_horaria' da tabela 'Cursos'. 
ALTER TABLE Cursos
ADD CONSTRAINT cc_Cursos_carga_horaria
CHECK (carga_horaria LIKE '%h');



--Definição de uma constraint CHECK para a coluna 'tipo' da tabela 'recompensas'.
ALTER TABLE recompensas
ADD CONSTRAINT cc_recompensas_tipo
CHECK (tipo IN ('DINHEIRO','FOLGA','VIAGEM','BENEFICIO','OUTRO'));



--Definição de uma constraint CHECK para a coluna 'Email' da tabela 'funcionarios_email'.
ALTER TABLE funcionarios_emails
ADD CONSTRAINT cc_funcionarios_email_email
CHECK (email LIKE '%@%');





/*
Agora as tabelas possuem em diversas colunas constraints de check.

Com isso, a criação das tabelas, colunas, chaves primárias, chaves estrangeiras, constraints de check, comentários de tabela e comentários de coluna foi completa.
*/
