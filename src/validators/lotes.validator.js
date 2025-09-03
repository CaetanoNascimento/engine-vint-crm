// src/validators/lotes.validator.js
import { pool } from '../db.js';

/**
 * BEFORE INSERT em lotes:
 *  - Se grupo_id vier, garante que existe e que grupo.oportunidade_id === payload.oportunidade_id.
 */
export async function beforeInsertLote(payload /* {oportunidade_id, grupo_id, ...} */) {
  const { grupo_id, oportunidade_id } = payload || {};
  if (grupo_id == null) return; // criar sem grupo é permitido

  // grupo deve existir
  const [gr] = await pool.query('SELECT id, oportunidade_id FROM grupo WHERE id = ?', [grupo_id]);
  const grupo = gr[0];
  if (!grupo) {
    const err = new Error('grupo_id inválido');
    err.status = 400;
    throw err;
  }

  // coerência por oportunidade
  if (Number(grupo.oportunidade_id) !== Number(oportunidade_id)) {
    const err = new Error('grupo_id não pertence à mesma oportunidade do lote');
    err.status = 409;
    throw err;
  }
}

/**
 * BEFORE UPDATE em lotes:
 *  - Se grupo_id NÃO foi enviado => não valida.
 *  - Se grupo_id === null => desvincula (OK).
 *  - Se grupo_id numérico => valida como no insert, usando oportunidade atual do lote
 *    caso payload não traga oportunidade_id.
 */
export async function beforeUpdateLote({ id, payload }) {
  if (!payload || !('grupo_id' in payload)) return; // nada a validar
  const { grupo_id } = payload;

  // desvincular grupo
  if (grupo_id === null) return;

  // descobrir oportunidade do lote (se não veio no payload)
  let opId = payload.oportunidade_id;
  if (opId == null) {
    const [l] = await pool.query('SELECT oportunidade_id FROM lotes WHERE id = ?', [id]);
    if (!l[0]) {
      const err = new Error('Lote não encontrado para validação');
      err.status = 404;
      throw err;
    }
    opId = l[0].oportunidade_id;
  }

  // grupo deve existir
  const [gr] = await pool.query('SELECT id, oportunidade_id FROM grupo WHERE id = ?', [grupo_id]);
  const grupo = gr[0];
  if (!grupo) {
    const err = new Error('grupo_id inválido');
    err.status = 400;
    throw err;
  }

  if (Number(grupo.oportunidade_id) !== Number(opId)) {
    const err = new Error('grupo_id não pertence à mesma oportunidade do lote');
    err.status = 409;
    throw err;
  }
}
