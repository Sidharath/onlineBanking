package com.model;

public class Card
{
	public int creditlimit, cashlimit, customerid;
	public String cardno;
        
        public Card(){
            customerid=0;
            cardno="0";
            creditlimit=0;
            cashlimit=0;
        }
        public Card(int customerid,String cardno, int cashlimit, int creditlimit){
            this.creditlimit = creditlimit;
            this.cardno = cardno;
            this.cashlimit = cashlimit;
            this.customerid = customerid;
        }
}