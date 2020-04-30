package com.example.administrator.myapplication;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Looper;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class register extends AppCompatActivity {
    Button button;
    Button button_dialog;
    EditText editText;
    String style;
    int progress=0;
    boolean log[]=new boolean[]{false,false,false,false};
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        button=(Button)findViewById(R.id.button3);
        button_dialog=(Button)findViewById(R.id.button_dialog);
        editText=(EditText)findViewById(R.id.editText6);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final ProgressDialog progressDialog=new ProgressDialog(register.this);
                progressDialog.setTitle("QQ会员");
                progressDialog.setIcon(R.drawable.vip);
                progressDialog.setMessage("正在注册QQ会员，请等待...");
                progressDialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
                progressDialog.show();
                new Thread(){
                    @Override
                    public void run() {
                        super.run();
                        while(progress<100){
                            progress++;
                            try {
                                sleep(100);
                                progressDialog.setProgress(progress);
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                        }
                        progress=0;     //进度值置位
                        progressDialog.cancel();    //关闭进度对话框
                        Intent intent=new Intent(register.this,MainActivity.class);
                        startActivity(intent);
                        finish();
                        Looper.prepare();   //子线程不会创建Looper，要手动加入消息队列（makeText方法中会创建Handle）
                        Toast.makeText(getApplicationContext(),"注册成功！",Toast.LENGTH_SHORT).show();
                        Looper.loop();      //开始工作，之后的代码不会执行
                    }
                }.start();
            }
        });

        button_dialog.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                /*****单选对话框*******/
//                new AlertDialog.Builder(register.this).setTitle("个性签名")
//                        .setIcon(getResources().getDrawable(R.drawable.myicon)).setSingleChoiceItems(getResources().getStringArray(R.array.style), -1, new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialogInterface, int i) {
//                        style=getResources().getStringArray(R.array.style)[i];
//                    }
//                }).setPositiveButton("确定", new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialogInterface, int i) {
//                        editText.setText(style);
//                    }
//                }).setNegativeButton("退出",null).create().show();
                /*****多选对话框*******/
//                new AlertDialog.Builder(register.this).setTitle("个性签名")
//                        .setIcon(R.drawable.myicon).setMultiChoiceItems(getResources().getStringArray(R.array.style), log, new DialogInterface.OnMultiChoiceClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialogInterface, int i, boolean b) {
//                        log[i]=b;
//                    }
//                }).setPositiveButton("确定", new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialogInterface, int i) {
//                        editText.setText("");
//                        for(int x=0;x<getResources().getStringArray(R.array.style).length;x++){
//                            if(log[x]){
//                                editText.append(getResources().getStringArray(R.array.style)[x]+",");
//                            }
//                        }
//                    }
//                }).setNegativeButton("退出",null).create().show();
                /*****自定义对话框*******/
                Reg_style_Dialog regStyleDialog=new Reg_style_Dialog(register.this, new Reg_style_Dialog.Reg_style_Dialog_listener() {
                    @Override
                    public void getstyle(String[] style) {  //7重写getstyle（）方法
                        editText.setText("");
                        String Style="";
                        for(int i=0;i<style.length;i++){
                            Style+=style[i]+" ";
                        }
                        editText.setText(Style);
                    }
                });
                regStyleDialog.show();
            }
        });
    }
}
