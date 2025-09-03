/*import BaseModel from '../models/baseModel.js';

const simpleNamed = (table) =>
  new BaseModel({
    table,
    idField: 'id',
    nameField: 'nome',
    insertable: ['nome'],
    updatable: ['nome']
  });

export const entities = {
  categorias: simpleNamed('categorias'),
  decisoes_parecer: simpleNamed('decisoes_parecer'),
  esferas_administrativas: simpleNamed('esferas_administrativas'),
  tipos_orgao: simpleNamed('tipos_orgao'),
  status_orgao: simpleNamed('status_orgao'),
  modalidades: simpleNamed('modalidades'),
  portais_compra: new BaseModel({
    table: 'portais_compra',
    nameField: 'nome',
    insertable: ['nome', 'url'],
    updatable: ['nome', 'url']
  }),
  mercados: simpleNamed('mercados'),
  setores: simpleNamed('setores'),
  status_oportunidade: simpleNamed('status_oportunidade'),
  fases_pipeline: simpleNamed('fases_pipeline'),
  funcoes: simpleNamed('funcoes'),
  perfis_acesso: simpleNamed('perfis_acesso'),
  status_usuario: simpleNamed('status_usuario'),
  unidades: new BaseModel({
    table: 'unidades',
    nameField: 'sigla',
    insertable: ['sigla', 'descricao'],
    updatable: ['sigla', 'descricao']
  }),
  motivos_parecer: new BaseModel({
    table: 'motivos_parecer',
    nameField: 'descricao',
    insertable: ['descricao'],
    updatable: ['descricao']
  }),
  tipos_parecer: simpleNamed('tipos_parecer'),
  status_parecer: simpleNamed('status_parecer'),
  permissoes: simpleNamed('permissoes'),
  regioes: simpleNamed('regioes'),
  tipos_regiao_com: simpleNamed('tipos_regiao_com'),
  tipos_comercial: simpleNamed('tipos_comercial'),
  tipos_contratacao: simpleNamed('tipos_contratacao'),
  tipos_temperatura: simpleNamed('tipos_temperatura'),

  orgaos_publicos: new BaseModel({
    table: 'orgaos_publicos',
    nameField: 'nome',
    insertable: ['nome','sigla','cnpj','esfera_adm_id','tipo_orgao_id','email_institucional','telefone_geral','site_oficial','nome_responsavel','email_responsavel','telefone_responsavel','status_orgao_id','logo_orgao'],
    updatable:  ['nome','sigla','cnpj','esfera_adm_id','tipo_orgao_id','email_institucional','telefone_geral','site_oficial','nome_responsavel','email_responsavel','telefone_responsavel','status_orgao_id','logo_orgao']
  }),

  oportunidades: new BaseModel({
    table: 'oportunidades',
    nameField: 'objeto',
    insertable: ['numero_processo','uasg','orgao_id','uf','modalidade_id','portal_id','data_abertura','data_entrega','objeto','esfera_id','mercado_id','setor_id','status_id','fase_pipeline_id'],
    updatable:  ['numero_processo','uasg','orgao_id','uf','modalidade_id','portal_id','data_abertura','data_entrega','objeto','esfera_id','mercado_id','setor_id','status_id','fase_pipeline_id']
  }),

  usuarios: new BaseModel({
    table: 'usuarios',
    nameField: 'nome_usuario',
    insertable: ['nome_usuario','email','funcao_id','perfil_id','status_id','ultimo_acesso','senha_acesso','foto_avatar'],
    updatable:  ['nome_usuario','email','funcao_id','perfil_id','status_id','ultimo_acesso','senha_acesso','foto_avatar']
  }),

  documentos_oportunidade: new BaseModel({
    table: 'documentos_oportunidade',
    nameField: 'nome_arquivo',
    insertable: ['oportunidade_id','nome_arquivo','caminho_arquivo','tipo_arquivo','data_upload','usuario_id','observacoes'],
    updatable:  ['oportunidade_id','nome_arquivo','caminho_arquivo','tipo_arquivo','data_upload','usuario_id','observacoes']
  }),

  grupo: new BaseModel({
    table: 'grupo',
    nameField: 'nome',
    insertable: ['oportunidade_id','nome','descricao'],
    updatable:  ['oportunidade_id','nome','descricao']
  }),

  lotes: new BaseModel({
    table: 'lotes',
    nameField: 'nome',
    insertable: ['oportunidade_id','nome','descricao','grupo_id'],
    updatable:  ['oportunidade_id','nome','descricao','grupo_id']
  }),

  itens: new BaseModel({
    table: 'itens',
    nameField: 'nome',
    insertable: ['lote_id','nome','descricao','quantidade','unidade_id','valor_unitario'],
    updatable:  ['lote_id','nome','descricao','quantidade','unidade_id','valor_unitario']
  }),

  inteligencia_negocio: new BaseModel({
    table: 'inteligencia_negocio',
    nameField: 'vencedor',
    insertable: ['oportunidade_id','vencedor','cnpj_vencedor','posicao_empresa','valor_adjudicado','valor_lance_vencedor','reducao','numero_participantes','caminho_pasta','item_id'],
    updatable:  ['oportunidade_id','vencedor','cnpj_vencedor','posicao_empresa','valor_adjudicado','valor_lance_vencedor','reducao','numero_participantes','caminho_pasta','item_id']
  }),

  oportunidade_categoria: new BaseModel({
    table: 'oportunidade_categoria',
    idField: 'oportunidade_id',
    nameField: null,
    insertable: ['oportunidade_id','categoria_id'],
    updatable:  ['categoria_id']
  }),

  perfis_permissoes: new BaseModel({
    table: 'perfis_permissoes',
    idField: 'perfil_id',
    nameField: null,
    insertable: ['perfil_id','permissao_id'],
    updatable:  ['permissao_id']
  }),

  pareceres: new BaseModel({
    table: 'pareceres',
    nameField: null,
    insertable: ['oportunidade_id','tipo_parecer_id','responsavel_id','decisao_id','motivo_id','status_id','observacoes','forcas','fraquezas','oportunidades','ameacas','data_criacao'],
    updatable:  ['oportunidade_id','tipo_parecer_id','responsavel_id','decisao_id','motivo_id','status_id','observacoes','forcas','fraquezas','oportunidades','ameacas','data_criacao']
  }),

  projetos: new BaseModel({
    table: 'projetos',
    nameField: 'nome_projeto',
    insertable: ['orgao_id','uf','macro_regiao_id','regiao_comercial_id','nome_projeto','descricao','tipo_comercial_id','tipo_contratacao_id','temperatura_id','data_inicio','data_fim','valor_global','valor_mensal'],
    updatable:  ['orgao_id','uf','macro_regiao_id','regiao_comercial_id','nome_projeto','descricao','tipo_comercial_id','tipo_contratacao_id','temperatura_id','data_inicio','data_fim','valor_global','valor_mensal']
  }),

  questionamentos: new BaseModel({
    table: 'questionamentos',
    nameField: 'questao',
    insertable: ['oportunidade_id','questao','resposta'],
    updatable:  ['oportunidade_id','questao','resposta']
  })
};
*/

