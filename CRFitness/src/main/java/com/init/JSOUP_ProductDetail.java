package com.init;

import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.CRFitness.ProductDetail.model.ProductDetailDAO_interface;
import com.CRFitness.ProductDetail.model.ProductDetailVO;


public class JSOUP_ProductDetail {

	public static void main(String[] args) throws IOException {
//		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
//		ProductDetailDAO_interface productDetailDAO = (ProductDetailDAO_interface) context.getBean("productDetailDAO");
		ProductDetailVO productDetailVO;

		Document doc;
		doc = Jsoup.connect("http://www.underarmour.tw/cmens-bottoms-capri/").timeout(30*1000).get();
		
		// get how many items
		Elements element_link = doc.select(".product-list .product-list-li .color-item .more-color");
		// System.out.println(element_link.size());
		
		for(int i=0;i<element_link.size();i++){
			productDetailVO = new ProductDetailVO();
			Document doc2;
			doc2 = Jsoup.connect("http://www.underarmour.tw/p"+element_link.get(i).id()+".htm").timeout(30*1000).get();	
			
//			productDetailVO.setSize("US9.5");; // Size
			
//			Elements Color = doc2.select(".show_color"); // Color
//			System.out.println((i+1) + " " + Color.text());
//			productDetailVO.setColor(Color.text());

//			productDetailVO.setStock(500);; // Stock
									
//			Timestamp ts = new Timestamp(System.currentTimeMillis()); // Published_Date
//			productDetailVO.setPublished_Date(ts);
//			
//			productDetailVO.setProduct_Status("上架"); // Product_Status		
						
//			Elements Info = doc2.select(".pdp-product-introduce ul li"); //Info		
//			System.out.println(Info.text());
//			productDetailVO.setInfo(Info.text());
	
			Elements productName = doc2.select(".trade-name"); // Product_Name
//			// System.out.println(product_Name.text());
			String[] Product_Name = new String[element_link.size()]; 
			Product_Name[i] = productName.text();
			 System.out.println((i+1) + " " + Product_Name[i]);
						
//			if(i==0){
//				productDetailVO.setProduct_Id("product413"+ (i+1) );
//			} else if(i>0 && Product_Name[i] == Product_Name[i-1]){
//				productDetailVO.setProduct_Id("product413"+ (i-1) );
//			} else{
//				productDetailVO.setProduct_Id("product413"+ i );
//			}
			 
			if(i>0 && Product_Name[i] == Product_Name[i-1]){
				System.out.println("product413"+ (i-1) );
			} else if(i>0 && Product_Name[i] != Product_Name[i-1]){
				System.out.println("product413"+ i );
			} else{
				System.out.println("product413"+ (i+1) );
			}
			 
//			productDetailDAO.insert(productDetailVO);
			
		} // end for (int i = 0; i < element_link.size(); i++)
		
//		((ConfigurableApplicationContext) context).close();
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
//			// System.out.println(element_link.size());
//		
//		for (int i = 0; i < element_link.size(); i++) {
//			Document doc2;
//			doc2 = Jsoup.connect("http://www.underarmour.tw/p" + element_link.get(i).id() + ".htm")
//					.timeout(40 * 1000).get();
//			
//			Elements fivephotoimg = doc2.select("#vertical ul li img");
//
//			for (int k = 0; k < fivephotoimg.size(); k++) {
//				String imgurl;
//				if (k == 0) {
//					imgurl = fivephotoimg.get(k).attr("src");
//					System.out.println(imgurl);
//				} else {
//					imgurl = fivephotoimg.get(k).attr("loadsrc");
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
//				File file = new File("c:\\products/M-bottoms-capri/prodDetail513" + (i + 1) + "_" + (k + 1) + ".png");
//				if (!file.exists()) {
//					file.createNewFile();
//				}
//				fop = new FileOutputStream(file);
//				fop.write(photo);
//				fop.flush();
//				fop.close();
//				System.out.println("Download finished!");
//			} // end for (int k = 0; k < fivephotoimg.size(); k++)
//		} // end for (int i = 0; i < element_link.size(); i++)

				// 男鞋類圖：5001-5083
				// Jsoup.connect: http://www.underarmour.tw/cmens-footwear/
//				if ((i + 1) < 10) {
//					file = new File("c:\\products/M-tops-sleeveless/prodDetail510" + (i + 1) + "_" + (k + 1) + ".png");
//				} else {
//					file = new File("c:\\products/M-tops-sleeveless/prodDetail51" + (i + 1) + "_" + (k + 1) + ".png");
//				}
				// 男衣類圖：5084-5130
				// Jsoup.connect: http://www.underarmour.tw/cmens-tops-sleeveless/
//				if ((i + 1) < 17) {
//					file = new File("c:\\products/M-tops-sleeveless/prodDetail50" + (i + 84) + "_" + (k + 1) + ".png");
//				} else if ((i + 1) < 27) {
//					file = new File("c:\\products/M-tops-sleeveless/prodDetail510" + (i - 16) + "_" + (k + 1) + ".png");
//				} else {
//					file = new File("c:\\products/M-tops-sleeveless/prodDetail51" + (i - 16) + "_" + (k + 1) + ".png");
//				};
				// 男褲類圖：5031-5036
				// http://www.underarmour.tw/cmens-bottoms-capri/
//				File file = new File("c:\\products/M-bottoms-capri/prodDetail513" + (i + 1) + "_" + (k + 1) + ".png");