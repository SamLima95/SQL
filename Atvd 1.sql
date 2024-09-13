CREATE TABLE `professor` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `idade` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `posto` varchar(255),
  `especialidade` varchar(255)
);

CREATE TABLE `estu_pos_gradu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `idade` int,
  `curso` varchar(255) NOT NULL,
  `aconselhador_id` int
);

CREATE TABLE `financ_projeto` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `financiador` varchar(255),
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `orcamento` decimal(15,2) NOT NULL
);

CREATE TABLE `projeto` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `gerente_professor_id` int NOT NULL,
  `professor_id` int NOT NULL,
  `estu_pos_gradu_id` int NOT NULL
);

CREATE TABLE `departamento` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `escritorio_p` varchar(255) NOT NULL,
  `lider_professor` int NOT NULL,
  `professor_id` int NOT NULL,
  `curso_derpa` varchar(255) NOT NULL
);

ALTER TABLE `estu_pos_gradu` ADD FOREIGN KEY (`aconselhador_id`) REFERENCES `estu_pos_gradu` (`id`);

ALTER TABLE `projeto` ADD FOREIGN KEY (`gerente_professor_id`) REFERENCES `professor` (`id`);

ALTER TABLE `projeto` ADD FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`);

ALTER TABLE `projeto` ADD FOREIGN KEY (`estu_pos_gradu_id`) REFERENCES `estu_pos_gradu` (`id`);

ALTER TABLE `departamento` ADD FOREIGN KEY (`lider_professor`) REFERENCES `professor` (`id`);

ALTER TABLE `departamento` ADD FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`);

ALTER TABLE `departamento` ADD FOREIGN KEY (`curso_derpa`) REFERENCES `estu_pos_gradu` (`curso`);
