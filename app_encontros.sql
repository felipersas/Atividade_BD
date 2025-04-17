-- DDL: Criação das tabelas 

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    genero VARCHAR(20),
    cidade VARCHAR(100) NOT NULL
);

CREATE TABLE interesses (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE curtidas (
    id SERIAL PRIMARY KEY,
    id_usuario_origem INT NOT NULL,
    id_usuario_destino INT NOT NULL,
    data_curtida DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_usuario_origem FOREIGN KEY (id_usuario_origem) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_usuario_destino FOREIGN KEY (id_usuario_destino) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE usuarios_interesses (
    id_usuario INT NOT NULL,
    id_interesse INT NOT NULL,
    PRIMARY KEY (id_usuario, id_interesse),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (id_interesse) REFERENCES interesses(id) ON DELETE CASCADE
);


-- DML: Inserção de dados
-- Usuários
INSERT INTO usuarios (nome, email, data_nascimento, genero, cidade) VALUES
('Alice', 'alice@example.com', '1995-04-12', 'Feminino', 'São Paulo'),
('Bruno', 'bruno@example.com', '1990-10-23', 'Masculino', 'Rio de Janeiro'),
('Carla', 'carla@example.com', '1998-07-08', 'Feminino', 'São Paulo'),
('Daniel', 'daniel@example.com', '1992-02-14', 'Masculino', 'Belo Horizonte'),
('Eva', 'eva@example.com', '1994-09-30', 'Feminino', 'Curitiba');

-- Interesses
INSERT INTO interesses (descricao) VALUES
('Música'),
('Esportes'),
('Leitura'),
('Viagens');

-- Relacionando usuários e interesses
INSERT INTO usuarios_interesses VALUES
(1, 1), (1, 3),
(2, 2), (2, 4),
(3, 1), (3, 2),
(4, 3), (4, 4),
(5, 1), (5, 4);

-- Curtidas
INSERT INTO curtidas (id_usuario_origem, id_usuario_destino, data_curtida) VALUES
(1, 2, '2024-04-01'),
(2, 1, '2024-04-02'),
(3, 4, '2024-04-03'),
(4, 3, '2024-04-04'),
(5, 1, '2024-04-05'),
(1, 5, '2024-04-06');
