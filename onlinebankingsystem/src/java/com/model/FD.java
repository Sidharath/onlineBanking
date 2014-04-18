package com.model;

public class FD
{
	public int months, amount, customerid;
        public double roi;
	public String fdno;
        public FD(){
            amount=0;
            fdno="0";
            customerid=0;
            roi=0;
            months=0;
        }
        public FD(int customerid, String fdno, int amount,int months, double roi){
            this.customerid = customerid;
            this.fdno = fdno;
            this.amount=amount;
            this.roi = roi;
            this.months = months;
        }
}