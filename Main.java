package cn.gdyzy.main;

import cn.gdyzy.main.Person.MyInnerClass;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Student student=new Student();
//		student.eat();
//		Person person=new Student();	//多态性的应用
//		person.eat();
//		person=new Sickman();
//		person.eat();
//		person=new Person();
//		person.eat();
		Person person=new Person();
		person.eat();
		person.new MyInnerClass().show();
		MyInnerClass myInnerClass=new Person().new MyInnerClass();	//创建一个实名的内部类对象
		myInnerClass.show();
	}

}

//多态性特点：通过父类的对象引用子类的成员；
//多态性的作用：提高代码的复用率、可扩展性和代码可维护性；向上兼容；

//内部类：在类中定义的类；分类：内部类、匿名内部类
//如果要在外部类中访问内部类的成员1、可以通过内部类所在的类创建内部类对象来访问；
//2、在外部类中，可以通过内部类所在的类的对象直接访问内部类的方法，但是需要先创建该类的对象；
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
	
	//内部类的声明
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







