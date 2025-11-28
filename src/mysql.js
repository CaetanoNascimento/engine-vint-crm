import mysql from 'mysql';

var pool = mysql.createPool({
    "connectionLimit" : 1000,
    "user": process.env.DB_USER,
    "password": process.env.DB_PASSWORD,
    "database": process.env.DB_DATABASE,
    "host": process.env.DB_HOST,
    "port": process.env.DB_PORT
});



// Use 'export const' para exportar a função nomeada
export const execute = (query, params=[]) => {
    return new Promise((resolve, reject) => {
        pool.query(query, params, (error, result, fields) => {
            if(error) {
                reject(error);
            } else {
                resolve(result);
            }
        });
    });
};

// Você pode manter a exportação padrão da pool se precisar dela em outro lugar
export default pool;