<%@page import="java.util.Random"%>
<%@page import="java.util.Collections"%>
<%@page import="GeniticAlgorithm.Algorithm"%>
<%@page import="GeniticAlgorithm.Population"%>
<%@page import="GeniticAlgorithm.FitnessCalc"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<%
        //session
        HttpSession hs = request.getSession(true);
       
        //argument
        String username =  hs.getAttribute("x").toString();
          
        //jdbc connection
        try
        {           
            //calling database class
            DatabaseFile obj = new DatabaseFile();
            
            String sql1 = "SELECT teacherid, FullName "
                    + "FROM teacherinfo ";
            
            ResultSet rs = obj.codeselect(sql1);
                       
            while(rs.next())
            {
                //delete existing
                String sql2 = "DELETE FROM timetable_"+rs.getString("FullName");
                
                obj.codedelete(sql2);
                
                //create table
                String sql = "CREATE TABLE IF NOT EXISTS timetable_"+rs.getString("FullName")+"("
                    + "sno int(11) NOT NULL AUTO_INCREMENT, "
                    + "Day varchar(250) NOT NULL, "
                    + "8_9 int(11) NOT NULL, "
                    + "9_10 int(11) NOT NULL, "
                    + "10_11 int(11) NOT NULL, "
                    + "11_12 int(11) NOT NULL, "                   
                    + "1_2 int(11) NOT NULL, "
                    + "2_3 int(11) NOT NULL, "
                    + "3_4 int(11) NOT NULL, "      
                    + "gradeid int(11) NOT NULL, "     
                    + "sectionid int(11) NOT NULL, "                                                   
                    + "PRIMARY KEY (sno), "
                    + "KEY 8_9 (8_9),"
                    + "KEY 9_10 (9_10), "
                    + "KEY 10_11 (10_11),"
                    + "KEY 11_12 (11_12), "                    
                    + "KEY 1_2 (1_2), "
                    + "KEY 2_3 (2_3), "
                    + "KEY 3_4 (3_4), "
                    + "KEY gradeid (gradeid), "
                    + "KEY sectionid (sectionid)) "
                    + "ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1";

                System.out.println(sql);
                
                obj.codeupdate(sql);
                
                int no_days = 5;
                int no_of_lessons = 7;
                int total_lessons = 35;
                
                ArrayList<String> weeklist = new  ArrayList<String>();               
                weeklist.add("Monday");
                weeklist.add("Tueday");
                weeklist.add("Wednesday");
                weeklist.add("Thursday");
                weeklist.add("Friday");
               
                        String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "";
                                     
                         // Set a candidate solution
                        FitnessCalc.setSolution("1111000000000000000000000000000000000000000000000000000000001111");

                        // Create an initial population
                        Population myPop = new Population(35, true);

                        // Evolve our population until we reach an optimum solution
                        int generationCount = 0;

                        while (myPop.getFittest().getFitness() < FitnessCalc.getMaxFitness()) 
                        {
                            generationCount++;
                            System.out.println("Generation: " + generationCount + " Fittest: " + myPop.getFittest().getFitness());
                            myPop = Algorithm.evolvePopulation(myPop);
                        }
                        System.out.println("Solution found!");
                        System.out.println("Generation: " + generationCount);
                        System.out.println("Genes:");
                        System.out.println(myPop.getFittest());  

                        int teacherid = rs.getInt("teacherid");  

                        //subject
                        String sql11 = "SELECT * FROM teacher_subjects WHERE teacherid = '"+teacherid+"'";    
                        
                        ResultSet rs11 = obj.codeselect(sql11);
                       
                        ArrayList<String> subjectList =  new ArrayList<String>();
                        
                        while(rs11.next())
                        {
                            subjectList.add(rs11.getString("subjectid")+"");
                        }
                        
                        rs11.close();

                        //section
                        String sql21 = "SELECT s.sectionsname as sectionsname, s.sectionid as sectionid "
                                + "FROM teacher_sections as ts "
                                + "LEFT JOIN sections as s on s.sectionid = ts.sectionid "
                                + "WHERE teacherid = '"+teacherid+"'";   
                        
                        ResultSet rs21 = obj.codeselect(sql21);
                       
                        ArrayList<String> sectionList =  new ArrayList<String>();
                        ArrayList<String> sectionidList =  new ArrayList<String>();
                        
                        while(rs21.next())
                        {
                            sectionList.add(rs21.getString("sectionsname")+"");
                            sectionidList.add(rs21.getString("sectionid")+"");
                        }
                       
                        rs21.close();

                        //grade
                        String sql31 = "SELECT * FROM teacher_grades WHERE teacherid = '"+teacherid+"'";   

                        ResultSet rs31 = obj.codeselect(sql31);
                       
                        ArrayList<String> gradeList =  new ArrayList<String>();
                        
                        while(rs31.next())
                        {
                            gradeList.add(rs31.getString("gradeid")+"");
                        }   
                           
                        rs31.close();

                                                        
                        //search section
                        for(int i = 0; i < sectionList.size(); i++)
                        {        
                            ArrayList secwholeList =  new ArrayList();
                            ArrayList gradewholeList =  new ArrayList();
                                                                      
                            for(int k = 0; k < gradeList.size(); k++)
                            { 
                                String sql22 = "SELECT Day, 8_9, 9_10, 10_11, 11_12, 1_2, 2_3, 3_4 FROM timetable_"+sectionList.get(i)+" WHERE Grade = '"+gradeList.get(k) +"'";

                                System.out.println("sql22:"+sql22);
                                
                                ResultSet rs22 = obj.codeselect(sql22);
                               
                                ArrayList subwholeList1 =  new ArrayList();                                   
                                ArrayList gradwholeList1 =  new ArrayList();
                            
                                while(rs22.next())
                                {
                                    ArrayList subvisewholeList =  new ArrayList();
                                    ArrayList gradvisewholeList =  new ArrayList();
                                        
                                    for(int j = 0; j < subjectList.size(); j++)
                                    {
                                        ArrayList<String> subviseList =  new ArrayList<String>();
                                        ArrayList<String> gradviseList =  new ArrayList<String>();                                                 
                                        
                                        if(rs22.getString("8_9").equals(subjectList.get(j)))
                                        {                                        
                                            subviseList.add(subjectList.get(j)+"");                                                                                                                                                     
                                        }
                                        else
                                        {                                                                                                               
                                            subviseList.add("0");                                                                                                                       
                                        }

                                        if(rs22.getString("9_10").equals(subjectList.get(j)))
                                        {                                        
                                            subviseList.add(subjectList.get(j)+"");                                                                                                                          
                                        }
                                        else
                                        {                          
                                            subviseList.add("0");                                                                                                                  
                                        }

                                        if(rs22.getString("10_11").equals(subjectList.get(j)))
                                        {                                        
                                            subviseList.add(subjectList.get(j)+"");                                                                                                                         
                                        }
                                        else
                                        {                                                                                                                 
                                            subviseList.add("0");                                                                                                                           
                                        }

                                        if(rs22.getString("11_12").equals(subjectList.get(j)))
                                        {                                        
                                            subviseList.add(subjectList.get(j)+"");                                                                                                                             
                                        }
                                        else
                                        {                                                                                                                        
                                            subviseList.add("0");                                                                                                                       
                                        }

                                        if(rs22.getString("1_2").equals(subjectList.get(j)))
                                        {                                       
                                            subviseList.add(subjectList.get(j)+"");                                                                                                                      
                                        }
                                        else
                                        {                                                                                                                    
                                            subviseList.add("0");                                                                                                                            
                                        }

                                        if(rs22.getString("2_3").equals(subjectList.get(j)))
                                        {                                        
                                            subviseList.add(subjectList.get(j)+"");                                                                                                                             
                                        }
                                        else
                                        {                                                                                                                   
                                            subviseList.add("0");                                                                                                                         
                                        }

                                        if(rs22.getString("3_4").equals(subjectList.get(j)))
                                        {                                      
                                            subviseList.add(subjectList.get(j)+"");                                                                                                                                                                          
                                        } 
                                        else
                                        {                                                                                                                    
                                            subviseList.add("0");                                                                                                                             
                                        }
                                        
                                        gradviseList.add(gradeList.get(k));

                                        // add subject wise list 
                                        subvisewholeList.add(subviseList); 
                                        gradvisewholeList.add(gradviseList);                                                                                                                                                                                                                                              
                                     } 
                                      
                                     //add grade wise
                                     subwholeList1.add(subvisewholeList);
                                     gradwholeList1.add(gradvisewholeList);
                                 }
                                 
                                   rs22.close();

                                
                                  //according to section
                                  secwholeList.add(subwholeList1);
                                  gradewholeList.add(gradwholeList1);
                               }
                             
                            int g1 = 0;
                            int h1 = 0;
                            int g = 0;
                            int h = 0;
                                    
                            for(int p = 0; p < secwholeList.size(); p++)
                            {
                                ArrayList objArrayList = (ArrayList)secwholeList.get(i);
                                ArrayList objgArrayList = (ArrayList)gradewholeList.get(i);
                                
                                for(int q = 0; q < objArrayList.size(); q++)
                                {
                                    ArrayList objArrayList1 = (ArrayList)objArrayList.get(q);
                                    ArrayList objgArrayList1 = (ArrayList)objgArrayList.get(q);
                                     
                                    ArrayList<String> objArrayList2 = (ArrayList<String>)objArrayList1.get(0);
                                    ArrayList<String> objgArrayList2 = (ArrayList<String>)objgArrayList1.get(0);
                                           
                                    System.out.println(i+":"+objArrayList2);            
                                   
                                        //insert
                                                                                                       
                                        int j = 0;
                                        
                                        if(g1 <= 4)
                                        {                                                                       
                                             j = 0;
                                        }
                                        else
                                        {
                                              j = 6;
                                        }
                                        
                                       
                                        String sql4  = "INSERT INTO timetable_"+rs.getString("FullName")+" (Day, 8_9, 9_10, 10_11, 11_12, 1_2, 2_3, 3_4, gradeid, sectionid) "
                                        + "VALUES ('"+ weeklist.get(g1) +"',  '"+objArrayList2.get(h1++)+"', '"+objArrayList2.get(h1++)+"', '"+objArrayList2.get(h1++)+"', '"+objArrayList2.get(h1++)+"', '"+objArrayList2.get(h1++)+"', '"+objArrayList2.get(h1++)+"', '"+objArrayList2.get(h1++)+"', '"+objgArrayList2.get(j)+"', '"+sectionidList.get(p)+"')";

                                        System.out.println("sql4:"+sql4);
                                        
                                        obj.codeupdate(sql4);
                                        
                                        g1++; 
                                        
                                        if(g1 == 5)
                                        {
                                            g1 = 0;
                                        }
                                                                                
                                        h1 = 0;                                                                        
                                    
                                    //update
                                    ArrayList<String> objArrayList3 = (ArrayList<String>)objArrayList1.get(1);
                                    ArrayList<String> objgArrayList3 = (ArrayList<String>)objgArrayList1.get(1);
                                  
                                      int f = 0;
                                      
                                      String sql5 = "UPDATE timetable_"+rs.getString("FullName")+""
                                                + " SET  ";
                                                
                                                f = h++;
                                                if(!objArrayList3.get(f).equalsIgnoreCase("0"))
                                                sql5 += " 8_9 = '"+objArrayList3.get(f) +"', ";
                                                
                                                f = h++;
                                                if(!objArrayList3.get(f).equalsIgnoreCase("0"))
                                                sql5 += " 9_10 = '"+objArrayList3.get(f) +"', ";
                                      
                                                f = h++;
                                                if(!objArrayList3.get(f).equalsIgnoreCase("0"))
                                                sql5 += " 10_11 = '"+objArrayList3.get(f) +"', ";
                                      
                                                f = h++;
                                                if(!objArrayList3.get(f).equalsIgnoreCase("0"))
                                                sql5 += " 11_12 = '"+objArrayList3.get(f) +"', ";
                                      
                                                f = h++;
                                                if(!objArrayList3.get(f).equalsIgnoreCase("0"))
                                                sql5 += " 1_2 = '"+objArrayList3.get(f) +"', ";
                                      
                                                f = h++;
                                                if(!objArrayList3.get(f).equalsIgnoreCase("0"))
                                                sql5 += " 2_3 = '"+objArrayList3.get(f) +"', ";
                                      
                                                f = h++;
                                                if(!objArrayList3.get(f).equalsIgnoreCase("0"))
                                                sql5 += " 3_4 = '"+objArrayList3.get(f) +"', ";
                                                 
                                                String query = sql5.substring(0, sql5.length() - 2);
                                                
                                                System.out.println("query:"+query);
                                                
                                        if(g <= 4)
                                        {                                                                       
                                              query += " WHERE gradeid = '"+objgArrayList3.get(0)+"' ";
                                        }
                                        else
                                        {
                                              query += " WHERE gradeid = '"+objgArrayList3.get(6)+"' ";
                                        }
                                                                                          
                                              query += " AND sectionid = '"+sectionidList.get(p)+"' "
                                                      + " AND Day = '"+weeklist.get(g)+"' ";
                                        
                                        obj.codeupdate(query);
                                                                               
                                        g++;
                                              
                                        if(g == 5)
                                        {
                                            g = 0;
                                        }
                                              
                                        h = 0;                                                                                                              
                                }                                                          
                            }
                        }                                                                                                                                                                                                                                                                    
                   }  
                   
            rs.close();
                                                               
           %>
               <jsp:forward page="gentimetable.jsp">
                   <jsp:param name="msg" value="Time Table Generated Sucessfully!"></jsp:param>               
               </jsp:forward>
           <%

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }    
    
%>