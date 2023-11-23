create database restaurantedelas;
create table usuario (id int 
auto_increment primary key,
nome varchar(255),
email varchar(255),
senha varchar(255));
select * from usuario;

CREATE TABLE produtos (
    id INT NOT NULL AUTO_INCREMENT, 
    prato VARCHAR(45) NOT NULL, 
    ingredientes VARCHAR(90) NOT NULL, 
    imagem VARCHAR(80) NOT NULL, 
    valor DECIMAL (5,2) NOT NULL, 
PRIMARY KEY (id));

INSERT INTO produtos (prato, ingredientes, imagem,valor) VALUES ('Macarrão à carbonara', 'Macarrão, molho carbonara e bacon', 'carbonara.jpg', 'R$60,00');
INSERT INTO produtos (prato, ingredientes, imagem, valor) VALUES ('Ravioli de 4 queijos', 'Massa, molho ao sugo e manjericão', 'ravioli.jpg', 'R$70,00');
INSERT INTO produtos (prato, ingredientes, imagem,valor) VALUES ('Nhoque', 'Massa, molho ao sugo, tomate cereja e manjericão', 'nhoque.jpg', 'R$55,00');
INSERT INTO produtos (prato, ingredientes, imagem,valor) VALUES ('Macarrão ao molho sugo', 'Macarrão, molho ao sugo, tomate e manjericão', 'macarrao.jpg', 'R$40,00');
INSERT INTO produtos (prato, ingredientes, imagem,valor) VALUES ('Fettuccine alfredo', 'Massa, molho alfredo e manjericão', 'fettuccine.jpg', 'R$65,00');
INSERT INTO produtos (prato,ingredientes, imagem, valor) VALUES ('Rondelli de presunto e queijo', 'Massa, molho ao sugo, manjericão e queijo ralado', 'rondelli.jpg', 'R$65,00');
INSERT INTO produtos (prato, ingredientes, imagem, valor) VALUES ('Salada de massa grega', 'Massa tipo fusilli, vinagre, pés de salsa, tomate-cereja, queijo feta, azeitonas pretas, chá de orégãos', 'salada.jpg', 'R$30,00');
INSERT INTO produtos (prato, ingredientes, imagem, valor) VALUES ('Macarrão farfalle', 'Massa, ervilha, bacon, molho à bolonhesa', 'farfalle.jpg', 'R$50,00');
INSERT INTO produtos (prato, ingredientes, imagem, valor) VALUES ('Panqueca', 'Massa, presunto, queijo, molho ao sugo, queijo ralado e manjericão', 'panqueca.jpg', 'R$45,00');
INSERT INTO produtos (prato, ingredientes, imagem, valor) VALUES ('Combo família', 'Celebre a Tradição com Nosso Combo Família: Macarrão ao Molho Sugo', 'familia.jpg', 'R$200,00');
INSERT INTO produtos (prato, ingredientes, imagem, valor) VALUES ('Combo casal', ' Um Jantar Romântico: Combo Casal Fettuccine Alfredo', 'casal.jpg', 'R$150,00');
INSERT INTO produtos (prato, ingredientes, imagem, valor) VALUES ('Combo Kids', 'Aventura Saborosa para Pequenos Gourmets: Combo Kids Panqueca', 'kids.jpg', 'R$100,00');

/*update produtos set imagem = 'img/carbonara.jpg' where id = 1;
update produtos set imagem = 'img/ravioli.jpg' where id = 2;
update produtos set imagem = 'img/nhoque.jpg' where id = 3;
update produtos set imagem = 'img/macarrao.jpg' where id = 4;
update produtos set imagem = 'img/fettuccine.jpg' where id = 5;
update produtos set imagem = 'img/rondelli.jpg' where id = 6;
update produtos set imagem = 'img/salada.jpg' where id = 7;
update produtos set imagem = 'img/farfalle.jpg' where id = 8;
update produtos set imagem = 'img/panqueca.jpg' where id = 9;
update produtos set imagem = 'img/familia.jpg' where id = 10;
update produtos set imagem = 'img/casal.jpg' where id = 11;
update produtos set imagem = 'img/kids.jpg' where id = 12;
*/
select * from produtos;
#delete from produtos where id >33;
update produtos set imagem = concat("../img/",imagem) where id= 33;

select * from usuario;


alter table usuario add perfil varchar(50) default(0);
update usuario set perfil = 'admin' where email = 'bgg@ifsp.edu.br';

drop database restaurantedelas;