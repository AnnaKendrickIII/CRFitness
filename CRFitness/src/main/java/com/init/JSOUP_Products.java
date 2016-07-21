package com.init;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.CRFitness.ProductDetail.model.ProductDetailDAO_interface;
import com.CRFitness.ProductDetail.model.ProductDetailVO;
import com.CRFitness.Products.model.ProductsDAO_interface;
import com.CRFitness.Products.model.ProductsVO;


public class JSOUP_Products {

	public static void main(String[] args)  {
		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
		ProductsDAO_interface productsDAO = (ProductsDAO_interface) context.getBean("productsDAO");
		ProductDetailDAO_interface productDetailDAO = (ProductDetailDAO_interface) context.getBean("productDetailDAO");
		Document doc;
		try {
			doc = Jsoup.connect("http://www.underarmour.tw/cmens-accessories/").timeout(600*1000).get();
		
		String[] arraySize={"S","M","L","XL","XXL"};
		String[] arraySize2={"US8","US8.5","US9","US9.5","US10"};
		// get how many items
		Elements element_link = doc.select(".product-list .product-list-li .color-item .more-color");
		 System.out.println(element_link.size());
		ProductsVO productsVO = null;
		List<String> list=new ArrayList<String>();
		int whichsize=element_link.size();
		for(int i=0;i<whichsize;i++){
			System.out.println(element_link.get(i).id()+",");
			list.add(element_link.get(i).id());
		}
		List<String> list2=new ArrayList<String>();
		for(int i=0;i<whichsize;i++){
			Document doc2;
			doc2 = Jsoup.connect("http://www.underarmour.tw/p"+list.get(i)+".htm").timeout(600*1000).get();
			Elements Product_Name = doc2.select(".trade-name"); // Product_Name
			Integer size=((int)(Math.random()*4));
			Integer num=((int)(Math.random()*25)+1);
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			Elements Price = doc2.select(".price"); // Price
			Elements Info = doc2.select(".pdp-product-introduce ul li"); //Info			
			Elements Color = doc2.select(".show_color"); // Color	
			
				if(i>=1){
					if(i%30==0){
						Thread.sleep(36*1000);
					}
//					Document doc3;
//					doc3 = Jsoup.connect("http://www.underarmour.tw/p"+list.get(i-1)+".htm").timeout(600*1000).get();
//					Elements Product_Name2 = doc3.select(".trade-name");
					if((list2.get(0)).equalsIgnoreCase(Product_Name.text())){	
						System.out.println(i);
//						 System.out.println("pp:   "+Product_Name.text());
//							System.out.println("list2:   "+list2.get(0));
//						System.out.println(Color.text());
//						System.out.println("上架中");						
//						System.out.println("size:"+size);				
						ProductDetailVO productDetailVO=new ProductDetailVO();
						productDetailVO.setProduct_Id(productsVO.getProduct_Id());
						productDetailVO.setColor(Color.text());
						productDetailVO.setProduct_Status("上架");
						productDetailVO.setPublished_Date(ts);
						productDetailVO.setSize("U");
						productDetailVO.setStock(num);
						productDetailDAO.insert(productDetailVO);
//						System.out.println("------------");
						}else{
							System.out.println(i);
//							 System.out.println("pp:   "+Product_Name.text());
//							System.out.println("list2:   "+list2.get(0));
							list2.set(0, Product_Name.text());
//							 System.out.println(Price.text().substring(3));
//							 System.out.println(Info.text());						
							productsVO = new ProductsVO();
							productsVO.setProduct_Name(Product_Name.text());
							productsVO.setPrice(Double.parseDouble(Price.text().substring(3)));		
							productsVO.setCategory("配件"); // Category: 鞋類、服飾類、運動用品、運動器材 					
							productsVO.setInfo(Info.text());
							productsVO= productsDAO.insert(productsVO);
//							System.out.println(Color.text());
//							System.out.println("上架中");
//							System.out.println("size:"+size);	
							
							ProductDetailVO productDetailVO=new ProductDetailVO();
							productDetailVO.setProduct_Id(productsVO.getProduct_Id());
							productDetailVO.setColor(Color.text());
							productDetailVO.setProduct_Status("上架");
							productDetailVO.setPublished_Date(ts);
							productDetailVO.setSize("U");
							productDetailVO.setStock(num);
							productDetailDAO.insert(productDetailVO);
//							System.out.println("------------");
						}
					}else{	
						list2.add(0,Product_Name.text());
						productsVO = new ProductsVO();
						productsVO.setProduct_Name(Product_Name.text());
						productsVO.setPrice(Double.parseDouble(Price.text().substring(3)));		
						productsVO.setCategory("配件"); // Category: 鞋類、服飾類、運動用品、運動器材 					
						productsVO.setInfo(Info.text());
						productsVO= productsDAO.insert(productsVO);
						System.out.println(i);
//						System.out.println("pp:   "+Product_Name.text());
//						System.out.println("list2:   "+list2.get(0));
//						System.out.println(Price.text().substring(3));
//						System.out.println(Info.text());
//						System.out.println("size:"+size);
//						System.out.println(Color.text());
//						System.out.println("上架中");						
						ProductDetailVO productDetailVO=new ProductDetailVO();
						productDetailVO.setProduct_Id(productsVO.getProduct_Id());
						productDetailVO.setColor(Color.text());
						productDetailVO.setProduct_Status("上架");
						productDetailVO.setPublished_Date(ts);
						productDetailVO.setSize("U");
						productDetailVO.setStock(num);
						productDetailDAO.insert(productDetailVO);
//						System.out.println("------------");	
				}
				Elements fivephotoimg = doc2.select("#vertical ul li img");
				for (int j = 0; j < fivephotoimg.size(); j++) {
					
					String imgurl;
					if (j == 0) {
						imgurl = fivephotoimg.get(j).attr("src");
						System.out.println(imgurl);
					} else {
						imgurl = fivephotoimg.get(j).attr("loadsrc");
						System.out.println(imgurl);
					}
					URL url = new URL(imgurl);
					FileOutputStream fop = null;
					byte[] photo = null;
					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					BufferedImage originalImage = ImageIO.read(url);
					ImageIO.write(originalImage, "png", baos);
					baos.flush();
					photo = baos.toByteArray();
					baos.close();
					File file ;
					if (i < 7) {		
						file = new File("c:\\products/cmens-accessories/prodDetail539" + (i+3) + "_" + (j + 1) + ".png");
					} 
					else if (i>=7 && i<17){
						file = new File("c:\\products/cmens-accessories/prodDetail540" + (i - 7) + "_" + (j + 1) + ".png");
					}else if(i>=17 && i<=106){
						file = new File("c:\\products/cmens-accessories/prodDetail54" + (i - 7) + "_" + (j + 1) + ".png");
					}else if(i>106 && i<=116){
						file = new File("c:\\products/cmens-accessories/prodDetail550" + (i - 107) + "_" + (j + 1) + ".png");
					}else{
						file = new File("c:\\products/cmens-accessories/prodDetail55" + (i - 107) + "_" + (j + 1) + ".png");
					}
					if (!file.exists()) {
						file.createNewFile();
					}
					fop = new FileOutputStream(file);
					fop.write(photo);
					fop.flush();
					fop.close();
				} // end for (int j = 0; j < fivephotoimg.size(); j++)
			
		} // end for (int i = 0; i < element_link.size(); i++)
		
		} catch (Exception e) {
			System.out.println("有錯");
		}	
		((ConfigurableApplicationContext) context).close();
		System.out.println("Grasp finished!");
		
	} // end public static void main(String[] args) throws IOException
} // end public class JSOUP_F_tops
				

				// 抓文字資料，寫盡資料庫，需要再Library加入 jdbc jar


				// 抓圖片，以下這段放在main()裡面：
