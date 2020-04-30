
import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class MyFrame implements ActionListener{
	private JPanel panel=new JPanel();
	private JButton btn[]=new JButton[18];
	static JTextField text=new JTextField("",21);
	
	protected void makebutton(int index,String name,GridBagLayout gridbag,GridBagConstraints c) {
		btn[index] = new JButton(name);
		gridbag.setConstraints(btn[index], c);
		panel.add(btn[index]);
	}

	MyFrame(){
		JFrame frame=new JFrame("计算器");
		GridBagLayout gridbag = new GridBagLayout();
        GridBagConstraints c = new GridBagConstraints();

		text.setEditable(false);
		panel.setLayout(gridbag);
		
		frame.add(panel,BorderLayout.CENTER);
		frame.add(text,BorderLayout.NORTH);
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);
		frame.setSize(350, 200);
		frame.setDefaultCloseOperation(frame.EXIT_ON_CLOSE);
		
		c.fill = GridBagConstraints.BOTH;
        c.weightx = 1.0;
        makebutton(0,"1", gridbag, c);
        makebutton(1,"2", gridbag, c);
        makebutton(2,"3", gridbag, c);
        c.gridwidth = GridBagConstraints.REMAINDER; //end row
        makebutton(3,"+", gridbag, c);
        
        c.gridwidth = 1;                  //another row
        makebutton(4,"4", gridbag, c); 
        makebutton(5,"5", gridbag, c);
        makebutton(6,"6", gridbag, c);
        c.gridwidth = GridBagConstraints.REMAINDER; //end row
        makebutton(7,"-", gridbag, c);
        
        c.gridwidth = 1;                  //another row
        makebutton(8,"7", gridbag, c); 
        makebutton(9,"8", gridbag, c);
        makebutton(10,"9", gridbag, c);
        c.gridwidth = GridBagConstraints.REMAINDER; //end row
        makebutton(11,"*", gridbag, c);
        
        c.gridwidth = 1;                //another row
        c.gridheight = 0;
        c.weighty = 0.0;
        makebutton(12,"清除", gridbag, c);
        makebutton(13,"退格", gridbag, c);
        c.gridheight = 1;
        c.weighty = 2.0;
        makebutton(14,"0", gridbag, c);
        c.gridwidth = GridBagConstraints.REMAINDER;
        makebutton(15,"/", gridbag, c);
        c.weighty = 0.0;
        c.gridwidth = 1;
        c.gridheight = 0;
        makebutton(16,".", gridbag, c);
        makebutton(17,"=", gridbag, c);

		for (int i = 0; i < btn.length; i++) {
			btn[i].addActionListener(this);
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new MyFrame();
	}
	
	double sum=0;
	ArrayList<Object> numArrayList=new ArrayList<Object>();
	String operator;
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		String cmd=e.getActionCommand();
		String c=text.getText();
		try{
			if(((cmd.compareTo("0") >= 0 && cmd.compareTo("9") <= 0)||cmd.equals("."))){
				text.setText(c+cmd);
			}else if(cmd.equals("+")||cmd.equals("-")||cmd.equals("*")||cmd.equals("/")){
				numArrayList.add(Double.parseDouble(text.getText()));
				text.setText("");
				operator=cmd;
			}else if(cmd.equals("=")){
				numArrayList.add(Double.parseDouble(text.getText()));
				if(operator.equals("+")) {
					for (Object object : numArrayList) {
						sum+=(Double)object;
					}
				}else if(operator.equals("-")){
					sum=(double)numArrayList.get(0)*2;
					for (Object object : numArrayList) {
						sum-=(double)object;
					}
				}else if (operator.equals("*")) {
					sum=1;
					for (Object object : numArrayList) {
						sum*=(Double)object;
					}
				}else if (operator.equals("/")) {
					sum=(double)numArrayList.get(0)*(double)numArrayList.get(0);
					for (Object object : numArrayList) {
						sum/=(double)object;
					}
				}
				numArrayList.clear();
				text.setText(String.valueOf(sum));
				sum=0;
			}else if(cmd.equals("清除")){
				text.setText("");
				numArrayList.clear();
				sum=0;
			}else if(cmd.equals("退格")){
				int length=text.getText().length();
				text.setText(text.getText().substring(0, --length));
			}
		}catch(Exception E){
			JOptionPane.showMessageDialog(null,"输入错误！");
		}
  	}
}
