package com.example.administrator.myapplication;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;

import static android.content.DialogInterface.*;

/**
 * Created by x520g_000 on 2018-10-8.
 */

public class RegActivity extends Activity{
    private Button my_regbtn;
    private Button my_selectbtn;
    private String[] hobby={"看书","唱歌","游戏","下棋","旅游","摄影"};
    private boolean[]selhobby={false,false,false,false,false};
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
        AlertDialog.Builder mulDialog;
        for(int i=0; i<hobby.length;i++)
            isSelected[i]=false;

        mulDialog = new AlertDialog.Builder(this).setTitle("你的爱好")
                .setMultiChoiceItems(hobby, null, new OnMultiChoiceClickListener() {

                    @Override
                    public void onClick(DialogInterface dialog, int which, boolean isChecked) {
                        if (which == 0 && isChecked) isSelected[0] = true;
                        if (which == 1 && isChecked) isSelected[1] = true;
                        if (which == 2 && isChecked) isSelected[2] = true;
                        if (which == 3 && isChecked) isSelected[3] = true;
                        if (which == 4 && isChecked) isSelected[4] = true;
                        if (which == 5 && isChecked) isSelected[5] = true;
                    }
                })
                .setPositiveButton("确定", new OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        selItem="";
                        selResult.setText("");
                        for(int i=0; i<hobby.length; i++)
                            if(isSelected[i])   selItem = selItem + " "+ hobby[i];
                       selResult.setText(selItem);
                    }
                })
                .setNegativeButton("取消", new OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                    }
                }) ;
        mulDialog.show();

    }
}
