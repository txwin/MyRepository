package com.example.administrator.myapplication;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;

import static android.widget.Toast.LENGTH_LONG;


/**
 * Created by x520g_000 on 2018-10-13.
 */

public class HobbyDialog extends Dialog{

    public interface DataBackListener{
        public void getData(String data);
    }
    private CheckBox myitem_0;
    private CheckBox myitem_1;
    private CheckBox myitem_2;
    private CheckBox myitem_3;
    private CheckBox myitem_4;
    private CheckBox myitem_5;
    private Button myenter_btn;
    private Button mycancel_btn;
    private EditText mytext;
    DataBackListener listener;  //临听事件

    String selHobby = "";

    private String[] hobby={"","","","","",""};


    public HobbyDialog(Context context,final DataBackListener listener) {
        super(context);
        this.listener = listener;
        setContentView(R.layout.myhobby_layout);

        myitem_0=findViewById(R.id.item0);
        myitem_1=findViewById(R.id.item1);
        myitem_2=findViewById(R.id.item2);
        myitem_3=findViewById(R.id.item3);
        myitem_4=findViewById(R.id.item4);
        myitem_5=findViewById(R.id.item5);
        myenter_btn=findViewById(R.id.enter_btn);
        mycancel_btn=findViewById(R.id.cancel_btn);

        myitem_0.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked)     hobby[0]= (String) myitem_0.getText();
                else hobby[0]="";
            }
        });
        myitem_1.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked)     hobby[1]= (String) myitem_1.getText();
                else hobby[1]="";
            }
        });
        myitem_2.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked)     hobby[2]= (String) myitem_2.getText();
                else hobby[2]="";
            }
        });
        myitem_3.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked)     hobby[3]= (String) myitem_3.getText();
                else hobby[3]="";
            }
        });
        myitem_4.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked)     hobby[4]= (String) myitem_4.getText();
                else hobby[4]="";
            }
        });
        myitem_5.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked)     hobby[5]= (String) myitem_5.getText();
                else hobby[5]="";
            }
        });

        myenter_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                selHobby="";
                for(int i=0; i<hobby.length;i++){
                    if(hobby[i].length()!=0) selHobby = selHobby +" " + hobby[i];
                }
                listener.getData(selHobby);
                dismiss();
            }
        });
        mycancel_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dismiss();
            }
        });
    }

}
