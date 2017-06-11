package com.psl.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.psl.model.Bill;
import com.psl.model.Cart;
import com.psl.model.Customer;
import com.psl.model.Product;
import com.psl.model.Users;

public class DataManagerImpl implements DataManager {

	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public boolean register(Customer customer) {
		// TODO Auto-generated method stub
		System.out.println("In DAOImpl addEmployee ");
		String sql = "insert into customer values('" + customer.getFirstName()
				+ "','" + customer.getLastName() + "','" + customer.getEmail()
				+ "','" + customer.getPassword() + "','"
				+ customer.getAddress() + "'," + customer.getContactNo()
				+ ",'" + customer.getSecurityQues() + "','"
				+ customer.getSecurityAns() + "')";

		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("Registered successfully");
			return true;
		} else {
			System.out.println("Not registered");
			return false;
		}
	}

	@Override
	public List<Product> getProducts() {
		// TODO Auto-generated method stub
		return template.query("select * from product",
				new RowMapper<Product>() {

					@Override
					public Product mapRow(ResultSet rs, int rownum)
							throws SQLException {
						Product p = new Product();
						p.setProductId(rs.getInt("pid"));
						p.setProdcutName(rs.getString("pname"));
						p.setSection(rs.getString("section"));
						p.setPrice(rs.getFloat("price"));
						p.setQuantity(rs.getInt("quantity"));
						p.setImage(rs.getString("image"));

						return p;
					}

				});

	}

	@Override
	public Product getProductbyProductName(String productName) {

		String sql = "select * from product where pname='" + productName + "'";
		final Product p = new Product();
		template.query(sql, new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub

				p.setProductId(rs.getInt("pid"));
				p.setProdcutName(rs.getString("pname"));
				p.setSection(rs.getString("section"));
				p.setPrice(rs.getFloat("price"));
				p.setQuantity(rs.getInt("quantity"));
				p.setImage(rs.getString("image"));
				return p;
			}
		});

		return p;
	}

	@Override
	public boolean addToCart(Cart cart) {
		// TODO Auto-generated method stub

		System.out.println("In DAOImpl addCart ");
		String sql = "insert into cart values('" + cart.getEmail() + "',"
				+ cart.getProductId() + ",'" + cart.getProductName() + "',"
				+ cart.getQuantityPurchased() + ")";

		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("Added successfully");
			return true;
		} else {
			System.out.println("Not added");
			return false;
		}

	}

	@Override
	public List<Cart> getCartDetails(Customer customer) {
		// TODO Auto-generated method stub
		String sql = "select * from cart where email='" + customer.getEmail()
				+ "'";

		return template.query(sql, new RowMapper<Cart>() {

			@Override
			public Cart mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				Cart c = new Cart();
				c.setEmail(rs.getString("email"));
				c.setProductId(rs.getInt("pid"));
				c.setProductName(rs.getString("pname"));
				c.setQuantityPurchased(rs.getInt("quantity_purchased"));
				return c;
			}
		});

	}

	@Override
	public boolean setBill(Bill bill) {
		String sql = "insert into bill values('"+ bill.getEmail() + "','"
				+ bill.getAmount() + "','" + bill.getDate() +"',"+bill.getBillID()+ ")";
		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("Bill Set");
			return true;
		} else {
			System.out.println("Bill not set");
			return false;
		}

	}

	@Override
	public List<Customer> getCustomers() {

		return template.query("select * from customer",
				new RowMapper<Customer>() {

					@Override
					public Customer mapRow(ResultSet rs, int rownum)
							throws SQLException {
						Customer c = new Customer();
						c.setPassword(rs.getString("password"));
						c.setFirstName(rs.getString("fname"));
						c.setLastName(rs.getString("lname"));
						c.setEmail(rs.getString("email"));
						c.setFirstName(rs.getString("fname"));
						c.setAddress(rs.getString("address"));
						c.setContactNo(rs.getLong("contact_no"));
						c.setSecurityQues(rs.getString("security_q"));
						c.setSecurityAns(rs.getString("security_a"));

						return c;
					}

				});
	}

	@Override
	public boolean addProduct(Product product) {
		// TODO Auto-generated method stub
		System.out.println("In DAOImpl addEmployee ");
		String sql = "insert into product values(null,'" + product.getProdcutName() + "','"
				+ product.getSection() + "'," + product.getPrice() + ","
				+ product.getQuantity() + ",'" + product.getImage() + "')";

		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("Added successfully");
			return true;
		} else {
			System.out.println("Not added");
			return false;
		}

	}

	
	@Override
	public boolean deleteProduct(String	productName) {
		String sql = "delete from product where pname='" +productName+"'";
		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("deleted successfully");
			return true;
		} else {
			System.out.println("Not deleted");
			return false;
		}

	}

	@Override
	public boolean updateQuantity(Product product, int quantity) {
		String sql = "update product set quantity=" + quantity + " where pid="
				+ product.getProductId();
		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("updated quantity successfully");
			return true;
		} else {
			System.out.println("Not updated..");
			return false;
		}
	}

	@Override
	public List<Product> getProductsBySection(String section) {
		String sql = "select * from product where section='" + section + "'";
		
		return template.query(sql, new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				 Product p = new Product();
				
				p.setProductId(rs.getInt("pid"));
				p.setProdcutName(rs.getString("pname"));
				p.setSection(rs.getString("section"));
				p.setPrice(rs.getFloat("price"));
				p.setQuantity(rs.getInt("quantity"));
				p.setImage(rs.getString("image"));
				return p;
			}
		});

	}

	@Override
	public boolean deleteCartEntry(Customer customer) {
		String sql = "delete from cart where email='" + customer.getEmail()
				+ "'";
		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("deleted successfully");
			return true;
		} else {
			System.out.println("Not deleted");
			return false;
		}

	}

	@Override
	public String getSecurityQuestion(Customer customer) {

		String sql = "select security_q from customer where email='"
				+ customer.getEmail() + "'";
		Object o = template.queryForObject(sql, String.class);
		return o.toString();
	}

	@Override
	public boolean checkSecurityAns(Customer customer, String answer) {
		String sql = "select security_a from customer where email='"
				+ customer.getEmail() + "'";
		Object o = template.queryForObject(sql, String.class);
		if (o.toString().equalsIgnoreCase(answer)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean resetPassword(Customer customer, String newPassword) {
		String sql = "update customer set password='" + newPassword
				+ "' where email='" + customer.getEmail() + "'";
		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("reset successfully");
			return true;
		} else {
			System.out.println("Not reset successfully");
			return false;
		}
	}

	@Override
	public List<Users> getUsers() {
		String sql = "select * from customer_view";

		return template.query(sql, new RowMapper<Users>() {

			@Override
			public Users mapRow(ResultSet rs, int arg1) throws SQLException {
				Users u = new Users();
				u.setUserName(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				return u;

			}
		});

	}
	public Date getBill(long billID) {
		String sql = "select date from bill where bill_ID="+billID;
		Object o=(template.queryForObject(sql, java.sql.Date.class));
		
		return (Date)o;
		
	}

	@Override
	public boolean deleteProdcutfromCart(Customer customer, String productName) {
		
		String sql = "delete from cart where pname='"+productName+"' and email='"+customer.getEmail()+"'";
		System.out.println(productName);
	
		int cnt = template.update(sql);
		if (cnt > 0) {
			System.out.println("reset successfully");
			return true;
		} else {
			System.out.println("Not reset successfully");
			return false;
		}
	}
	
	public boolean updateCartQuantity(Customer customer,String pname,int quantity)
	{
		String sql="update cart set quantity="+quantity+" where email='"+customer.getEmail()+"'"+" and pname='"+pname+"'";
		int cnt=template.update(sql);
		if(cnt>0)
		{
			System.out.println("updated successfully");
			return true;
		}
		else
		{
			System.out.println("not updated");
			return false;
		}
		
		
	}

}
