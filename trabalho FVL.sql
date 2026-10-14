create database mercado_fvl;

use mercado_fvl;

-- tabela de categorias
create table categorias (
    id_categoria int auto_increment primary key,
    nome varchar(100) not null,
    descricao varchar(255) not null
);

-- tabela de fornecedores
create table fornecedores (
    id_fornecedor int auto_increment primary key,
    nome varchar(100) not null,
    telefone varchar(20),
    cidade varchar(100) not null
);

-- tabela principal de produtos
create table produtos (
    id_produto int auto_increment primary key,
    nome varchar(100) not null,
    descricao varchar(255) not null,
    preco decimal(10,2) not null,
    unidade varchar(20) not null,
    id_categoria int not null,
    id_fornecedor int not null,

    constraint fk_produto_categoria
        foreign key (id_categoria)
        references categorias(id_categoria)
        on delete cascade
        on update cascade,

    constraint fk_produto_fornecedor
        foreign key (id_fornecedor)
        references fornecedores(id_fornecedor)
        on delete cascade
        on update cascade
);

-- tabela de estoque
create table estoque (
    id_estoque int auto_increment primary key,
    id_produto int not null unique,
    quantidade decimal(10,2) not null,
    data_atualizacao date not null,

    constraint fk_estoque_produto
        foreign key (id_produto)
        references produtos(id_produto)
        on delete cascade
        on update cascade
);

-- tabela para registrar as alterações dos produtos
create table auditoria_produtos (
    id_auditoria int auto_increment primary key,
    id_produto int not null,
    operacao varchar(20) not null,
    data_operacao datetime not null
);

-- categorias
insert into categorias (nome, descricao) values
('frutas', 'frutas frescas'),
('verduras', 'verduras frescas'),
('legumes', 'legumes frescos'),
('frutas tropicais', 'frutas de regioes tropicais'),
('folhosos', 'verduras e folhas'),
('organicos', 'produtos cultivados de forma organica'),
('citricos', 'frutas citricas'),
('tuberculos', 'legumes e raizes'),
('temperos', 'temperos naturais'),
('frutas vermelhas', 'frutas de coloracao vermelha');

-- fornecedores
insert into fornecedores (nome, telefone, cidade) values
('fazenda boa colheita', '45999990001', 'foz do iguacu'),
('hortifruti parana', '45999990002', 'foz do iguacu'),
('campo verde', '45999990003', 'cascavel'),
('sabor da terra', '45999990004', 'toledo'),
('fazenda sol nascente', '45999990005', 'medianeira'),
('produtos naturais pr', '45999990006', 'curitiba'),
('horta familiar', '45999990007', 'sao miguel do iguacu'),
('verde vida', '45999990008', 'santa terezinha de itaipu'),
('agro parana', '45999990009', 'londrina'),
('fazenda primavera', '45999990010', 'maringa');

-- produtos
insert into produtos
(nome, descricao, preco, unidade, id_categoria, id_fornecedor) values
('banana prata', 'banana prata fresca', 5.99, 'kg', 1, 1),
('maca gala', 'maca gala fresca', 8.49, 'kg', 1, 2),
('laranja pera', 'laranja pera fresca', 4.99, 'kg', 7, 3),
('mamao formosa', 'mamao formosa fresco', 6.99, 'kg', 4, 4),
('manga tommy', 'manga tommy fresca', 7.49, 'kg', 4, 5),
('abacaxi', 'abacaxi inteiro', 9.99, 'unidade', 4, 1),
('uva italia', 'uva italia fresca', 11.99, 'kg', 1, 6),
('morango', 'morango fresco', 14.99, 'bandeja', 10, 7),
('limao tahiti', 'limao tahiti fresco', 5.49, 'kg', 7, 8),
('melancia', 'melancia inteira', 3.99, 'kg', 1, 9),
('alface crespa', 'alface crespa fresca', 3.49, 'unidade', 2, 1),
('couve', 'couve fresca', 4.49, 'macico', 5, 2),
('rucula', 'rucula fresca', 5.99, 'macico', 5, 3),
('espinafre', 'espinafre fresco', 6.49, 'macico', 5, 4),
('acelga', 'acelga fresca', 5.49, 'unidade', 2, 5),
('repolho verde', 'repolho verde fresco', 4.99, 'kg', 2, 6),
('agriao', 'agriao fresco', 5.99, 'macico', 5, 7),
('alface americana', 'alface americana fresca', 4.49, 'unidade', 2, 8),
('couve manteiga', 'couve manteiga fresca', 5.49, 'macico', 5, 9),
('cheiro verde', 'cheiro verde fresco', 3.99, 'macico', 9, 10),
('batata inglesa', 'batata inglesa fresca', 4.99, 'kg', 3, 1),
('cenoura', 'cenoura fresca', 5.49, 'kg', 3, 2),
('beterraba', 'beterraba fresca', 5.99, 'kg', 3, 3),
('abobrinha', 'abobrinha fresca', 6.49, 'kg', 3, 4),
('berinjela', 'berinjela fresca', 6.99, 'kg', 3, 5),
('chuchu', 'chuchu fresco', 4.49, 'kg', 3, 6),
('mandioca', 'mandioca fresca', 5.99, 'kg', 8, 7),
('batata doce', 'batata doce fresca', 5.49, 'kg', 8, 8),
('inhame', 'inhame fresco', 7.49, 'kg', 8, 9),
('pepino', 'pepino fresco', 5.99, 'kg', 3, 10),
('pera', 'pera fresca', 9.99, 'kg', 1, 1),
('kiwi', 'kiwi fresco', 15.99, 'kg', 1, 2),
('goiaba', 'goiaba fresca', 8.99, 'kg', 4, 3),
('maracuja', 'maracuja fresco', 12.99, 'kg', 4, 4),
('abacate', 'abacate fresco', 7.99, 'kg', 4, 5),
('pimentao verde', 'pimentao verde fresco', 8.49, 'kg', 3, 6),
('tomate', 'tomate fresco', 6.99, 'kg', 3, 7),
('cebola', 'cebola fresca', 5.49, 'kg', 3, 8),
('alho', 'alho fresco', 18.99, 'kg', 9, 9),
('gengibre', 'gengibre fresco', 13.99, 'kg', 9, 10);

