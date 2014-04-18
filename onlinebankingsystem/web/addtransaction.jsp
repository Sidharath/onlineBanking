<center>
<%
    String sts = "";
    try{
        String q = "";
        com.model.DatabaseConnection db = new com.model.DatabaseConnection();
        String toaccount = "NA";
        int tid = Integer.parseInt(request.getParameter("transid"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String type = request.getParameter("type");
        int custid = Integer.parseInt(request.getParameter("custid"));
        String summary = "";
        com.model.Account temp = new com.model.Utility().getCustomerAccount(custid);
        java.sql.Date dt = new java.sql.Date(new java.util.Date().getTime());

        if(type.equals("transfer")){
            toaccount = request.getParameter("toaccount");
           
            q = "select * from accounts where accountno='"+toaccount+"'";
            db.executeSelect(q);
            if(db.rs.next()){
                if(temp.balamount>amount){
                    q = "update accounts set balamt=balamt-"+amount+" where customerid='"+custid+"'";
                    db.executeNonSelect(q);

                    q = "update accounts set balamt=balamt+"+amount+" where accountno='"+toaccount+"'";
                    db.executeNonSelect(q);
                    
                    q = "insert into acctrans values('"+tid+"','"+dt+"','"+temp.accountno+"','"+type+"','done','transferd to account "+toaccount+"','"+amount+"')";
                    db.executeNonSelect(q);
                    
                    q = "insert into acctrans values('"+(tid+1)+"','"+dt+"','"+toaccount+"','"+type+"','done','transferd from account "+temp.accountno+"','"+amount+"')";
                    db.executeNonSelect(q);
                    
                    sts = "transfer done successfully.";
                }else{
                    q = "insert into acctrans values('"+tid+"','"+dt+"','"+temp.accountno+"','"+type+"','failed','insufficient funds.','"+amount+"')";
                    db.executeNonSelect(q);
                    sts = "insufficient funds available.";
                }
            }else{
                q = "insert into acctrans values('"+tid+"','"+dt+"','"+temp.accountno+"','"+type+"','failed','transfer to account "+toaccount+"','"+amount+"')";
                db.executeNonSelect(q);
                sts = "transfer account number is invalid";
            }
            
        }else if(type.equals("withdraw")){
            if(temp.balamount>amount){
                q = "update accounts set balamt=balamt-"+amount+" where customerid='"+custid+"'";
                db.executeNonSelect(q);

                q = "insert into acctrans values('"+tid+"','"+dt+"','"+temp.accountno+"','"+type+"','done','cash withdrawal','"+amount+"')";
                db.executeNonSelect(q);
                sts = "withdrawal done successfully.";
            }else{
                q = "insert into acctrans values('"+tid+"','"+dt+"','"+temp.accountno+"','"+type+"','failed','insufficient funds.','"+amount+"')";
                db.executeNonSelect(q);
                sts = "insufficient funds available.";
            }
        }else if(type.equals("deposit")){
            q = "update accounts set balamt=balamt+"+amount+" where customerid='"+custid+"'";
            db.executeNonSelect(q);
            q = "insert into acctrans values('"+tid+"','"+dt+"','"+temp.accountno+"','"+type+"','done','cash deposit','"+amount+"')";
            db.executeNonSelect(q);
            sts = "deposit done successfully.";
        }
    }catch(Exception ex){
        ex.printStackTrace();
    }
    out.println("<h2>"+sts+"</h2>");
%>
<br/>
<a href="Accounts.jsp">Accounts Page</a>
</center>