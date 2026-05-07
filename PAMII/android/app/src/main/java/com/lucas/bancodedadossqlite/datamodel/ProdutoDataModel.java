package com.lucas.bancodedadossqlite.datamodel;

import android.util.Log;

import com.lucas.bancodedadossqlite.api.AppUtil;

public class ProdutoDataModel {
    
    public static final String TABELA = "produto";
    public static final String ID = "id";
    public static final String NOME = "nome";
    public static final String FORNECEDOR = "fornecedor";

    public static String queryCriarTabela = "";

    public static String criarTabela() {
        queryCriarTabela = "CREATE TABLE IF NOT EXISTS " + TABELA + "(";
        queryCriarTabela += ID         + " INTEGER PRIMARY KEY AUTOINCREMENT, ";
        queryCriarTabela += NOME       + " TEXT NOT NULL, ";
        queryCriarTabela += FORNECEDOR + " TEXT NOT NULL ";
        queryCriarTabela += ")";

        Log.i(AppUtil.TAG, "criarTabelaProduto: " + queryCriarTabela);

        return queryCriarTabela;
    }
}