//		Document doc;
//		doc = Jsoup.connect("http://www.underarmour.tw/cmens-bottoms-capri/").timeout(40 * 1000).get();
//		
//		// get how many items
//		Elements element_link = doc.select(".product-list .product-list-li .color-item .more-color");
//			// System.out.println(element_link.size()); //顯示主頁有多少商品圖
//		
//		for (int i = 0; i < element_link.size(); i++) {
//			Document doc2;
//			doc2 = Jsoup.connect("http://www.underarmour.tw/p" + element_link.get(i).id() + ".htm")
//					.timeout(40 * 1000).get();
//			
//			Elements fivephotoimg = doc2.select("#vertical ul li img");
//			// System.out.println(element_link.size()); //顯示子頁產品有幾張圖

//			for (int j = 0; j < fivephotoimg.size(); j++) {
//				String imgurl;
//				if (j == 0) {
//					imgurl = fivephotoimg.get(j).attr("src");
//					System.out.println(imgurl);
//				} else {
//					imgurl = fivephotoimg.get(j).attr("loadsrc");
//					System.out.println(imgurl);
//				}
//				URL url = new URL(imgurl);
//				FileOutputStream fop = null;
//				byte[] photo = null;
//				ByteArrayOutputStream baos = new ByteArrayOutputStream();
//				BufferedImage originalImage = ImageIO.read(url);
//				ImageIO.write(originalImage, "png", baos);
//				baos.flush();
//				photo = baos.toByteArray();
//				baos.close();
//				File file = new File("c:\\products/M-bottoms-capri/prodDetail513" + (i + 1) + "_" + (j + 1) + ".png");
//				if (!file.exists()) {
//					file.createNewFile();
//				}
//				fop = new FileOutputStream(file);
//				fop.write(photo);
//				fop.flush();
//				fop.close();
//			} // end for (int j = 0; j < fivephotoimg.size(); j++)
//		} // end for (int i = 0; i < element_link.size(); i++)
//				System.out.println("Download finished!");

				// 男鞋類圖：5001-5083
				// Jsoup.connect: http://www.underarmour.tw/cmens-footwear/
//				if ((i + 1) < 10) {
//					file = new File("c:\\products/M-footwear/prodDetail500" + (i + 1) + "_" + (j + 1) + ".png");
//				} else {
//					file = new File("c:\\products/M-footwear/prodDetail50" + (i + 1) + "_" + (j + 1) + ".png");
//				}
				// 男衣類圖：5084-5130
				// Jsoup.connect: http://www.underarmour.tw/cmens-tops-sleeveless/
//				if ((i + 1) < 17) {
//					file = new File("c:\\products/M-tops-sleeveless/prodDetail50" + (i + 84) + "_" + (j + 1) + ".png");
//				} else if ((i + 1) < 27) {
//					file = new File("c:\\products/M-tops-sleeveless/prodDetail510" + (i - 16) + "_" + (j + 1) + ".png");
//				} else {
//					file = new File("c:\\products/M-tops-sleeveless/prodDetail51" + (i - 16) + "_" + (j + 1) + ".png");
//				};
				// 男褲類圖：5031-5036
				// Jsoup.connect: http://www.underarmour.tw/cmens-bottoms-capri/
//				File file = new File("c:\\products/M-bottoms-capri/prodDetail513" + (i + 1) + "_" + (j + 1) + ".png");