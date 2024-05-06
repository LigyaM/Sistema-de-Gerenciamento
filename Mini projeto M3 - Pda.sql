CREATE TABLE `usuario` (
  `id_usuario` int PRIMARY KEY,
  `nome` varchar(255),
  `email` varchar(255),
  `senha` varchar(255),
  `preferencias_notificacao` varchar(255)
);

CREATE TABLE `tarefa` (
  `id_tarefa` int PRIMARY KEY,
  `descricao` text,
  `data_vencimento` date,
  `status` varchar(255),
  `prioridade` varchar(255),
  `id_usuario` int
);

CREATE TABLE `Grupo_Domestico` (
  `id_grupo` int PRIMARY KEY,
  `nome_grupo` varchar(255),
  `config_privacidade` varchar(255)
);

CREATE TABLE `Membro_Grupo` (
  `id_usuario` int,
  `id_grupo` int
);

CREATE TABLE `Tarefa_Grupo` (
  `id_grupo` int,
  `tarefa_id` int
);

CREATE TABLE `usuario_tarefa` (
  `usuario_id_usuario` int,
  `tarefa_id_usuario` int,
  PRIMARY KEY (`usuario_id_usuario`, `tarefa_id_usuario`)
);

ALTER TABLE `usuario_tarefa` ADD FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `usuario_tarefa` ADD FOREIGN KEY (`tarefa_id_usuario`) REFERENCES `tarefa` (`id_usuario`);


ALTER TABLE `Membro_Grupo` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `Membro_Grupo` ADD FOREIGN KEY (`id_grupo`) REFERENCES `Grupo_Domestico` (`id_grupo`);

ALTER TABLE `Tarefa_Grupo` ADD FOREIGN KEY (`id_grupo`) REFERENCES `Grupo_Domestico` (`id_grupo`);

ALTER TABLE `tarefa` ADD FOREIGN KEY (`id_tarefa`) REFERENCES `Tarefa_Grupo` (`tarefa_id`);