// src/entities.js
import BaseModel from '../models/baseModel.js';
import { beforeInsertLote, beforeUpdateLote } from '../validators/lotes.validator.js';

const simpleNamed = (table) =>
  new BaseModel({
    table,
    idField: 'id',
    nameField: 'nome',
    insertable: ['nome'],
    updatable: ['nome']
  });

export const entities = {
  categorias: simpleNamed('categorias'),
  decisoes_parecer: simpleNamed('decisoes_parecer'),
  esferas_administrativas: simpleNamed('esferas_administrativas'),
  tipos_orgao: simpleNamed('tipos_orgao'),
  status_orgao: simpleNamed('status_orgao'),
  modalidades: simpleNamed('modalidades'),
  portais_compra: new BaseModel({
    table: 'portais_compra',
    nameField: 'nome',
    insertable: ['nome', 'url'],
    updatable: ['nome', 'url']
  }),
  mercados: simpleNamed('mercados'),
  setores: simpleNamed('setores'),
  status_oportunidade: simpleNamed('status_oportunidade'),
  fases_pipeline: simpleNamed('fases_pipeline'),
  funcoes: simpleNamed('funcoes'),
  perfis_acesso: simpleNamed('perfis_acesso'),
  status_usuario: simpleNamed('status_usuario'),
  unidades: new BaseModel({
    table: 'unidades',
    nameField: 'sigla',
    insertable: ['sigla', 'descricao'],
    updatable: ['sigla', 'descricao']
  }),
  motivos_parecer: new BaseModel({
    table: 'motivos_parecer',
    nameField: 'descricao',
    insertable: ['descricao'],
    updatable: ['descricao']
  }),
  tipos_parecer: simpleNamed('tipos_parecer'),
  status_parecer: simpleNamed('status_parecer'),
  permissoes: simpleNamed('permissoes'),
  regioes: simpleNamed('regioes'),
  tipos_regiao_com: simpleNamed('tipos_regiao_com'),
  tipos_comercial: simpleNamed('tipos_comercial'),
  tipos_contratacao: simpleNamed('tipos_contratacao'),
  tipos_temperatura: simpleNamed('tipos_temperatura'),

  orgaos_publicos: new BaseModel({
    table: 'orgaos_publicos',
    nameField: 'nome',
    insertable: ['nome','sigla','cnpj','esfera_adm_id','tipo_orgao_id','email_institucional','telefone_geral','site_oficial','nome_responsavel','email_responsavel','telefone_responsavel','status_orgao_id','logo_orgao'],
    updatable:  ['nome','sigla','cnpj','esfera_adm_id','tipo_orgao_id','email_institucional','telefone_geral','site_oficial','nome_responsavel','email_responsavel','telefone_responsavel','status_orgao_id','logo_orgao']
  }),

  oportunidades: new BaseModel({
    table: 'oportunidades',
    nameField: 'objeto',
    insertable: ['numero_processo','uasg','orgao_id','uf','modalidade_id','portal_id','data_abertura','data_entrega','objeto','esfera_id','mercado_id','setor_id','status_id','fase_pipeline_id'],
    updatable:  ['numero_processo','uasg','orgao_id','uf','modalidade_id','portal_id','data_abertura','data_entrega','objeto','esfera_id','mercado_id','setor_id','status_id','fase_pipeline_id']
  }),

  usuarios: new BaseModel({
    table: 'usuarios',
    nameField: 'nome_usuario',
    insertable: ['nome_usuario','email','funcao_id','perfil_id','status_id','ultimo_acesso','senha_acesso','foto_avatar'],
    updatable:  ['nome_usuario','email','funcao_id','perfil_id','status_id','ultimo_acesso','senha_acesso','foto_avatar']
  }),

  documentos_oportunidade: new BaseModel({
    table: 'documentos_oportunidade',
    nameField: 'nome_arquivo',
    insertable: ['oportunidade_id','nome_arquivo','caminho_arquivo','tipo_arquivo','data_upload','usuario_id','observacoes'],
    updatable:  ['oportunidade_id','nome_arquivo','caminho_arquivo','tipo_arquivo','data_upload','usuario_id','observacoes']
  }),

  grupo: new BaseModel({
    table: 'grupo',
    nameField: 'nome',
    insertable: ['oportunidade_id','nome','descricao'],
    updatable:  ['oportunidade_id','nome','descricao']
  }),

  lotes: new BaseModel({
    table: 'lotes',
    nameField: 'nome',
    insertable: ['oportunidade_id','nome','descricao','grupo_id'],
    updatable:  ['oportunidade_id','nome','descricao','grupo_id'],
    hooks: {
      beforeInsert: beforeInsertLote,
      beforeUpdate: beforeUpdateLote
    }
  }),

  itens: new BaseModel({
    table: 'itens',
    nameField: 'nome',
    insertable: ['lote_id','nome','descricao','quantidade','unidade_id','valor_unitario'],
    updatable:  ['lote_id','nome','descricao','quantidade','unidade_id','valor_unitario']
  }),

  inteligencia_negocio: new BaseModel({
    table: 'inteligencia_negocio',
    nameField: 'vencedor',
    insertable: ['oportunidade_id','vencedor','cnpj_vencedor','posicao_empresa','valor_adjudicado','valor_lance_vencedor','reducao','numero_participantes','caminho_pasta','item_id'],
    updatable:  ['oportunidade_id','vencedor','cnpj_vencedor','posicao_empresa','valor_adjudicado','valor_lance_vencedor','reducao','numero_participantes','caminho_pasta','item_id']
  }),

  oportunidade_categoria: new BaseModel({
    table: 'oportunidade_categoria',
    idField: 'oportunidade_id',
    nameField: null,
    insertable: ['oportunidade_id','categoria_id'],
    updatable:  ['categoria_id']
  }),

  perfis_permissoes: new BaseModel({
    table: 'perfis_permissoes',
    idField: 'perfil_id',
    nameField: null,
    insertable: ['perfil_id','permissao_id'],
    updatable:  ['permissao_id']
  }),

  pareceres: new BaseModel({
    table: 'pareceres',
    nameField: null,
    insertable: ['oportunidade_id','tipo_parecer_id','responsavel_id','decisao_id','motivo_id','status_id','observacoes','forcas','fraquezas','oportunidades','ameacas','data_criacao'],
    updatable:  ['oportunidade_id','tipo_parecer_id','responsavel_id','decisao_id','motivo_id','status_id','observacoes','forcas','fraquezas','oportunidades','ameacas','data_criacao']
  }),

  projetos: new BaseModel({
    table: 'projetos',
    nameField: 'nome_projeto',
    insertable: ['orgao_id','uf','macro_regiao_id','regiao_comercial_id','nome_projeto','descricao','tipo_comercial_id','tipo_contratacao_id','temperatura_id','data_inicio','data_fim','valor_global','valor_mensal'],
    updatable:  ['orgao_id','uf','macro_regiao_id','regiao_comercial_id','nome_projeto','descricao','tipo_comercial_id','tipo_contratacao_id','temperatura_id','data_inicio','data_fim','valor_global','valor_mensal']
  }),

  questionamentos: new BaseModel({
    table: 'questionamentos',
    nameField: 'questao',
    insertable: ['oportunidade_id','questao','resposta'],
    updatable:  ['oportunidade_id','questao','resposta']
  })
};
