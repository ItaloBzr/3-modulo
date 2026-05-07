package com.lucas.bancodedadossqlite.controller;

import android.content.ContentValues;
import android.content.Context;
import android.util.Log;

import com.lucas.bancodedadossqlite.api.AppUtil;
import com.lucas.bancodedadossqlite.datamodel.ProdutoDataModel;
import com.lucas.bancodedadossqlite.datasource.AppDataBase;
import com.lucas.bancodedadossqlite.model.ProdutoModel;

import java.util.ArrayList;
import java.util.List;

public class ProdutoController extends AppDataBase implements iCrud<ProdutoModel> {

    ContentValues dadosObjeto;

    public ProdutoController(Context context) {
        super(context);
        Log.i(AppUtil.TAG, "ProdutoController: Conectado ao banco");
    }


    @Override
    public boolean incluir(ProdutoModel obj) {
        dadosObjeto = new ContentValues();

        dadosObjeto.put(ProdutoDataModel.NOME, obj.getNomeProduto());
        dadosObjeto.put(ProdutoDataModel.FORNECEDOR, obj.getFornecedor());
        return insert(ProdutoDataModel.TABELA, dadosObjeto);
    }

    @Override
    public boolean alterar(ProdutoModel obj) {
        dadosObjeto = new ContentValues();

        dadosObjeto.put(ProdutoDataModel.ID, obj.getIdProduto());
        dadosObjeto.put(ProdutoDataModel.NOME, obj.getNomeProduto());
        dadosObjeto.put(ProdutoDataModel.FORNECEDOR, obj.getFornecedor());
        return insert(ProdutoDataModel.TABELA, dadosObjeto);
    }

    @Override
    public boolean deletar(ProdutoModel obj) {
        dadosObjeto = new ContentValues();

        dadosObjeto.put(ProdutoDataModel.ID, obj.getIdProduto());
        return insert(ProdutoDataModel.TABELA, dadosObjeto);
    }

    @Override
    public List<ProdutoModel> listar() {
        List<ProdutoModel> lista = new ArrayList<>();
        return lista;
    }
}
