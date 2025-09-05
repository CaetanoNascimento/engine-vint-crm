-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema engine_crm2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema engine_crm2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `engine_crm2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `engine_crm2` ;

-- -----------------------------------------------------
-- Table `engine_crm2`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`decisoes_parecer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`decisoes_parecer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`esferas_administrativas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`esferas_administrativas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`tipos_orgao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`tipos_orgao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`status_orgao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`status_orgao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`orgaos_publicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`orgaos_publicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `sigla` VARCHAR(20) NOT NULL,
  `cnpj` VARCHAR(18) NOT NULL,
  `esfera_adm_id` INT NOT NULL,
  `tipo_orgao_id` INT NULL DEFAULT NULL,
  `email_institucional` VARCHAR(120) NOT NULL,
  `telefone_geral` VARCHAR(30) NULL DEFAULT NULL,
  `site_oficial` VARCHAR(200) NULL DEFAULT NULL,
  `nome_responsavel` VARCHAR(100) NULL DEFAULT NULL,
  `email_responsavel` VARCHAR(120) NULL DEFAULT NULL,
  `telefone_responsavel` VARCHAR(30) NULL DEFAULT NULL,
  `status_orgao_id` INT NULL DEFAULT NULL,
  `logo_orgao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj` (`cnpj` ASC) VISIBLE,
  INDEX `esfera_adm_id` (`esfera_adm_id` ASC) VISIBLE,
  INDEX `tipo_orgao_id` (`tipo_orgao_id` ASC) VISIBLE,
  INDEX `status_orgao_id` (`status_orgao_id` ASC) VISIBLE,
  CONSTRAINT `orgaos_publicos_ibfk_1`
    FOREIGN KEY (`esfera_adm_id`)
    REFERENCES `engine_crm2`.`esferas_administrativas` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `orgaos_publicos_ibfk_2`
    FOREIGN KEY (`tipo_orgao_id`)
    REFERENCES `engine_crm2`.`tipos_orgao` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `orgaos_publicos_ibfk_3`
    FOREIGN KEY (`status_orgao_id`)
    REFERENCES `engine_crm2`.`status_orgao` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`modalidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`modalidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`portais_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`portais_compra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `url` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`mercados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`mercados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`setores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`setores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`status_oportunidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`status_oportunidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`fases_pipeline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`fases_pipeline` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `sequencia` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`oportunidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`oportunidades` (
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
  INDEX `orgao_id` (`orgao_id` ASC) VISIBLE,
  INDEX `modalidade_id` (`modalidade_id` ASC) VISIBLE,
  INDEX `portal_id` (`portal_id` ASC) VISIBLE,
  INDEX `esfera_id` (`esfera_id` ASC) VISIBLE,
  INDEX `mercado_id` (`mercado_id` ASC) VISIBLE,
  INDEX `setor_id` (`setor_id` ASC) VISIBLE,
  INDEX `status_id` (`status_id` ASC) VISIBLE,
  INDEX `fase_pipeline_id` (`fase_pipeline_id` ASC) VISIBLE,
  CONSTRAINT `oportunidades_ibfk_1`
    FOREIGN KEY (`orgao_id`)
    REFERENCES `engine_crm2`.`orgaos_publicos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `oportunidades_ibfk_2`
    FOREIGN KEY (`modalidade_id`)
    REFERENCES `engine_crm2`.`modalidades` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `oportunidades_ibfk_3`
    FOREIGN KEY (`portal_id`)
    REFERENCES `engine_crm2`.`portais_compra` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `oportunidades_ibfk_4`
    FOREIGN KEY (`esfera_id`)
    REFERENCES `engine_crm2`.`esferas_administrativas` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `oportunidades_ibfk_5`
    FOREIGN KEY (`mercado_id`)
    REFERENCES `engine_crm2`.`mercados` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `oportunidades_ibfk_6`
    FOREIGN KEY (`setor_id`)
    REFERENCES `engine_crm2`.`setores` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `oportunidades_ibfk_7`
    FOREIGN KEY (`status_id`)
    REFERENCES `engine_crm2`.`status_oportunidade` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `oportunidades_ibfk_8`
    FOREIGN KEY (`fase_pipeline_id`)
    REFERENCES `engine_crm2`.`fases_pipeline` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`funcoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`funcoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(120) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`perfis_acesso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`perfis_acesso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`status_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`status_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(100) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `funcao_id` INT NOT NULL,
  `perfil_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `ultimo_acesso` DATETIME NULL DEFAULT NULL,
  `senha_acesso` VARCHAR(255) NOT NULL,
  `foto_avatar` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `funcao_id` (`funcao_id` ASC) VISIBLE,
  INDEX `perfil_id` (`perfil_id` ASC) VISIBLE,
  INDEX `status_id` (`status_id` ASC) VISIBLE,
  CONSTRAINT `usuarios_ibfk_1`
    FOREIGN KEY (`funcao_id`)
    REFERENCES `engine_crm2`.`funcoes` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `usuarios_ibfk_2`
    FOREIGN KEY (`perfil_id`)
    REFERENCES `engine_crm2`.`perfis_acesso` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `usuarios_ibfk_3`
    FOREIGN KEY (`status_id`)
    REFERENCES `engine_crm2`.`status_usuario` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`documentos_oportunidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`documentos_oportunidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `nome_arquivo` VARCHAR(200) NOT NULL,
  `caminho_arquivo` VARCHAR(255) NOT NULL,
  `tipo_arquivo` VARCHAR(50) NULL DEFAULT NULL,
  `data_upload` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` INT NULL DEFAULT NULL,
  `observacoes` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id` ASC) VISIBLE,
  INDEX `usuario_id` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `documentos_oportunidade_ibfk_1`
    FOREIGN KEY (`oportunidade_id`)
    REFERENCES `engine_crm2`.`oportunidades` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `documentos_oportunidade_ibfk_2`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `engine_crm2`.`usuarios` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`grupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `descricao` VARCHAR(400) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id` ASC) VISIBLE,
  CONSTRAINT `lotes_ibfk_10`
    FOREIGN KEY (`oportunidade_id`)
    REFERENCES `engine_crm2`.`oportunidades` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`lotes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`lotes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `descricao` VARCHAR(400) NULL DEFAULT NULL,
  `grupo_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `lotes_ibfk_1_idx` (`grupo_id` ASC) VISIBLE,
  CONSTRAINT `lotes_ibfk_1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `engine_crm2`.`grupo` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`unidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sigla` VARCHAR(10) NOT NULL,
  `descricao` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `sigla` (`sigla` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`itens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lote_id` INT NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `descricao` VARCHAR(400) NULL DEFAULT NULL,
  `quantidade` INT NULL DEFAULT NULL,
  `unidade_id` INT NOT NULL,
  `valor_unitario` DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `lote_id` (`lote_id` ASC) VISIBLE,
  INDEX `unidade_id` (`unidade_id` ASC) VISIBLE,
  CONSTRAINT `itens_ibfk_1`
    FOREIGN KEY (`lote_id`)
    REFERENCES `engine_crm2`.`lotes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `itens_ibfk_2`
    FOREIGN KEY (`unidade_id`)
    REFERENCES `engine_crm2`.`unidades` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`inteligencia_negocio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`inteligencia_negocio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `vencedor` VARCHAR(200) NOT NULL,
  `cnpj_vencedor` VARCHAR(18) NOT NULL,
  `posicao_empresa` INT NULL DEFAULT NULL,
  `valor_adjudicado` DECIMAL(15,2) NULL DEFAULT NULL,
  `valor_lance_vencedor` DECIMAL(15,2) NULL DEFAULT NULL,
  `reducao` DECIMAL(6,2) NULL DEFAULT NULL,
  `numero_participantes` INT NULL DEFAULT NULL,
  `caminho_pasta` VARCHAR(255) NULL DEFAULT NULL,
  `item_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id` ASC) VISIBLE,
  INDEX `item_id` (`item_id` ASC) VISIBLE,
  CONSTRAINT `inteligencia_negocio_item`
    FOREIGN KEY (`item_id`)
    REFERENCES `engine_crm2`.`itens` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`motivos_parecer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`motivos_parecer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `descricao` (`descricao` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`oportunidade_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`oportunidade_categoria` (
  `oportunidade_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`oportunidade_id`, `categoria_id`),
  INDEX `categoria_id` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `oportunidade_categoria_ibfk_1`
    FOREIGN KEY (`oportunidade_id`)
    REFERENCES `engine_crm2`.`oportunidades` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `oportunidade_categoria_ibfk_2`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `engine_crm2`.`categorias` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`tipos_parecer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`tipos_parecer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`status_parecer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`status_parecer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`pareceres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`pareceres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `tipo_parecer_id` INT NOT NULL,
  `responsavel_id` INT NOT NULL,
  `decisao_id` INT NOT NULL,
  `motivo_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `observacoes` TEXT NULL DEFAULT NULL,
  `forcas` TEXT NULL DEFAULT NULL,
  `fraquezas` TEXT NULL DEFAULT NULL,
  `oportunidades` TEXT NULL DEFAULT NULL,
  `ameacas` TEXT NULL DEFAULT NULL,
  `data_criacao` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id` ASC) VISIBLE,
  INDEX `tipo_parecer_id` (`tipo_parecer_id` ASC) VISIBLE,
  INDEX `responsavel_id` (`responsavel_id` ASC) VISIBLE,
  INDEX `decisao_id` (`decisao_id` ASC) VISIBLE,
  INDEX `motivo_id` (`motivo_id` ASC) VISIBLE,
  INDEX `status_id` (`status_id` ASC) VISIBLE,
  CONSTRAINT `pareceres_ibfk_1`
    FOREIGN KEY (`oportunidade_id`)
    REFERENCES `engine_crm2`.`oportunidades` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `pareceres_ibfk_2`
    FOREIGN KEY (`tipo_parecer_id`)
    REFERENCES `engine_crm2`.`tipos_parecer` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `pareceres_ibfk_3`
    FOREIGN KEY (`responsavel_id`)
    REFERENCES `engine_crm2`.`usuarios` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `pareceres_ibfk_4`
    FOREIGN KEY (`decisao_id`)
    REFERENCES `engine_crm2`.`decisoes_parecer` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `pareceres_ibfk_5`
    FOREIGN KEY (`motivo_id`)
    REFERENCES `engine_crm2`.`motivos_parecer` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `pareceres_ibfk_6`
    FOREIGN KEY (`status_id`)
    REFERENCES `engine_crm2`.`status_parecer` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`permissoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`permissoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`perfis_permissoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`perfis_permissoes` (
  `perfil_id` INT NOT NULL,
  `permissao_id` INT NOT NULL,
  PRIMARY KEY (`perfil_id`, `permissao_id`),
  INDEX `permissao_id` (`permissao_id` ASC) VISIBLE,
  CONSTRAINT `perfis_permissoes_ibfk_1`
    FOREIGN KEY (`perfil_id`)
    REFERENCES `engine_crm2`.`perfis_acesso` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `perfis_permissoes_ibfk_2`
    FOREIGN KEY (`permissao_id`)
    REFERENCES `engine_crm2`.`permissoes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`regioes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`regioes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`tipos_regiao_com`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`tipos_regiao_com` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`tipos_comercial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`tipos_comercial` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`tipos_contratacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`tipos_contratacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`tipos_temperatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`tipos_temperatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome` (`nome` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`projetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`projetos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orgao_id` INT NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `macro_regiao_id` INT NOT NULL,
  `regiao_comercial_id` INT NOT NULL,
  `nome_projeto` VARCHAR(150) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `tipo_comercial_id` INT NOT NULL,
  `tipo_contratacao_id` INT NOT NULL,
  `temperatura_id` INT NOT NULL,
  `data_inicio` DATE NULL DEFAULT NULL,
  `data_fim` DATE NULL DEFAULT NULL,
  `valor_global` DECIMAL(15,2) NULL DEFAULT NULL,
  `valor_mensal` DECIMAL(15,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `orgao_id` (`orgao_id` ASC) VISIBLE,
  INDEX `macro_regiao_id` (`macro_regiao_id` ASC) VISIBLE,
  INDEX `regiao_comercial_id` (`regiao_comercial_id` ASC) VISIBLE,
  INDEX `tipo_comercial_id` (`tipo_comercial_id` ASC) VISIBLE,
  INDEX `tipo_contratacao_id` (`tipo_contratacao_id` ASC) VISIBLE,
  INDEX `temperatura_id` (`temperatura_id` ASC) VISIBLE,
  CONSTRAINT `projetos_ibfk_1`
    FOREIGN KEY (`orgao_id`)
    REFERENCES `engine_crm2`.`orgaos_publicos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `projetos_ibfk_2`
    FOREIGN KEY (`macro_regiao_id`)
    REFERENCES `engine_crm2`.`regioes` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `projetos_ibfk_3`
    FOREIGN KEY (`regiao_comercial_id`)
    REFERENCES `engine_crm2`.`tipos_regiao_com` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `projetos_ibfk_4`
    FOREIGN KEY (`tipo_comercial_id`)
    REFERENCES `engine_crm2`.`tipos_comercial` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `projetos_ibfk_5`
    FOREIGN KEY (`tipo_contratacao_id`)
    REFERENCES `engine_crm2`.`tipos_contratacao` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `projetos_ibfk_6`
    FOREIGN KEY (`temperatura_id`)
    REFERENCES `engine_crm2`.`tipos_temperatura` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `engine_crm2`.`questionamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `engine_crm2`.`questionamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oportunidade_id` INT NOT NULL,
  `questao` TEXT NOT NULL,
  `resposta` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `oportunidade_id` (`oportunidade_id` ASC) VISIBLE,
  CONSTRAINT `questionamentos_ibfk_1`
    FOREIGN KEY (`oportunidade_id`)
    REFERENCES `engine_crm2`.`oportunidades` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
