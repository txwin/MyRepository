package com.pb.main;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;



public class Dom4j {

	public static Document doc;
	
	public static void main(String[] args) {
		loadDocument();
//		showPhoneInfo();
//		saveXML("src/���ղ�.xml");
//		addNewPhoneInfo();
//		updatePhoneInfo();
		deleteItem();
		showPhoneInfo();
	}

	public static void loadDocument(){
		try{
			SAXReader saxReader = new SAXReader();
			doc = saxReader.read(new File("src/�ղ���Ϣ.xml"));
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static void updatePhoneInfo(){
		// ��ȡXML�ĸ��ڵ�
		Element root = doc.getRootElement();
		int id = 0;
		for (Iterator itBrand = root.elementIterator(); itBrand.hasNext();) {
			Element brand = (Element) itBrand.next();
			id++;
			brand.addAttribute("id", id + "");
		}

		saveXML("src/�ղ���Ϣ.xml");

	}
	
	public static void deleteItem(){
		// ��ȡXML�ĸ��ڵ�
		Element root = doc.getRootElement();
		int id = 0;
		for (Iterator itBrand = root.elementIterator(); itBrand.hasNext();) {
			Element brand = (Element) itBrand.next();
			if (brand.attributeValue("name").equals("��Ϊ")) {
				brand.getParent().remove(brand);
			}
		}
//		saveXML("src/�ղ���Ϣ.xml");			
	}
	
	public static void showPhoneInfo() {
		// ��ȡXML�ĸ��ڵ�
		Element root = doc.getRootElement();
		// �������е�Brand��ǩ
		for (Iterator itBrand = root.elementIterator(); itBrand.hasNext();) {
			Element brand = (Element) itBrand.next();
			// �����ǩ��name����
			System.out.println("Ʒ�ƣ�" + brand.attributeValue("name"));
			// ����Type��ǩ
			for (Iterator itType = brand.elementIterator(); itType.hasNext();) {
				Element type = (Element) itType.next();
				// �����ǩ��name����
				System.out.println("\t�ͺţ�" + type.attributeValue("name"));
			}
		}

	}
	
	public static void saveXML(String path){
		try {
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("GBK"); // ָ��XML����
			XMLWriter writer;
			writer = new XMLWriter(new FileWriter(path), format);
			writer.write(doc);
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void addNewPhoneInfo(){
		// ��ȡXML�ĸ��ڵ�
		Element root = doc.getRootElement();
		// ����Brand��ǩ
		Element el = root.addElement("Brand");
		// ��Brand��ǩ��������
		el.addAttribute("name", "����");
		// ����Type��ǩ
		Element typeEl = el.addElement("Type");
		// ��Type��ǩ��������
		typeEl.addAttribute("name", "Note4");
		saveXML("src/�ղ���Ϣ.xml");
	}
}
