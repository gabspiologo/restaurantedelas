
create database restaurantedelas;
use restaurantedelas;
create table usuario (
nome varchar(255),
email varchar(255) primary key,
senha varchar(255));
select * from usuario; 

drop database restaurantedelas;

create database cardapio;
use cardapio;
create table menu (
id int primary key,
prato varchar(255),
ingredientes varchar(255),
valor int(255)); 
imagem varchar(80);
select * from menu; 

insert into menu values ("macarrao a carbonara","macarrao, molho carbonara e bacon",60), ("Ravioli de 4 queijos","massa, molho ao sugo e manjericao",70),
("Nhoque","Massa, molho ao sugo, tomate cereja e manjericão",55) , ("Macarrão ao molho sugo","macarrao, molho ao sugo, tomate e manjericao",40) ,
("Fettuccine alfredo","massa, molho alfredo e manjericao",65) , ("Rondelli de presunto e queijo"," Massa, molho ao sugo, manjericão e queijo ralado",65),
("Salada de massa grega"," massa tipo fusilli, vinagre, pés de salsa, tomate-cereja, queijo feta, azeitonas pretas, cha de oregaos",30) ,
("Macarrão farfalle","massa, ervilha, bacon, molho a bolonhesa",50), ("panqueca","Massa, presunto, queijo, molho ao sugo, queijo ralado e manjericão",45);



