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
