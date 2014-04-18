package com.model;

import java.util.ArrayList;

public class Utility
{

	ArrayList acclist, cardlist, fdlist;

	public ArrayList<FD> getFds(String query)
	{
		FD fd;
		fdlist = new ArrayList<FD>();
		try{ 
			DatabaseConnection con = new DatabaseConnection();
			con.executeSelect(query);
			while(con.rs.next())
			{
				fd = new FD();
				fd.amount = con.rs.getInt("amount");
				fd.fdno = con.rs.getString("fdno");
				fd.customerid = con.rs.getInt("customerid");
                                fd.months = con.rs.getInt("months");
                                fd.roi = con.rs.getDouble("roi");
				fdlist.add(fd);
			}
		}catch(Exception ex){ex.printStackTrace();}
		return fdlist;
	}

	public ArrayList<Account> getAccounts(String query)
	{
		Account acc;
		acclist = new ArrayList<Account>();
		try{ 
			DatabaseConnection con = new DatabaseConnection();
			con.executeSelect(query);
			while(con.rs.next())
			{
				acc = new Account();
				acc.balamount = con.rs.getInt("balamt");
				acc.accountno = con.rs.getString("accountno");
				acc.customerid = con.rs.getInt("customerid");
				acclist.add(acc);
			}
		}catch(Exception ex){ex.printStackTrace();}
		return acclist;
	}

	public ArrayList<Card> getCards(String query)
	{
		Card acc;
		cardlist = new ArrayList<Card>();
		try{ 
			DatabaseConnection con = new DatabaseConnection();
			con.executeSelect(query);
			while(con.rs.next())
			{
				acc = new Card();
				acc.creditlimit = con.rs.getInt("creditlimit");
				acc.cashlimit = con.rs.getInt("cashlimit");
				acc.cardno = con.rs.getString("cardno");
				acc.customerid = con.rs.getInt("customerid");
				cardlist.add(acc);
			}
		}catch(Exception ex){ex.printStackTrace();}
		return cardlist;
	}

	public Customer getCustomer(int custid){
		Customer u = null;
		try{
			String query = "select * from customers where customerid='" + custid + "'";
			DatabaseConnection con = new DatabaseConnection();
			con.executeSelect(query);
			if(con.rs.next()){
                            String password, firstname, lastname, dob, gender, address, city, state, country, pincode, mobile, email;
                            password = con.rs.getString("password");
                            firstname = con.rs.getString("firstname");
                            lastname = con.rs.getString("lastname");
                            dob = con.rs.getString("dob");
                            gender = con.rs.getString("gender");
                            address = con.rs.getString("address");
                            city = con.rs.getString("city");
                            state = con.rs.getString("state");
                            country = con.rs.getString("country");
                            pincode = con.rs.getString("pincode");
                            mobile = con.rs.getString("mobile");
                            email = con.rs.getString("email");
                            u = new Customer(custid, password, firstname, lastname, dob, gender, address, city, state, country, pincode, mobile, email);
                        }else{
                            u = new Customer();
                        }
		}catch(Exception ex){
			ex.printStackTrace();	
		}
		return u;
	}

	public String getCustomerId(String accno){
		String custid = "";
		try{
			String query = "select customerid from cards where cardno='" + accno + "'";
			DatabaseConnection con = new DatabaseConnection();
			con.executeSelect(query);
			con.rs.next();
			custid = con.rs.getString("customerid");
		}catch(Exception ex){
			ex.printStackTrace();
			custid = "na";
		}
		return custid;
	}
	
	public String getLimit(String id){
		String limit = "";
		try{
			String query = "select cashlimit, creditlimit from cards where customerid='" + id + "'";
			DatabaseConnection con = new DatabaseConnection();
			con.executeSelect(query);
			con.rs.next();
			int cash, credit;
			cash = con.rs.getInt("cashlimit");
			credit = con.rs.getInt("creditlimit");
			limit = "" + cash + "/" + credit;
		}catch(Exception e){
		}
		return limit;
	}
       
        public Card getCustomerCard(int custid){
		Card u = null;
		try{
			String query = "select * from cards where customerid='" + custid + "'";
			DatabaseConnection con = new DatabaseConnection();
			con.executeSelect(query);
			if(con.rs.next()){
                            u = new Card(custid,con.rs.getString("cardno"), con.rs.getInt("cashlimit"), con.rs.getInt("creditlimit"));
                        }else{
                            u = new Card();
                        }
		}catch(Exception ex){
			ex.printStackTrace();	
		}
		return u;
        }
       
        public Account getCustomerAccount(int custid){
		Account u = null;
		try{
			String query = "select * from accounts where customerid='" + custid + "'";
			DatabaseConnection con = new DatabaseConnection();
			con.executeSelect(query);
			if(con.rs.next()){
                            u = new Account(custid,con.rs.getString("accountno"), con.rs.getInt("balamt"));
                        }else{
                            u = new Account();
                        }
		}catch(Exception ex){
			ex.printStackTrace();	
		}
		return u;
        }
        
        public String getRandomPassword(int length){
            char[] symbols = new char[36];
            for (int idx = 0; idx < 10; ++idx)
                symbols[idx] = (char) ('0' + idx);
            for (int idx = 10; idx < 36; ++idx)
                symbols[idx] = (char) ('a' + idx - 10);
            char[] chars =new char[length];
            java.util.Random random = new java.util.Random();
            for (int idx = 0; idx < length; ++idx) 
              chars[idx] = symbols[random.nextInt(symbols.length)];            
            return new String(chars);
        }
        
   public String encryptPassword(String pass){
       String encpass = "";
       try {
           java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
           byte[] passBytes = pass.getBytes();
           md.reset();
           byte[] digested = md.digest(passBytes);
           StringBuffer sb = new StringBuffer();
           for(int i=0;i<digested.length;i++){
               sb.append(Integer.toHexString(0xff & digested[i]));
           }
           encpass= sb.toString();
       }catch (Exception ex) {
           ex.printStackTrace();
       }
       return encpass;
   }
   
   public int getAccountTransaction(){
       int tid = 10001;
       try{
           String q = "select transid from acctrans where transid=(select max(transid) from acctrans)";
           DatabaseConnection dc = new DatabaseConnection();
           dc.executeSelect(q);
           if(dc.rs.next()){
               tid = dc.rs.getInt("transid")+1;
           }
       }catch(Exception ex){
           ex.printStackTrace();
       }
       return tid;
   }
}