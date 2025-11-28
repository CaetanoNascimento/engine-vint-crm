import { Router } from 'express';

const route = Router();

import  pool from '../mysql.js'

const mysql = pool

import  {execute}  from '../mysql.js';


import  bcrypt from 'bcrypt';


import jwt from 'jsonwebtoken';



route.post('/entrar',async (req, res, next) => {



    try {

        console.log('pelo menos entrou', req.body)
        const queryEmail = 'SELECT * FROM usuarios WHERE email = ?';

        const results = await execute(queryEmail, [req.body.email]);

        console.log(results)
        if (results.length < 1) {
            return res.status(409).send({ Mensagem: 'Não existe este email cadastrado' })
        }
     
                bcrypt.compare(req.body.senha_acesso, results[0].senha_acesso, (err, result) => {
                    if (err) {

                        return res.status(401).send({ mensagem: 'Falha na autenticação 2' })
                    }
                    if (result) {
                        let token = jwt.sign({
                            id_proprietario: results[0].id_proprietario,
                            Nome: results[0].nome,
                            email: results[0].email,
                            Cpf: results[0].cpf,
                            telefone: results[0].telefone

                        }, process.env.JWT_KEY,
                            {
                                expiresIn: "8h"
                            });
                        return res.status(200).send({
                            mensagem: 'Autenticado com sucesso',
                            usuario: results,
                            token: token
                        });
                    }
                    return res.status(401).send({ mensagem: 'Falha na autenticação 3' })
                });

            

    } catch (error) {

        console.log(error)
        return res.status(500).send({ error: error })
        
    }

})


route.post('/cadastro', async (req, res) => {
    try {

        console.log('pelo menos entrou', req.body)
        const queryEmail = 'SELECT * FROM usuarios WHERE email = ?';

        const results = await execute(queryEmail, [req.body.email]);

        console.log(results)
        if (results.length > 0) {
            return res.status(409).send({ Mensagem: 'Usuario já cadastrado' })
        }
        const hash = await bcrypt.hash(req.body.senha_acesso, 10);

        const query = 'INSERT INTO usuarios (nome_usuario, email, funcao_id, perfil_id, status_id, ultimo_acesso, senha_acesso) VALUES (?, ?, ?, ?, ?, ?,?)';
        const result = await execute(query,
            [
                req.body.nome_usuario,
                req.body.email,
                req.body.funcao_id,
                req.body.perfil_id,
                req.body.status_id,
                req.body.ultimo_acesso,
                hash,
            ])
        const response = {
            mensagem: 'usuario criado com sucesso',
        }

        return res.status(201).send(response);
    }
    catch (error) {

        console.log(error)
        return res.status(500).send({ Erro: error })
    }

});





export default route;
