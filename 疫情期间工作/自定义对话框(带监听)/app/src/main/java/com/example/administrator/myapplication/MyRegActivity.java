package com.example.administrator.myapplication;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

/**
 * Created by x520g_000 on 2018-10-13.
 */

public class MyRegActivity extends Activity {
    private Button my_regbtn;
    private Button my_selectbtn;
    private String hobby="";
   // private boolean[]selhobby={false,false,false,false,false};
    private  String selItem="";
    private EditText selResult;
    private boolean[] isSelected={false,false,false,false,false,false};

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.myreg_layout);

        my_regbtn=findViewById(R.id.reglayout_btn);
        my_selectbtn=findViewById(R.id.myselect_btn);
        selResult = findViewById(R.id.myhobby);

        my_regbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showRegMsg();
            }
        });

        my_selectbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showSelectDialog();
            }
        });

    }

    private void showRegMsg(){
        AlertDialog dialog;
        dialog = new AlertDialog.Builder(this).setMessage("注册成功").create();
        dialog.show();
    }

    private void showSelectDialog() {
        HobbyDialog mulDialog = new HobbyDialog(this,new HobbyDialog.DataBackListener() {
            public void getData(String data) {
                String result = data;
                selResult.setText(result);
            }
        });
        mulDialog.show();
    }
}
