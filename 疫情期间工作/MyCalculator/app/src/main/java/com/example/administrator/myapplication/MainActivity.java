package com.example.administrator.myapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    Button button[]=new Button[19];
    EditText editText;
    double num,sum=0,sum1;
    double product=1;
    String tag="";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        button[0]=(Button)findViewById(R.id.button29);      //获取所有按钮对象
        button[1]=(Button)findViewById(R.id.button24);
        button[2]=(Button)findViewById(R.id.button25);
        button[3]=(Button)findViewById(R.id.button26);
        button[4]=(Button)findViewById(R.id.button20);
        button[5]=(Button)findViewById(R.id.button21);
        button[6]=(Button)findViewById(R.id.button22);
        button[7]=(Button)findViewById(R.id.button16);
        button[8]=(Button)findViewById(R.id.button17);
        button[9]=(Button)findViewById(R.id.button18);
        button[10]=(Button)findViewById(R.id.button27);
        button[11]=(Button)findViewById(R.id.button23);
        button[12]=(Button)findViewById(R.id.button19);
        button[13]=(Button)findViewById(R.id.button15);
        button[14]=(Button)findViewById(R.id.button33);
        button[15]=(Button)findViewById(R.id.button32);
        button[16]=(Button)findViewById(R.id.button11);
        button[17]=(Button)findViewById(R.id.button12);
        button[18]=(Button)findViewById(R.id.button13);
        for(int i=0;i<button.length;i++){
            button[i].setOnClickListener(new MyCalculator());   //给所有按钮注册监听
        }
        editText=(EditText)findViewById(R.id.editText3);
    }

    //内部类实现监听器
    public class MyCalculator implements View.OnClickListener{

        @Override
        public void onClick(View view) {
            //判断按的是哪个按钮
            switch (view.getId()){
                case R.id.button29:
                    editText.append("0");   //追加显示以满足多位数及小数运算
                    break;
                case R.id.button24:
                    editText.append("1");
                    break;
                case R.id.button25:
                    editText.append("2");
                    break;
                case R.id.button26:
                    editText.append("3");
                    break;
                case R.id.button20:
                    editText.append("4");
                    break;
                case R.id.button21:
                    editText.append("5");
                    break;
                case R.id.button22:
                    editText.append("6");
                    break;
                case R.id.button16:
                    editText.append("7");
                    break;
                case R.id.button17:
                    editText.append("8");
                    break;
                case R.id.button18:
                    editText.append("9");
                    break;
                case R.id.button27:
                    num=Double.valueOf(editText.getText().toString());  //获取editText的数字值
                    editText.setText("");
                    sum+=num;       //运算
                    tag="+";        //标志位设置，用于=的运算判断
                    break;
                case R.id.button23:
                    num=Double.valueOf(editText.getText().toString());
                    editText.setText("");
                    sum=num;
                    tag="-";
                    break;
                case R.id.button19:
                    num=Double.valueOf(editText.getText().toString());
                    editText.setText("");
                    product*=num;
                    tag="x";
                    break;
                case R.id.button15:
                    num=Double.valueOf(editText.getText().toString());
                    editText.setText("");
                    product=num;
                    tag="÷";
                    break;
                case R.id.button13:
                    num=Double.valueOf(editText.getText().toString());
                    editText.setText("");
                    product=num;
                    tag="%";
                    break;
                case R.id.button33:
                    num=Double.valueOf(editText.getText().toString());  //获取editText的数值
                    //判断需要进行的运算类型
                    if(tag.equals("+")){
                        sum+=num;
                        editText.setText(""+sum);
                        sum=0;
                    }else if(tag.equals("-")){
                        sum-=num;
                        editText.setText(""+sum);
                        sum=0;
                    }else if(tag.equals("x")){
                        product*=num;
                        editText.setText(""+product);
                        product=1;
                    }else if(tag.equals("÷")){
                        product/=num;
                        editText.setText(""+product);
                        product=1;
                    }else if(tag.equals("%")){
                        product%=num;
                        editText.setText(""+product);
                        product=1;
                    }
                    break;
                case R.id.button32:
                    editText.append(".");
                    break;
                case R.id.button11:
                    editText.setText("");   //清空显示
                    product=1;
                    sum=0;
                    break;
                case R.id.button12:
                    editText.setText(editText.getText().toString().substring(0,editText.getText().toString().length()-1));
                    break;
            }
        }
    }
}
