<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
    <head profile="http://gmpg.org/xfn/11">
        <title>Time Table Task</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="imagetoolbar" content="no" />
        <link rel="stylesheet" href="styles/layout.css" type="text/css" />
        <%@page errorPage="ErrorPage.jsp"%>
        <%@page session="true" %>
    </head>
    <body id="top">
        <div class="wrapper row1">
            <div id="header" class="clear">
                <div class="fl_left">
                    <h1><a href="index.jsp">Time Table Task</a></h1>
                    <p>Information System
                        <span style="padding-left: 250px; color: red;"> Welcome : <%=session.getAttribute("x")%></span>
                    </p>
                </div>
                <div class="fl_right">
                    
                </div>
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper row2">
            <div class="rnd">
                <!-- ###### -->
                <div id="topnav">
                    <ul>
                        <li><a href="userprofile.jsp">USER PROFILE</a></li>
                        <li><a href="teacherprofile.jsp">ADD TEACHER PROFILE</a></li>
                        <li><a href="viewteacherprofile.jsp">VIEW TEACHER'S PROFILE</a></li> 
                        <li><a href="gentimetable.jsp">GENERATE TIME TABLE</a></li>                               
                        <li class="last"><a href="Signout.jsp">Sign Out</a></li>
                    </ul>
                </div>
                <!-- ###### -->
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper row3">
            <div class="rnd">
                <div id="container" class="clear">
                    <!-- ####################################################################################################### -->
                    <h1>View Absent Teacher Time Table</h1>
                   
                  <form action="codecoverlessons.jsp" method="post">
                    
                  <table align="center" border="0px" width="100px">

                      <tr>
                      <td>Absent Teacher Name</td>
                      <td><select name="name" style="width:340px;">       
                               <option value="-select-">-select-</option>
                              <%
                              try
                              {
                                  ResultSet rs = null;

                                  String sql = "SELECT teacherid, FullName FROM teacherinfo";

                                  DatabaseFile obj = new DatabaseFile();

                                  rs = obj.codeselect(sql);

                                  while(rs.next())
                                  {
                                      %>
                                      <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                                      <%
                                  }
                                rs.close();

                              }
                              catch(Exception e)
                              {
                              e.printStackTrace();    
                              }
                              %>
                          </select>
                      </td>
                  </tr>
                   
                 <tr>
                    <td>Lessons To cover:</td><td><input type="text" name="fullname" size="54px"/></td>
                 </tr>
                          
                   <tr>
                      <td>Day</td>
                      <td><select name="day" style="width:340px;">       
                               <option value="-select-">-select-</option>
                               <option value="Sunday">Sunday</option>
                               <option value="Monday">Monday</option>
                               <option value="Tueday">Tueday</option>
                               <option value="Wednesday">Wednesday</option>
                               <option value="Thursday">Thursday</option>
                              
                          </select>
                      </td>
                  </tr>                                          
                         
                  <tr>
                      <td>&nbsp;</td>
                      <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                  </tr>
              
                  </table>

                   <br/>
                   
                    <%                        
                        try
                        {
                            if((!request.getParameter("name").equalsIgnoreCase("-select-")) && (!request.getParameter("day").equalsIgnoreCase("-select-")))
                             {
                                 int g = 1;
                             
                                 out.println("<table border='2px' align='center'>");
                                 out.println("<tr>");
                                 out.println("<th>Sno</th>");
                                 out.println("<th>Day</th>");                
                                 out.println("<th>8 to 9 am</th>");
                                 out.println("<th>9 to 10 am</th>");
                                 out.println("<th>10 to 11 am</th>");
                                 out.println("<th>11 to 12 am</th>");                                
                                 out.println("<th>01 to 02 pm</th>"); 
                                 out.println("<th>02 to 03 pm</th>"); 
                                 out.println("<th>03 to 04 pm</th>");                                                                                                                                                                                                                        
                                 out.println("</tr>");

                                 String sql = "SELECT DISTINCT 8_9, 9_10, 10_11, 11_12, 1_2, 2_3, 3_4, Day FROM timetable_"+request.getParameter("name").toString().trim() + " WHERE Day='"+request.getParameter("day").toString().trim()+"' GROUP BY Day ";

                                 System.out.println(sql);
                                 
                                 DatabaseFile objDatabaseFile = new DatabaseFile();

                                 ResultSet rs = objDatabaseFile.codeselect(sql);
                            
                                 while(rs.next())
                                 {      
                                    String s1 = rs.getString("8_9").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("8_9");
                                    String s2 = rs.getString("9_10").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("9_10");
                                    String s3 = rs.getString("10_11").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("10_11");
                                    String s4 = rs.getString("11_12").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("11_12");
                                    String s5 = rs.getString("1_2").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("1_2");
                                    String s6 = rs.getString("2_3").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("2_3");
                                    String s7 = rs.getString("3_4").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("3_4");                                
                                                     
                                     String sql1 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s1+"'";

                                                ResultSet rs1 = objDatabaseFile.codeselect(sql1);

                                                while (rs1.next()) 
                                                {
                                                    s1 = rs1.getString("subjectname");
                                                    
                                                    String sql21 = "SELECT teacherid FROM teacher_subjects "
                                                            + "WHERE subjectid = '"+rs1.getInt("subjectid") +"'";
                                                    
                                                    ResultSet rs21 = objDatabaseFile.codeselect(sql21);
                                                    
                                                    int i = 0;                                                    
                                                    int h = 0;
                                                            
                                                    while (rs21.next()) 
                                                    {
                                                        int teacherid = rs21.getInt("teacherid");
                                                        
                                                        String sql22 = "SELECT FullName FROM teacherinfo WHERE teacherid = '"+teacherid+"' ";
                                                        
                                                        ResultSet rs22 = objDatabaseFile.codeselect(sql22);
                                                    
                                                        while (rs22.next()) 
                                                        {                                                          
                                                            System.out.println("FullName"+rs22.getString("FullName"));
                                                            
                                                            if(!rs22.getString("FullName").equalsIgnoreCase(request.getParameter("name").toString().trim()))
                                                            {                                                                                                                                                                                    
                                                                 String sql23 = "SELECT 8_9 FROM timetable_"+rs22.getString("FullName")
                                                                         +" WHERE Day = '"+request.getParameter("day")+"' ";

                                                                 ResultSet rs23 = objDatabaseFile.codeselect(sql23);

                                                                 while (rs23.next()) 
                                                                 {
                                                                     if(rs23.getString("8_9").equalsIgnoreCase("0"))
                                                                     {
                                                                         s1 = rs22.getString("FullName");                                                                          
                                                                         h++;
                                                                     }
                                                                 }

                                                                 rs23.close();   
                                                            }
                                                            else
                                                            {
                                                                if(h == 0)
                                                                {
                                                                    s1 += "(No Teacher Available.)";                                                                     
                                                                }
                                                            }                                                                                                                                                                                                                                                    
                                                        }
                                                        
                                                        rs22.close();
                                                        
                                                        i++;
                                                    }
                                                    
                                                    if(i == 0)
                                                    {                                                        
                                                        s1 += "(No Teacher Available.)";
                                                    }
                                                }

                                                String sql2 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s2+"'";

                                                ResultSet rs2 = objDatabaseFile.codeselect(sql2);

                                                while (rs2.next()) 
                                                {
                                                    s2 = rs2.getString("subjectname");
                                                    
                                                    String sql31 = "SELECT teacherid FROM teacher_subjects "
                                                            + "WHERE subjectid = '"+rs2.getInt("subjectid") +"'";
                                                    
                                                    ResultSet rs31 = objDatabaseFile.codeselect(sql31);
                                                    
                                                    int i = 0;
                                                    int h = 0;
                                                    
                                                    while (rs31.next()) 
                                                    {
                                                        int teacherid = rs31.getInt("teacherid");
                                                        
                                                        String sql32 = "SELECT FullName FROM teacherinfo WHERE teacherid = '"+teacherid+"'";
                                                        
                                                        ResultSet rs32 = objDatabaseFile.codeselect(sql32);
                                                    
                                                        while (rs32.next()) 
                                                        {
                                                            if(!rs32.getString("FullName").equalsIgnoreCase(request.getParameter("name").toString().trim()))
                                                            {
                                                                 String sql33 = "SELECT 9_10 FROM  timetable_"+rs32.getString("FullName")
                                                                         +" WHERE Day = '"+request.getParameter("day")+"' ";

                                                                 ResultSet rs33 = objDatabaseFile.codeselect(sql33);

                                                                 while (rs33.next()) 
                                                                 {
                                                                     if(rs33.getString("9_10").equalsIgnoreCase("0"))
                                                                     {
                                                                         s2 = rs32.getString("FullName");
                                                                        h++;                                                                         
                                                                     }
                                                                 }

                                                                 rs33.close(); 
                                                            } 
                                                            else
                                                            {
                                                                if(h == 0)
                                                                {
                                                                    s2 += "(No Teacher Available.)"; 
                                                                }
                                                            }                                                                                                                               
                                                        }
                                                        
                                                        rs32.close();    
                                                        
                                                        i++;
                                                    }
                                                    
                                                    if(i == 0)
                                                    {                                                        
                                                        s2 += "(No Teacher Available.)";
                                                    }
                                                }

                                                String sql3 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s3+"'";

                                                ResultSet rs3 = objDatabaseFile.codeselect(sql3);

                                                while (rs3.next()) 
                                                {
                                                    s3 = rs3.getString("subjectname");
                                                    
                                                    String sql41 = "SELECT teacherid FROM teacher_subjects "
                                                            + "WHERE subjectid = '"+rs3.getInt("subjectid") +"'";
                                                    
                                                    ResultSet rs41 = objDatabaseFile.codeselect(sql41);
                                                    
                                                    int i = 0;
                                                    int h = 0;
                                                    
                                                    while (rs41.next()) 
                                                    {
                                                        int teacherid = rs41.getInt("teacherid");
                                                        
                                                        String sql42 = "SELECT FullName FROM teacherinfo WHERE teacherid = '"+teacherid+"'";
                                                        
                                                        ResultSet rs42 = objDatabaseFile.codeselect(sql42);
                                                    
                                                        while (rs42.next()) 
                                                        {
                                                            if(!rs42.getString("FullName").equalsIgnoreCase(request.getParameter("name").toString().trim()))
                                                            {
                                                                 String sql43 = "SELECT 10_11 FROM  timetable_"+rs42.getString("FullName")
                                                                         +" WHERE Day = '"+request.getParameter("day")+"' ";

                                                                 ResultSet rs43 = objDatabaseFile.codeselect(sql43);

                                                                 while (rs43.next()) 
                                                                 {
                                                                     if(rs43.getString("10_11").equalsIgnoreCase("0"))
                                                                     {
                                                                         s3 = rs42.getString("FullName"); 
                                                                         h++;
                                                                     }
                                                                 }

                                                                 rs43.close(); 
                                                            } 
                                                            else
                                                            {
                                                                if(h == 0)
                                                                {
                                                                    s3 += "(No Teacher Available.)"; 
                                                                }
                                                            }                                                                                                                               
                                                        }
                                                        
                                                        rs42.close();    
                                                        
                                                        i++;
                                                    }
                                                    
                                                    if(i == 0)
                                                    {                                                        
                                                        s3 += "(No Teacher Available.)";
                                                    }
                                                }

                                                String sql4 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s4+"'";

                                                ResultSet rs4 = objDatabaseFile.codeselect(sql4);

                                                while (rs4.next()) 
                                                {
                                                    s4 = rs4.getString("subjectname");
                                                    
                                                    String sql51 = "SELECT teacherid FROM teacher_subjects "
                                                            + "WHERE subjectid = '"+rs4.getInt("subjectid") +"'";
                                                    
                                                    ResultSet rs21 = objDatabaseFile.codeselect(sql51);
                                                    
                                                    int i = 0;
                                                    int h = 0;
                                                    
                                                    while (rs21.next()) 
                                                    {
                                                        int teacherid = rs21.getInt("teacherid");
                                                        
                                                        String sql52 = "SELECT FullName FROM teacherinfo WHERE teacherid = '"+teacherid+"'";
                                                        
                                                        ResultSet rs52 = objDatabaseFile.codeselect(sql52);
                                                    
                                                        while (rs52.next()) 
                                                        {
                                                            if(!rs52.getString("FullName").equalsIgnoreCase(request.getParameter("name").toString().trim()))
                                                            {
                                                                 String sql53 = "SELECT 11_12 FROM  timetable_"+rs52.getString("FullName")
                                                                         +" WHERE Day = '"+request.getParameter("day")+"' ";

                                                                 ResultSet rs53 = objDatabaseFile.codeselect(sql53);

                                                                 while (rs53.next()) 
                                                                 {
                                                                     if(rs53.getString("11_12").equalsIgnoreCase("0"))
                                                                     {
                                                                         s4 = rs52.getString("FullName"); 
                                                                         h++;
                                                                     }
                                                                 }
                                                                  rs53.close();    
                                                             }  
                                                             else
                                                             {
                                                                if(h == 0)
                                                                {
                                                                    s4 += "(No Teacher Available.)"; 
                                                                }
                                                             }                                                                                                                                                                                    
                                                        }
                                                        
                                                        rs52.close();    
                                                        
                                                        i++;
                                                    }
                                                    
                                                    if(i == 0)
                                                    {                                                        
                                                        s4 += "(No Teacher Available.)";
                                                    }
                                                }

                                                String sql5 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s5+"'";

                                                ResultSet rs5 = objDatabaseFile.codeselect(sql5);

                                                while (rs5.next()) 
                                                {
                                                    s5 = rs5.getString("subjectname");
                                                    
                                                    String sql21 = "SELECT teacherid FROM teacher_subjects "
                                                            + "WHERE subjectid = '"+rs5.getInt("subjectid") +"'";
                                                    
                                                    ResultSet rs21 = objDatabaseFile.codeselect(sql21);
                                                    
                                                    int i = 0;
                                                    int h = 0;
                                                    
                                                    while (rs21.next()) 
                                                    {
                                                        int teacherid = rs21.getInt("teacherid");
                                                        
                                                        String sql62 = "SELECT FullName FROM teacherinfo WHERE teacherid = '"+teacherid+"'";
                                                        
                                                        ResultSet rs62 = objDatabaseFile.codeselect(sql62);
                                                    
                                                        while (rs62.next()) 
                                                        {
                                                            if(!rs62.getString("FullName").equalsIgnoreCase(request.getParameter("name").toString().trim()))
                                                            {
                                                                 String sql63 = "SELECT 1_2 FROM  timetable_"+rs62.getString("FullName")
                                                                         +" WHERE Day = '"+request.getParameter("day")+"' ";

                                                                 ResultSet rs63 = objDatabaseFile.codeselect(sql63);

                                                                 while (rs63.next()) 
                                                                 {
                                                                     if(rs63.getString("1_2").equalsIgnoreCase("0"))
                                                                     {
                                                                         s5 = rs62.getString("FullName"); 
                                                                         h++;
                                                                     }
                                                                 }

                                                                 rs63.close();  
                                                             }
                                                             else
                                                             {
                                                                if(h == 0)
                                                                {
                                                                    s5 += "(No Teacher Available.)"; 
                                                                }
                                                             }                                                                                                                               
                                                        }
                                                        
                                                        rs62.close();    
                                                        
                                                        i++;
                                                    }
                                                    
                                                    if(i == 0)
                                                    {                                                        
                                                        s5 += "(No Teacher Available.)";
                                                    }
                                                }

                                                String sql6 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s6+"'";

                                                ResultSet rs6 = objDatabaseFile.codeselect(sql6);

                                                while (rs6.next()) 
                                                {
                                                    s6 = rs6.getString("subjectname");
                                                    
                                                    String sql21 = "SELECT teacherid FROM teacher_subjects "
                                                            + "WHERE subjectid = '"+rs6.getInt("subjectid") +"'";
                                                    
                                                    ResultSet rs21 = objDatabaseFile.codeselect(sql21);
                                                    
                                                    int i = 0;
                                                    int h = 0;
                                                    
                                                    while (rs21.next()) 
                                                    {
                                                        int teacherid = rs21.getInt("teacherid");
                                                        
                                                        String sql72 = "SELECT FullName FROM teacherinfo WHERE teacherid = '"+teacherid+"'";
                                                        
                                                        ResultSet rs72 = objDatabaseFile.codeselect(sql72);
                                                    
                                                        while (rs72.next()) 
                                                        {
                                                            if(!rs72.getString("FullName").equalsIgnoreCase(request.getParameter("name").toString().trim()))
                                                            {
                                                                 String sql73 = "SELECT 2_3 FROM  timetable_"+rs72.getString("FullName")
                                                                         +" WHERE Day = '"+request.getParameter("day")+"' ";

                                                                 ResultSet rs73 = objDatabaseFile.codeselect(sql73);

                                                                 while (rs73.next()) 
                                                                 {
                                                                     if(rs73.getString("2_3").equalsIgnoreCase("0"))
                                                                     {
                                                                         s6 = rs72.getString("FullName"); 
                                                                         h++;
                                                                     }
                                                                 }

                                                                 rs73.close();   
                                                            }
                                                            else
                                                            {
                                                                if(h == 0)
                                                                {
                                                                    s6 += "(No Teacher Available.)"; 
                                                                }
                                                            }                                                                                                                              
                                                        }
                                                        
                                                        rs72.close();    
                                                        
                                                        i++;
                                                    }
                                                    
                                                    if(i == 0)
                                                    {                                                        
                                                        s6 += "(No Teacher Available.)";
                                                    }
                                                }

                                                String sql7 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s7+"'";

                                                ResultSet rs7 = objDatabaseFile.codeselect(sql7);

                                                while (rs7.next()) 
                                                {
                                                    s7 = rs7.getString("subjectname");
                                                    
                                                    String sql81 = "SELECT teacherid FROM teacher_subjects "
                                                            + "WHERE subjectid = '"+rs7.getInt("subjectid") +"'";
                                                    
                                                    ResultSet rs81 = objDatabaseFile.codeselect(sql81);
                                                    
                                                    int i = 0;
                                                    int h = 0;
                                                    
                                                    while (rs81.next()) 
                                                    {
                                                        int teacherid = rs81.getInt("teacherid");
                                                        
                                                        String sql82 = "SELECT FullName FROM teacherinfo WHERE teacherid = '"+teacherid+"'";
                                                        
                                                        ResultSet rs82 = objDatabaseFile.codeselect(sql82);
                                                    
                                                        while (rs82.next()) 
                                                        {
                                                            if(!rs82.getString("FullName").equalsIgnoreCase(request.getParameter("name").toString().trim()))
                                                            {
                                                                 String sql83 = "SELECT 3_4 FROM timetable_"+rs82.getString("FullName")
                                                                         +" WHERE Day = '"+request.getParameter("day")+"' ";

                                                                 ResultSet rs83 = objDatabaseFile.codeselect(sql83);

                                                                 while (rs83.next()) 
                                                                 {
                                                                     if(rs83.getString("3_4").equalsIgnoreCase("0"))
                                                                     {
                                                                         s7 = rs82.getString("FullName"); 
                                                                         h++;
                                                                     }
                                                                 }

                                                                 rs83.close(); 
                                                             }
                                                             else
                                                             {
                                                                if(h == 0)
                                                                {
                                                                    s7 += "(No Teacher Available.)"; 
                                                                }
                                                             }                                                                                                                                
                                                        }
                                                        
                                                        rs82.close();    
                                                        
                                                        i++;
                                                    }
                                                    
                                                    if(i == 0)
                                                    {                                                        
                                                        s7 += "(No Teacher Available.)";
                                                    }
                                                }                                                

                                     out.println("<tr><td>" + g++ + "</td><td>" 
                                             + rs.getString("Day") + "</td><td>" 
                                             + s1 + "</td><td>" 
                                             + s2 +  "</td><td>" 
                                             + s3 +  "</td><td>" 
                                             + s4 +  "</td><td>" 
                                             + s5 +  "</td><td>" 
                                             + s6 +  "</td><td>" 
                                             + s7 +  "</td>"                                                                                                                                  
                                             + "</tr>");
                                 }
                                
                                 rs.close();

                                 out.println("</table>");
                             }
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                    %>
                    </div>

                    <%
                        //getting response
                        try {
                            out.println("<font color = 'red'>");

                            if ((request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals("")))) {
                                out.println(request.getParameter("msg"));
                            }

                            out.println("</font>");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>                   
                </div>                
         </div>              
    </body>
</html>
