package com.pb.main;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class Main {

	public static Document doc;
	
	public static void main(String[] args) {
		deleteItem();
	}

	public static void updatePhoneInfo(){
		try {
			// 1���õ�DOM�������Ĺ���ʵ��
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			// 2����DOM�������DOM������
			DocumentBuilder db = dbf.newDocumentBuilder();
			// 3������XML�ĵ����õ�һ��Document����DOM��
			doc = db.parse("src/�ղ���Ϣ.xml");
			
			NodeList list = doc.getElementsByTagName("Brand");
			for(int i = 0; i < list.getLength(); i++){
				Element el = (Element) list.item(i);
				el.setAttribute("id", i+"");
			}
			
			saveXML("src/�ղ���Ϣ.xml");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static void deleteItem(){
		try {
			// 1���õ�DOM�������Ĺ���ʵ��
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			// 2����DOM�������DOM������
			DocumentBuilder db = dbf.newDocumentBuilder();
			// 3������XML�ĵ����õ�һ��Document����DOM��
			doc = db.parse("src/�ղ���Ϣ.xml");
			
			NodeList list = doc.getElementsByTagName("Brand");
			for(int i = 0; i < list.getLength(); i++){
				Element el = (Element) list.item(i);
				if(el.getAttribute("name").equals("��Ϊ")){
					el.getParentNode().removeChild(el);
				}
			}
			
			saveXML("src/�ղ���Ϣ.xml");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static void showPhoneInfo(){
		try {
			// 1���õ�DOM�������Ĺ���ʵ��
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			// 2����DOM�������DOM������
			DocumentBuilder db = dbf.newDocumentBuilder();
			// 3������XML�ĵ����õ�һ��Document����DOM��
			doc = db.parse("src/�ղ���Ϣ.xml");

			//��ȡ����Brand��ǩ
			NodeList brandList = doc.getElementsByTagName("Brand");
			//�������е�Brand��ǩ
			for(int i = 0 ; i < brandList.getLength(); i++){
				Node brand = brandList.item(i);
				//�жϽڵ������Ƿ���Element
				if(brand.getNodeType() != 1){
					continue;
				}
				//�����ǩ��name����
				Element el = (Element)brand;
				System.out.println("Ʒ�ƣ�" + el.getAttribute("name"));
				
				//��ȡBrand��ǩ�������ӽڵ�
				NodeList typeList = el.getChildNodes();
				//����Brand��ǩ
				for(int j = 0; j < typeList.getLength(); j++){
					Node type = typeList.item(j);
					if(type.getNodeType() != 1){
						continue;
					}
					el = (Element)type;
					System.out.println("\t�ͺţ�" + el.getAttribute("name"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void saveXML(String path){
		try {
			//���TransformerFactory����
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource domSource = new DOMSource(doc);
			// ���ñ�������
			transformer.setOutputProperty(OutputKeys.ENCODING, "gb2312");
			StreamResult result = new StreamResult(new FileOutputStream(path));
			// ��DOM��ת��ΪXML�ļ�
			transformer.transform(domSource, result);
		} catch (TransformerConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void addNewPhoneInfo(){
		try {
			// 1���õ�DOM�������Ĺ���ʵ��
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			// 2����DOM�������DOM������
			DocumentBuilder db;

			db = dbf.newDocumentBuilder();

			// 3������XML�ĵ����õ�һ��Document����DOM��
			doc = db.parse("src/�ղ���Ϣ.xml");

			//����Brand��ǩ
			Element el = doc.createElement("Brand");
			//��Brand��ǩ��������
			el.setAttribute("name", "����");
			//����Type��ǩ
			Element typeEl = doc.createElement("Type");
			//��Type��ǩ��������
			typeEl.setAttribute("name", "Note4");
			//��Type��ǩ
			el.appendChild(typeEl);
			doc.getElementsByTagName("PhoneInfo").item(0).appendChild(el);
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
