// src/models/baseModel.js
/*import { pool } from '../db.js';

// Quota identificadores MySQL com crase sem usar template literal por dentro.
// Também duplica crases internas (pouco comum, mas seguro).
const q = (s) => '`' + String(s).replace(/`/g, '``') + '`';

export default class BaseModel {
  constructor({ table, idField = 'id', nameField = null, insertable = [], updatable = [] }) {
    this.table = table;
    this.idField = idField;
    this.nameField = nameField;
    this.insertable = insertable;
    this.updatable = updatable;
  }

  async count() {
    const [rows] = await pool.query(`SELECT COUNT(*) AS total FROM ${q(this.table)}`);
    return rows[0].total;
  }

  async findAll() {
    const [rows] = await pool.query(`SELECT * FROM ${q(this.table)}`);
    return rows;
  }

  async findById(id) {
    const [rows] = await pool.query(
      `SELECT * FROM ${q(this.table)} WHERE ${q(this.idField)} = ?`,
      [id]
    );
    return rows[0] || null;
  }

  async findByName(qstr) {
    if (!this.nameField) throw new Error('findByName não suportado para esta entidade.');
    const [rows] = await pool.query(
      `SELECT * FROM ${q(this.table)} WHERE ${q(this.nameField)} LIKE ?`,
      [`%${qstr}%`]
    );
    return rows;
  }

  async create(payload) {
    const cols = this.insertable.filter((c) => payload[c] !== undefined);
    if (cols.length === 0) throw new Error('Nenhum campo válido para inserir.');

    const vals = cols.map((c) => payload[c]);
    const placeholders = cols.map(() => '?').join(', ');
    const colsSql = cols.map((c) => q(c)).join(', ');

    const sql = `INSERT INTO ${q(this.table)} (${colsSql}) VALUES (${placeholders})`;
    const [res] = await pool.query(sql, vals);
    return { [this.idField]: res.insertId, ...payload };
  }

  async update(id, payload) {
    const cols = this.updatable.filter((c) => payload[c] !== undefined);
    if (cols.length === 0) throw new Error('Nenhum campo válido para atualizar.');

    const vals = cols.map((c) => payload[c]);
    const sets = cols.map((c) => `${q(c)} = ?`).join(', ');

    const sql = `UPDATE ${q(this.table)} SET ${sets} WHERE ${q(this.idField)} = ?`;
    const [res] = await pool.query(sql, [...vals, id]);
    return res.affectedRows > 0;
  }

  async delete(id) {
    const [res] = await pool.query(
      `DELETE FROM ${q(this.table)} WHERE ${q(this.idField)} = ?`,
      [id]
    );
    return res.affectedRows > 0;
  }
}
*/

// src/models/baseModel.js
import { pool } from '../db.js';

// Quota identificadores MySQL com crase sem usar template literal por dentro.
// Também duplica crases internas (pouco comum, mas seguro).
const q = (s) => '`' + String(s).replace(/`/g, '``') + '`';

export default class BaseModel {
  constructor({ table, idField = 'id', nameField = null, insertable = [], updatable = [], hooks = {} }) {
    this.table = table;
    this.idField = idField;
    this.nameField = nameField;
    this.insertable = insertable;
    this.updatable = updatable;
    this.hooks = hooks; // { beforeInsert?: fn, beforeUpdate?: fn }
  }

  async count() {
    const [rows] = await pool.query(`SELECT COUNT(*) AS total FROM ${q(this.table)}`);
    return rows[0].total;
  }

  async findAll() {
    const [rows] = await pool.query(`SELECT * FROM ${q(this.table)}`);
    return rows;
  }

  async findById(id) {
    const [rows] = await pool.query(
      `SELECT * FROM ${q(this.table)} WHERE ${q(this.idField)} = ?`,
      [id]
    );
    return rows[0] || null;
  }

  async findByName(qstr) {
    if (!this.nameField) throw new Error('findByName não suportado para esta entidade.');
    const [rows] = await pool.query(
      `SELECT * FROM ${q(this.table)} WHERE ${q(this.nameField)} LIKE ?`,
      [`%${qstr}%`]
    );
    return rows;
  }

  async create(payload) {
    if (this.hooks?.beforeInsert) {
      await this.hooks.beforeInsert(payload, { pool, model: this });
    }

    const cols = this.insertable.filter((c) => payload[c] !== undefined);
    if (cols.length === 0) throw new Error('Nenhum campo válido para inserir.');

    const vals = cols.map((c) => payload[c]);
    const placeholders = cols.map(() => '?').join(', ');
    const colsSql = cols.map((c) => q(c)).join(', ');

    const sql = `INSERT INTO ${q(this.table)} (${colsSql}) VALUES (${placeholders})`;
    const [res] = await pool.query(sql, vals);
    return { [this.idField]: res.insertId, ...payload };
  }

  async update(id, payload) {
    if (this.hooks?.beforeUpdate) {
      await this.hooks.beforeUpdate({ id, payload }, { pool, model: this });
    }

    const cols = this.updatable.filter((c) => payload[c] !== undefined);
    if (cols.length === 0) throw new Error('Nenhum campo válido para atualizar.');

    const vals = cols.map((c) => payload[c]);
    const sets = cols.map((c) => `${q(c)} = ?`).join(', ');

    const sql = `UPDATE ${q(this.table)} SET ${sets} WHERE ${q(this.idField)} = ?`;
    const [res] = await pool.query(sql, [...vals, id]);
    return res.affectedRows > 0;
  }

  async delete(id) {
    const [res] = await pool.query(
      `DELETE FROM ${q(this.table)} WHERE ${q(this.idField)} = ?`,
      [id]
    );
    return res.affectedRows > 0;
  }
}
