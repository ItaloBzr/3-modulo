package com.lucas.bancodedadossqlite.controller;

import android.content.ContentValues;
import android.content.Context;
import android.util.Log;

import com.lucas.bancodedadossqlite.api.AppUtil;
import com.lucas.bancodedadossqlite.datamodel.ClienteDataModel;
import com.lucas.bancodedadossqlite.datasource.AppDataBase;
import com.lucas.bancodedadossqlite.model.ClienteModel;


import java.util.ArrayList;
import java.util.List;

public class ClienteController extends AppDataBase implements iCrud<ClienteModel>{
    ContentValues dadosObjeto;

    public ClienteController(Context context) {
        super(context);
        Log.i(AppUtil.TAG, "ClienteController: Conectado ao banco");
    }

    @Override
    public boolean incluir(ClienteModel obj) {
        dadosObjeto = new ContentValues();

        dadosObjeto.put(ClienteDataModel.NOME, obj.getNome());
        dadosObjeto.put(ClienteDataModel.EMAIL, obj.getEmail());
        return insert(ClienteDataModel.TABELA, dadosObjeto);
    }

    @Override
    public boolean alterar(ClienteModel obj) {
        dadosObjeto = new ContentValues();

        dadosObjeto.put(ClienteDataModel.ID, obj.getId());
        dadosObjeto.put(ClienteDataModel.NOME, obj.getNome());
        dadosObjeto.put(ClienteDataModel.EMAIL, obj.getEmail());
        return insert(ClienteDataModel.TABELA, dadosObjeto);
    }

    @Override
    public boolean deletar(ClienteModel obj) {
        dadosObjeto = new ContentValues();

        dadosObjeto.put(ClienteDataModel.ID, obj.getId());
        return insert(ClienteDataModel.TABELA, dadosObjeto);
    }

    @Override
    public List<ClienteModel> listar(){
        List<ClienteModel> lista = new ArrayList<>();
        return lista;
    }
}
