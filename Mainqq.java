package cn.gdyzy.main;

import cn.gdyzy.main.Person.MyInnerClass;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Student student=new Student();
//		student.eat();
//		Person person=new Student();	//��̬�Ե�Ӧ��
//		person.eat();
//		person=new Sickman();
//		person.eat();
//		person=new Person();
//		person.eat();
		Person person=new Person();
		person.eat();
		person.new MyInnerClass().show();
		MyInnerClass myInnerClass=new Person().new MyInnerClass();	//����һ��ʵ�����ڲ������
		myInnerClass.show();
	}

}

//��̬���ص㣺ͨ������Ķ�����������ĳ�Ա��
//��̬�Ե����ã���ߴ���ĸ����ʡ�����չ�Ժʹ����ά���ԣ����ϼ��ݣ�

//�ڲ��ࣺ�����ж�����ࣻ���ࣺ�ڲ��ࡢ�����ڲ���
//���Ҫ���ⲿ���з����ڲ���ĳ�Ա1������ͨ���ڲ������ڵ��ഴ���ڲ�����������ʣ�
//2�����ⲿ���У�����ͨ���ڲ������ڵ���Ķ���ֱ�ӷ����ڲ���ķ�����������Ҫ�ȴ�������Ķ���
class Person {
	private int age;
	
	public void eat() {
//		System.out.println("Person eatting..");
		test(new MyInter() {
			
			@Override
			public void test() {
				// TODO Auto-generated method stub
				System.out.println("MyInterface");
			}
		});
	}
	
	//�ڲ��������
	public class MyInnerClass{
		private String nameString;
		public void show() {
			System.out.println("InnerClass");
		}
		public String getNameString() {
			return nameString;
		}
		public void setNameString(String nameString) {
			this.nameString = nameString;
		}
	}
	
	public void test(MyInter innerClass) {
		innerClass.test();
	}
}

class Student extends Person{
	public void eat() {
		System.out.println("Student eatting..");
	}
}

class Sickman extends Person{
	public void eat() {
		System.out.println("Sickman eatting..");
	}
}

interface MyInter{
	void test();
}







