package com.init;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.CRFitness.Products.model.ProductsDAO_interface;
import com.CRFitness.Products.model.ProductsVO;


public class JSOUP_ProductDetail {

	public static void main(String[] args) throws IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
		ProductsDAO_interface dao = (ProductsDAO_interface) context.getBean("productsDAO");
		ProductsVO productsVO;

		Document doc;
		doc = Jsoup.connect("http://www.underarmour.tw/cmens-footwear/").timeout(30*1000).get();
		
		// get how many items
		Elements element_link = doc.select(".product-list .product-list-li .color-item .more-color");
		// System.out.println(element_link.size());
		
		for(int i=0;i<element_link.size();i++){
			productsVO=new ProductsVO();
			Document doc2;
			doc2=Jsoup.connect("http://www.underarmour.tw/p"+element_link.get(i).id()+".htm").timeout(30*1000).get();	
			
//			Elements Product_Name=doc2.select(".trade-name"); // Product_Name
//			productsVO.setProduct_Name(Product_Name.text());
//			System.out.println(Product_Name.text());
//			
//			Elements Price=doc2.select(".price"); // Price
//			System.out.println(Price.text().substring(3));
//			productsVO.setPrice(Double.parseDouble(Price.text().substring(3)));
//			
//			productsVO.setCategory("鞋類"); // Category			
//			dao.insert(productsVO);
			
			
			// ProductDetail Table: get info
			 Elements li=doc2.select(".pdp-product-introduce ul li");		
			 System.out.println(li.text());
	
		} // end for (int i = 0; i < element_link.size(); i++)
		
		((ConfigurableApplicationContext) context).close();
		
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