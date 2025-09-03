-- MySQL Forward Engineering (clean: no ASC/VISIBLE)

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `engine_crm2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `engine_crm2`;

-- Domínios/parametrizações
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `decisoes_parecer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `esferas_administrativas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tipos_orgao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `status_orgao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Orgaos públicos
CREATE TABLE IF NOT EXISTS `orgaos_publicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `sigla` VARCHAR(20) NOT NULL,
  `cnpj` VARCHAR(18) NOT NULL,
  `esfera_adm_id` INT NOT NULL,
  `tipo_orgao_id` INT NOT NULL,
  `email_institucional` VARCHAR(120) NOT NULL,
  `telefone_geral` VARCHAR(30) DEFAULT NULL,
  `site_oficial` VARCHAR(200) DEFAULT NULL,
  `nome_responsavel` VARCHAR(100) DEFAULT NULL,
  `email_responsavel` VARCHAR(120) DEFAULT NULL,
  `telefone_responsavel` VARCHAR(30) DEFAULT NULL,
  `status_orgao_id` INT NOT NULL,
  `logo_orgao` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj` (`cnpj`),
  INDEX `esfera_adm_id` (`esfera_adm_id`),
  INDEX `tipo_orgao_id` (`tipo_orgao_id`),
  INDEX `status_orgao_id` (`status_orgao_id`),
  CONSTRAINT `orgaos_publicos_ibfk_1`
    FOREIGN KEY (`esfera_adm_id`) REFERENCES `esferas_administrativas` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `orgaos_publicos_ibfk_2`
    FOREIGN KEY (`tipo_orgao_id`) REFERENCES `tipos_orgao` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `orgaos_publicos_ibfk_3`
    FOREIGN KEY (`status_orgao_id`) REFERENCES `status_orgao` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `modalidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `portais_compra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `url` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `mercados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `setores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `status_oportunidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `fases_pipeline` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Oportunidades
CREATE TABLE IF NOT EXISTS `oportunidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero_processo` VARCHAR(30) NOT NULL,
  `uasg` VARCHAR(20) NOT NULL,
  `orgao_id` INT NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `modalidade_id` INT NOT NULL,
  `portal_id` INT NOT NULL,
  `data_abertura` DATE NOT NULL,
  `data_entrega` DATE NOT NULL,
  `objeto` VARCHAR(400) NOT NULL,
  `esfera_id` INT NOT NULL,
  `mercado_id` INT NOT NULL,
  `setor_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `fase_pipeline_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `orgao_id` (`orgao_id`),
  INDEX `modalidade_id` (`modalidade_id`),
  INDEX `portal_id` (`portal_id`),
  INDEX `esfera_id` (`esfera_id`),
  INDEX `mercado_id` (`mercado_id`),
  INDEX `setor_id` (`setor_id`),
  INDEX `status_id` (`status_id`),
  INDEX `fase_pipeline_id` (`fase_pipeline_id`),
  CONSTRAINT `oportunidades_ibfk_1`
    FOREIGN KEY (`orgao_id`) REFERENCES `orgaos_publicos` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `oportunidades_ibfk_2`
    FOREIGN KEY (`modalidade_id`) REFERENCES `modalidades` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `oportunidades_ibfk_3`
    FOREIGN KEY (`portal_id`) REFERENCES `portais_compra` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `oportunidades_ibfk_4`
    FOREIGN KEY (`esfera_id`) REFERENCES `esferas_administrativas` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `oportunidades_ibfk_5`
    FOREIGN KEY (`mercado_id`) REFERENCES `mercados` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `oportunidades_ibfk_6`
    FOREIGN KEY (`setor_id`) REFERENCES `setores` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `oportunidades_ibfk_7`
    FOREIGN KEY (`status_id`) REFERENCES `status_oportunidade` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `oportunidades_ibfk_8`
    FOREIGN KEY (`fase_pipeline_id`) REFERENCES `fases_pipeline` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Usuários e domínios
CREATE TABLE IF NOT EXISTS `funcoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `perfis_acesso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `status_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(100) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `funcao_id` INT NOT NULL,
  `perfil_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `ultimo_acesso` DATETIME DEFAULT NULL,
  `senha_acesso` VARCHAR(255) NOT NULL,
  `foto_avatar` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email`),
  INDEX `funcao_id` (`funcao_id`),
  INDEX `perfil_id` (`perfil_id`),
  INDEX `status_id` (`status_id`),
  CONSTRAINT `usuarios_ibfk_1`
    FOREIGN KEY (`funcao_id`) REFERENCES `funcoes` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `usuarios_ibfk_2`
    FOREIGN KEY (`perfil_id`) REFERENCES `perfis_acesso` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `usuarios_ibfk_3`
    FOREIGN KEY (`status_id`) REFERENCES `status_usuario` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Documentos da oportunidade