-- estoque
insert into estoque
(id_produto, quantidade, data_atualizacao) values
(1, 50, '2026-10-01'),
(2, 35, '2026-10-01'),
(3, 60, '2026-10-01'),
(4, 25, '2026-10-01'),
(5, 40, '2026-10-01'),
(6, 20, '2026-10-01'),
(7, 30, '2026-10-01'),
(8, 15, '2026-10-01'),
(9, 45, '2026-10-01'),
(10, 18, '2026-10-01'),
(11, 25, '2026-10-01'),
(12, 20, '2026-10-01'),
(13, 18, '2026-10-01'),
(14, 15, '2026-10-01'),
(15, 22, '2026-10-01'),
(16, 30, '2026-10-01'),
(17, 16, '2026-10-01'),
(18, 20, '2026-10-01'),
(19, 17, '2026-10-01'),
(20, 25, '2026-10-01'),
(21, 70, '2026-10-01'),
(22, 55, '2026-10-01'),
(23, 40, '2026-10-01'),
(24, 35, '2026-10-01'),
(25, 30, '2026-10-01'),
(26, 45, '2026-10-01'),
(27, 35, '2026-10-01'),
(28, 40, '2026-10-01'),
(29, 25, '2026-10-01'),
(30, 50, '2026-10-01'),
(31, 30, '2026-10-01'),
(32, 25, '2026-10-01'),
(33, 30, '2026-10-01'),
(34, 20, '2026-10-01'),
(35, 25, '2026-10-01'),
(36, 40, '2026-10-01'),
(37, 35, '2026-10-01'),
(38, 30, '2026-10-01'),
(39, 15, '2026-10-01'),
(40, 20, '2026-10-01');

-- trigger de insercao
delimiter //

create trigger trg_produto_insert
after insert on produtos
for each row
begin
    insert into auditoria_produtos
    (id_produto, operacao, data_operacao)
    values
    (new.id_produto, 'insert', now());
end//

-- trigger de atualizacao
create trigger trg_produto_update
after update on produtos
for each row
begin
    insert into auditoria_produtos
    (id_produto, operacao, data_operacao)
    values
    (new.id_produto, 'update', now());
end//

-- trigger de exclusao
create trigger trg_produto_delete
after delete on produtos
for each row
begin
    insert into auditoria_produtos
    (id_produto, operacao, data_operacao)
    values
    (old.id_produto, 'delete', now());
end//

delimiter ;

-- crud

-- create
insert into produtos
(nome, descricao, preco, unidade, id_categoria, id_fornecedor)
values
('banana nanica', 'banana nanica fresca', 5.49, 'kg', 1, 1);

-- read
select * from produtos;

-- update
update produtos
set preco = 6.49
where id_produto = 41;

-- delete
delete from produtos
where id_produto = 41;

-- inner join
select
    produtos.id_produto,
    produtos.nome as produto,
    categorias.nome as categoria,
    fornecedores.nome as fornecedor,
    produtos.preco
from produtos
inner join categorias
    on produtos.id_categoria = categorias.id_categoria
inner join fornecedores
    on produtos.id_fornecedor = fornecedores.id_fornecedor;

-- left join
select
    categorias.id_categoria,
    categorias.nome as categoria,
    produtos.nome as produto
from categorias
left join produtos
    on categorias.id_categoria = produtos.id_categoria;

-- right join
select
    fornecedores.id_fornecedor,
    fornecedores.nome as fornecedor,
    produtos.nome as produto,
    produtos.preco
from produtos
right join fornecedores
    on produtos.id_fornecedor = fornecedores.id_fornecedor;

-- consulta do estoque
select
    produtos.nome as produto,
    categorias.nome as categoria,
    estoque.quantidade,
    estoque.data_atualizacao
from produtos
inner join categorias
    on produtos.id_categoria = categorias.id_categoria
inner join estoque
    on produtos.id_produto = estoque.id_produto;

-- consulta da auditoria
select * from auditoria_produtos;
