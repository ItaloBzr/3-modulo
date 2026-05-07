package com.lucas.bancodedadossqlite.datasource;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import androidx.annotation.Nullable;

import com.lucas.bancodedadossqlite.api.AppUtil;
import com.lucas.bancodedadossqlite.controller.ProdutoController;
import com.lucas.bancodedadossqlite.datamodel.ClienteDataModel;
import com.lucas.bancodedadossqlite.datamodel.ProdutoDataModel;

public class AppDataBase extends SQLiteOpenHelper {

    public static final String DB_NAME = "Loja.sqlite";
    public static int version = 1;

    SQLiteDatabase db;

    public AppDataBase(Context context) {
        super(context, DB_NAME, null, version);
        Log.i(AppUtil.TAG, "AppDataBase: Criando Banco");

        db = getReadableDatabase();
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(ClienteDataModel.criarTabela());
        Log.i(AppUtil.TAG, "onCreate: ClienteDataModel ");

        db.execSQL(ProdutoDataModel.criarTabela());
        Log.i(AppUtil.TAG, "onCreate: ProdutoDataModel ");

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

    }

    /**
    *metodo para incluir registros no banco de dados
    *@return
    */
    public boolean insert(String tabela, ContentValues dados ) {
        db = getReadableDatabase();

        boolean retorno = false;
        try{
            retorno = db.insert(tabela, null, dados) > 0;
        } catch (Exception e) {
            Log.i(AppUtil.TAG, "insert: "+ e.getMessage());
        }
        return retorno;
    }
}