CREATE TABLE IF NOT EXISTS `documentos_oportunidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `nome_arquivo` VARCHAR(200) NOT NULL,
  `caminho_arquivo` VARCHAR(255) NOT NULL,
  `tipo_arquivo` VARCHAR(50) DEFAULT NULL,
  `data_upload` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` INT DEFAULT NULL,
  `observacoes` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id`),
  INDEX `usuario_id` (`usuario_id`),
  CONSTRAINT `documentos_oportunidade_ibfk_1`
    FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `documentos_oportunidade_ibfk_2`
    FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Grupo e Lotes
CREATE TABLE IF NOT EXISTS `grupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `descricao` VARCHAR(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id`),
  CONSTRAINT `lotes_ibfk_10`
    FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `lotes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `descricao` VARCHAR(400) DEFAULT NULL,
  `grupo_id` INT DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `lotes_ibfk_1_idx` (`grupo_id`),
  CONSTRAINT `lotes_ibfk_1`
    FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Unidades e Itens
CREATE TABLE IF NOT EXISTS `unidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sigla` VARCHAR(10) NOT NULL,
  `descricao` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `sigla` (`sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `itens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lote_id` INT NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `descricao` VARCHAR(400) DEFAULT NULL,
  `quantidade` INT DEFAULT NULL,
  `unidade_id` INT NOT NULL,
  `valor_unitario` DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `lote_id` (`lote_id`),
  INDEX `unidade_id` (`unidade_id`),
  CONSTRAINT `itens_ibfk_1`
    FOREIGN KEY (`lote_id`) REFERENCES `lotes` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `itens_ibfk_2`
    FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inteligência de negócio
CREATE TABLE IF NOT EXISTS `inteligencia_negocio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `vencedor` VARCHAR(200) NOT NULL,
  `cnpj_vencedor` VARCHAR(18) NOT NULL,
  `posicao_empresa` INT DEFAULT NULL,
  `valor_adjudicado` DECIMAL(15,2) DEFAULT NULL,
  `valor_lance_vencedor` DECIMAL(15,2) DEFAULT NULL,
  `reducao` DECIMAL(6,2) DEFAULT NULL,
  `numero_participantes` INT DEFAULT NULL,
  `caminho_pasta` VARCHAR(255) DEFAULT NULL,
  `item_id` INT DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id`),
  INDEX `item_id` (`item_id`),
  CONSTRAINT `inteligencia_negocio_ibfk_1`
    FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `inteligencia_negocio_item`
    FOREIGN KEY (`item_id`) REFERENCES `itens` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Demais domínios
CREATE TABLE IF NOT EXISTS `motivos_parecer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `descricao` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Join table oportunidade x categoria
CREATE TABLE IF NOT EXISTS `oportunidade_categoria` (
  `oportunidade_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`oportunidade_id`, `categoria_id`),
  INDEX `categoria_id` (`categoria_id`),
  CONSTRAINT `oportunidade_categoria_ibfk_1`
    FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `oportunidade_categoria_ibfk_2`
    FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tipos_parecer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `status_parecer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Pareceres
CREATE TABLE IF NOT EXISTS `pareceres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `tipo_parecer_id` INT NOT NULL,
  `responsavel_id` INT NOT NULL,
  `decisao_id` INT NOT NULL,
  `motivo_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `observacoes` TEXT DEFAULT NULL,
  `forcas` TEXT DEFAULT NULL,
  `fraquezas` TEXT DEFAULT NULL,
  `oportunidades` TEXT DEFAULT NULL,
  `ameacas` TEXT DEFAULT NULL,
  `data_criacao` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id`),
  INDEX `tipo_parecer_id` (`tipo_parecer_id`),
  INDEX `responsavel_id` (`responsavel_id`),
  INDEX `decisao_id` (`decisao_id`),
  INDEX `motivo_id` (`motivo_id`),
  INDEX `status_id` (`status_id`),
  CONSTRAINT `pareceres_ibfk_1`
    FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `pareceres_ibfk_2`
    FOREIGN KEY (`tipo_parecer_id`) REFERENCES `tipos_parecer` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `pareceres_ibfk_3`
    FOREIGN KEY (`responsavel_id`) REFERENCES `usuarios` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `pareceres_ibfk_4`
    FOREIGN KEY (`decisao_id`) REFERENCES `decisoes_parecer` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `pareceres_ibfk_5`
    FOREIGN KEY (`motivo_id`) REFERENCES `motivos_parecer` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `pareceres_ibfk_6`
    FOREIGN KEY (`status_id`) REFERENCES `status_parecer` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Permissões e join de perfil-permissão
CREATE TABLE IF NOT EXISTS `permissoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `perfis_permissoes` (
  `perfil_id` INT NOT NULL,
  `permissao_id` INT NOT NULL,
  PRIMARY KEY (`perfil_id`, `permissao_id`),
  INDEX `permissao_id` (`permissao_id`),
  CONSTRAINT `perfis_permissoes_ibfk_1`
    FOREIGN KEY (`perfil_id`) REFERENCES `perfis_acesso` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `perfis_permissoes_ibfk_2`
    FOREIGN KEY (`permissao_id`) REFERENCES `permissoes` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Regiões e tipos
CREATE TABLE IF NOT EXISTS `regioes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tipos_regiao_com` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tipos_comercial` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tipos_contratacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tipos_temperatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Projetos
CREATE TABLE IF NOT EXISTS `projetos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orgao_id` INT NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `macro_regiao_id` INT NOT NULL,
  `regiao_comercial_id` INT NOT NULL,
  `nome_projeto` VARCHAR(150) NOT NULL,
  `descricao` TEXT DEFAULT NULL,
  `tipo_comercial_id` INT NOT NULL,
  `tipo_contratacao_id` INT NOT NULL,
  `temperatura_id` INT NOT NULL,
  `data_inicio` DATE DEFAULT NULL,
  `data_fim` DATE DEFAULT NULL,
  `valor_global` DECIMAL(15,2) DEFAULT NULL,
  `valor_mensal` DECIMAL(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `orgao_id` (`orgao_id`),
  INDEX `macro_regiao_id` (`macro_regiao_id`),
  INDEX `regiao_comercial_id` (`regiao_comercial_id`),
  INDEX `tipo_comercial_id` (`tipo_comercial_id`),
  INDEX `tipo_contratacao_id` (`tipo_contratacao_id`),
  INDEX `temperatura_id` (`temperatura_id`),
  CONSTRAINT `projetos_ibfk_1`
    FOREIGN KEY (`orgao_id`) REFERENCES `orgaos_publicos` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `projetos_ibfk_2`
    FOREIGN KEY (`macro_regiao_id`) REFERENCES `regioes` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `projetos_ibfk_3`
    FOREIGN KEY (`regiao_comercial_id`) REFERENCES `tipos_regiao_com` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `projetos_ibfk_4`
    FOREIGN KEY (`tipo_comercial_id`) REFERENCES `tipos_comercial` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `projetos_ibfk_5`
    FOREIGN KEY (`tipo_contratacao_id`) REFERENCES `tipos_contratacao` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `projetos_ibfk_6`
    FOREIGN KEY (`temperatura_id`) REFERENCES `tipos_temperatura` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Questionamentos
CREATE TABLE IF NOT EXISTS `questionamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `questao` TEXT NOT NULL,
  `resposta` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id`),
  CONSTRAINT `questionamentos_ibfk_1`
    FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidades` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Descarta a FK que aponta para oportunidades
ALTER TABLE inteligencia_negocio
  DROP FOREIGN KEY inteligencia_negocio_ibfk_1;


ALTER TABLE fases_pipeline
ADD COLUMN sequencia INT NOT NULL AFTER nome;



ALTER TABLE `engine_crm2`.`orgaos_publicos` 
DROP FOREIGN KEY `orgaos_publicos_ibfk_2`,
DROP FOREIGN KEY `orgaos_publicos_ibfk_3`;
ALTER TABLE `engine_crm2`.`orgaos_publicos` 
CHANGE COLUMN `tipo_orgao_id` `tipo_orgao_id` INT NULL ,
CHANGE COLUMN `status_orgao_id` `status_orgao_id` INT NULL ;
ALTER TABLE `engine_crm2`.`orgaos_publicos` 
ADD CONSTRAINT `orgaos_publicos_ibfk_2`
  FOREIGN KEY (`tipo_orgao_id`)
  REFERENCES `engine_crm2`.`tipos_orgao` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `orgaos_publicos_ibfk_3`
  FOREIGN KEY (`status_orgao_id`)
  REFERENCES `engine_crm2`.`status_orgao` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;


  CREATE TABLE IF NOT EXISTS vint_crm2.grupo (
  id               INT NOT NULL AUTO_INCREMENT,
  oportunidade_id  INT NOT NULL,
  nome             VARCHAR(80)  NOT NULL,
  descricao        VARCHAR(400) NULL,
  PRIMARY KEY (id),
  INDEX idx_grupo_oportunidade (oportunidade_id),
  CONSTRAINT fk_grupo_oportunidade
    FOREIGN KEY (oportunidade_id)
    REFERENCES vint_crm2.oportunidades (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE vint_crm2.lotes
  ADD COLUMN grupo_id INT NULL AFTER descricao,
  ADD INDEX idx_lotes_grupo (grupo_id),
  ADD CONSTRAINT fk_lotes_grupo
    FOREIGN KEY (grupo_id)
    REFERENCES vint_crm2.grupo (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
