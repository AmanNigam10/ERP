package com.psl.service;


import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.psl.dao.DataManager;
import com.psl.model.Bill;
import com.psl.model.Cart;
import com.psl.model.Customer;
import com.psl.model.Product;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class CreatePdf {
	private DataManager dao;

	public DataManager getDao() {
		return dao;
	}

	public void setDao(DataManager dao) {
		this.dao = dao;
	}
	
	
	public boolean txttoPdf(File file)
	{
		 BufferedReader br = null;

		    try {

		        Document pdfDoc = new Document(PageSize.A4);
		        String output_file = file.getName().replace(".txt", ".pdf");
		        System.out.println("## writing to: " + output_file);
		        PdfWriter.getInstance(pdfDoc, new FileOutputStream(output_file)).setPdfVersion(PdfWriter.VERSION_1_7);;

		        pdfDoc.open();

		        Font myfont = new Font();
		        myfont.setStyle(Font.NORMAL);
		        myfont.setSize(11);

		        pdfDoc.add(new Paragraph("\n"));

		        if (file.exists()) {

		            br = new BufferedReader(new FileReader(file));
		            String strLine;

		            while ((strLine = br.readLine()) != null) {
		                Paragraph para = new Paragraph(strLine + "\n", myfont);
		                para.setAlignment(Element.ALIGN_JUSTIFIED);
		                pdfDoc.add(para);
		            }
		        } else {
		            System.out.println("no such file exists!");
		            return false;
		        }
		        
		        pdfDoc.close();
		    }
		    catch(Exception e)
		    {
		    	e.printStackTrace();
		    }
		    finally {
		        if (br != null)
					try {
						br.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    }
		    return true;
		
	}
	
	public void generateBillPdf(Customer customer) {

			ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
			CartService cart_service = context.getBean("cart_service",CartService.class);    
			
			ProductService prod_service = new ProductService(); //context.getBean("prod_service",ProductService.class);
			
			BillService bill_service = context.getBean("bill_service",BillService.class);
			
			Document document = new Document(PageSize.LETTER);
	        
	        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	        SimpleDateFormat id = new SimpleDateFormat("ddMMyyyyHHmm");
	        Calendar calendar = Calendar.getInstance();
	        String billDate = dateFormat.format(calendar.getTime());
	        String billNo = id.format(calendar.getTime());
	        List<Cart> carts = cart_service.getCartDetails(customer); 
	        
	        String fromEmail = "weawesomesauce@gmail.com";
			String username = "weawesomesauce";
			String password = "gadgetfloor1234";
			String path = "E://";
	        
			
	         

	        try {
	            PdfWriter.getInstance(document, new FileOutputStream("E://"+customer.getFirstName()+"_"+customer.getLastName()+"_"+billNo+".pdf")); //Customer Name

	            document.open();
	            document.add(new Paragraph("                                                         GadgetFloor Bill"));
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("Contact us : weawesomesauce@gmail.com"));
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("Customer Details: "));
	            document.add(new Paragraph("Customer's Name: "+customer.getFirstName()+" "+customer.getLastName()));
	            document.add(new Paragraph("Customer's Address: "+customer.getAddress()));
	            document.add(new Paragraph("Customer's Phone No.: "+customer.getContactNo()));
	            document.add(new Paragraph("Customer's Email: "+customer.getEmail()));
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("\n"));
	            
	            document.add(new Paragraph("                                                         Transactions Details: "));
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("Date: "+billDate));
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("Bill No: -"+ billNo));
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("\n"));
	            
	            PdfPTable table = new PdfPTable(4); // 3 columns.

	            PdfPCell cell = new PdfPCell(new Paragraph("Sr No"));
	            table.addCell(cell);	         
	            cell = new PdfPCell(new Paragraph("Product Name"));
	            table.addCell(cell);
	            cell = new PdfPCell(new Paragraph("Quantity"));
	            table.addCell(cell);
	            cell = new PdfPCell(new Paragraph("Price"));
	            table.addCell(cell);
	            int i=1;
	            float sum =0f;
	            for(Cart items : carts)
	            {
	            	Product product = prod_service.getProductbyProductName(items.getProductName());
	            	table.addCell(String.valueOf(i));
	            	table.addCell(items.getProductName());
	            	table.addCell(String.valueOf(items.getQuantityPurchased()));
	            	table.addCell(String.valueOf(product.getPrice()));
	            	sum+=(product.getPrice()*items.getQuantityPurchased());
	            	
	            	//Update Quantity
	            	int purchasedQuantity =items.getQuantityPurchased();
					int availableQuantity = product.getQuantity();
					int  updateQuantity = availableQuantity - purchasedQuantity;
					prod_service.updateQuantity(product, updateQuantity);
	            	
	            }
	            table.addCell("Total Price");
            	table.addCell("");
            	table.addCell("");
            	table.addCell(String.valueOf(sum));
            	

	            document.add(table);
	            
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("Your Bill is sent to your registered email id and package will be delivered in 2 to 5 days at your registered address."));
	            document.add(new Paragraph("\n"));
	            document.add(new Paragraph("Thank you! Do visit again!"));
	            
	            document.close(); 
	            
	            new sendMail().sendEmailwithPdf(customer.getEmail(), "Bill from AweseomeSauce", "Please find your mail! Happy Shopping",
	            		fromEmail, username, password, customer, path);
	            
	            Bill bill = new Bill();
	            bill.setBillID(Long.parseLong(billNo));
	            bill.setAmount(sum);
	            bill.setDate(new Date(calendar.getTimeInMillis()));
	            bill.setEmail(customer.getEmail());
	            bill_service.setBill(bill);

	        } catch (DocumentException e) {
	            e.printStackTrace();
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        }
	        
	    }
}