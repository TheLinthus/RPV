create sequence seq_contato;

create table contato (
                    id integer DEFAULT nextval('seq_contato') NOT NULL,
                    nome varchar(50) not null,
                    assunto varchar(30), 
                    email varchar(50) not null, 
                    mensagem varchar(4000),
                    primary key (id)
                   );

alter table  contato add column ip varchar(30);

create sequence  seq_visitas;

create table  visitas (
                          id integer default  nextval('seq_visitas')  not null,
                          ip varchar(30),
                          primary key (id)   
                          );