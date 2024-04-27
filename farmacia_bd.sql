CREATE DATABASE farmacia_db;
    -- Criação da tabela de Produtos
CREATE TABLE farmacia_db.Produtos (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10, 2),
    Estoque INT
);

-- Criação da tabela de Clientes
CREATE TABLE farmacia_db.Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

-- Criação da tabela de Vendas
CREATE TABLE farmacia_db.Vendas (
    VendaID INT PRIMARY KEY,
    ClienteID INT,
    DataVenda DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Criação da tabela de ItensVenda para relacionar os produtos vendidos em cada venda
CREATE TABLE farmacia_db.ItensVenda (
    ItemID INT PRIMARY KEY,
    VendaID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    TotalItem DECIMAL(10, 2),
    FOREIGN KEY (VendaID) REFERENCES Vendas(VendaID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Inserindo dados na tabela Produtos
INSERT INTO farmacia_db.Produtos (ProdutoID, Nome, Preco, Estoque) VALUES
(1, 'Paracetamol', 5.50, 100),
(2, 'Dipirona', 4.00, 80),
(3, 'Amoxicilina', 8.20, 50),
(4, 'Omeprazol', 10.75, 60),
(5, 'Cetoprofeno', 7.90, 70);

-- Inserindo dados na tabela Clientes
INSERT INTO farmacia_db.Clientes (ClienteID, Nome, Email, Telefone) VALUES
(1, 'João Silva', 'joao@email.com', '(11) 98765-4321'),
(2, 'Maria Souza', 'maria@email.com', '(11) 99876-5432'),
(3, 'José Santos', 'jose@email.com', '(11) 98765-1234'),
(4, 'Ana Oliveira', 'ana@email.com', '(11) 98765-6789'),
(5, 'Pedro Costa', 'pedro@email.com', '(11) 98765-9876');

-- Inserindo dados na tabela Vendas
INSERT INTO farmacia_db.Vendas (VendaID, ClienteID, DataVenda, Total) VALUES
(1, 1, '2024-04-27', 30.00),
(2, 2, '2024-04-28', 25.50),
(3, 3, '2024-04-29', 42.20),
(4, 4, '2024-04-30', 18.50),
(5, 5, '2024-05-01', 15.00);

-- Inserindo dados na tabela ItensVenda
INSERT INTO farmacia_db.ItensVenda (ItemID, VendaID, ProdutoID, Quantidade, PrecoUnitario, TotalItem) VALUES
(1, 1, 1, 3, 5.50, 16.50),
(2, 1, 3, 2, 8.20, 16.40),
(3, 2, 2, 5, 4.00, 20.00),
(4, 3, 4, 4, 10.75, 43.00),
(5, 4, 5, 2, 7.90, 15.80);
