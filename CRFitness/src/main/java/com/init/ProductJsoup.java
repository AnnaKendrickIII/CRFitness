package com.init;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ProductJsoup {

	public static void main(String[] args) throws IOException {
		Document doc;
		doc = Jsoup.connect("http://www.underarmour.tw/cmens-footwear/").timeout(20*1000).get();
		
		Elements element_link = doc.select(".product-list .product-list-li .quick-buy");
//		System.out.println(element_link.size());
		for(int i=0;i<element_link.size();i++){
			Document doc2;
			doc2=Jsoup.connect("http://www.underarmour.tw/p"+element_link.get(i).attr("data-attr")+".html").timeout(50*1000).get();	
			Elements li=doc2.select(".pdp-product-introduce ul li");		
			System.out.println(li.text());
//			Elements fivephotoimg=doc2.select("#vertical ul li img");
//	
//				for(int k=0;k<fivephotoimg.size();k++){	
//					String imgurl;
//					if(k==0){
//						imgurl=fivephotoimg.get(k).attr("src");
//						System.out.println(imgurl);
//					}else{
//						imgurl=fivephotoimg.get(k).attr("loadsrc");
//						System.out.println(imgurl);
//					}
//					URL url = new URL(imgurl);
//					FileOutputStream fop = null;	
//					byte[] photo=null;			      
//					ByteArrayOutputStream baos = new ByteArrayOutputStream();  
//					BufferedImage originalImage = ImageIO.read(url);
//						ImageIO.write(originalImage, "png", baos);
//						baos.flush();
//						photo = baos.toByteArray();
//						baos.close();
//						File file;
//						if((i+1)<10){
//						 file = new File("c:\\products/x/prodDetail500"+(i+1)+"_"+(k+1)+".png");		
//						}else{
//						  file = new File("c:\\products/x/prodDetail50"+(i+1)+"_"+(k+1)+".png");
//						}
//						if (!file.exists()) {
//							file.createNewFile();
//						}	
//						fop = new FileOutputStream(file);
//						fop.write(photo);
//						fop.flush();
//						fop.close();		
//				}
		}

				
				
	}

}
