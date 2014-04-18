package com.model;

public class Account
{
	public int balamount, customerid;
	public String accountno;
        public Account(){
            balamount=0;
            accountno="0";
            customerid=0;
        }
        public Account(int customerid, String accountno, int balamount){
            this.customerid = customerid;
            this.accountno = accountno;
            this.balamount=balamount;
        }
}