package com.example.administrator.myapplication;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends Activity {

    private EditText my_usrname;
    private EditText my_psw;
    private Button my_loginbtn;
    private Button my_regbtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.mymain_layout);

        my_usrname = findViewById(R.id.username);
        my_psw = findViewById(R.id.password);
        my_loginbtn = findViewById(R.id.loginbtn);
        my_regbtn = findViewById(R.id.regbtn);

        my_loginbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                    loginsucess();
            }
        });

        my_regbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                registProcess();
            }
        });
    }

    private void loginsucess(){
        if((my_psw.getText().toString().equals("1111")) && (my_usrname.getText().toString().equals("guan"))){
            AlertDialog dialog;
            dialog = new AlertDialog.Builder(this).setMessage("登录成功").create();
            dialog.show();
        }
        else{
            AlertDialog dialog;
            dialog = new AlertDialog.Builder(this).setMessage("登录不成功").create();
            dialog.show();
        }

    }

    private void registProcess(){
        // Intent intent = new Intent(this,RegActivity.class);
       Intent intent = new Intent(this,MyRegActivity.class);
        startActivity(intent);
    }


}
