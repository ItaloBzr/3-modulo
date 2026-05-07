package com.lucas.bancodedadossqlite.datamodel;

import android.util.Log;

import com.lucas.bancodedadossqlite.api.AppUtil;

public class ClienteDataModel {
    public static final String TABELA= "cliente";
    public static final String ID = "id";
    public static final String NOME = "nome";
    public static final String EMAIL = "email";

    public static String queryCriarTabela = "";

    public static String criarTabela(){
        queryCriarTabela = "CREATE TABLE IF NOT EXISTS " + TABELA + "(";
        queryCriarTabela += ID    + " INTEGER PRIMARY KEY AUTOINCREMENT, ";
        queryCriarTabela += NOME  + " TEXT NOT NULL, ";
        queryCriarTabela += EMAIL + " TEXT NOT NULL UNIQUE ";
        queryCriarTabela += ")";

        Log.i(AppUtil.TAG, "criarTabelaCliente: " + queryCriarTabela);

        return queryCriarTabela;
    }
}

