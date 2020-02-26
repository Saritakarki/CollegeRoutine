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
                    <h1><a href="index.jsp">Time Table Manager</a></h1>
                    <p>Department of Computer Science
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
                        <li class="active"><a href="viewteacherprofile.jsp">VIEW TEACHER'S PROFILE</a></li>                         
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
                    <h1>VIEW TEACHER'S PROFILE</h1>
                   
                    <%
                        try
                        {
                                 int g = 1;
                             
                                 out.println("<table border='2px' align='center'>");
                                 out.println("<tr>");
                                 out.println("<th>Sno</th>");
                                 out.println("<th>Full Name</th>");                
                                 out.println("<th>Age</th>");
                                 out.println("<th>IP Address</th>");
                                 out.println("<th>Contact No</th>");
                                 out.println("<th>Address</th>");                                               
                                 out.println("<th>Subjects</th>"); 
                                 out.println("<th>Grades</th>"); 
                                 out.println("<th>Sections</th>");                                                               
                                 out.println("<th>Edit</th>");                                                                                                                             
                                 out.println("<th>Delete</th>");                                                                                                                             
                                 out.println("</tr>");

                                 String sql = "SELECT * "
                                         + "FROM teacherinfo ";

                                 DatabaseFile objDatabaseFile = new DatabaseFile();

                                 ResultSet rs = objDatabaseFile.codeselect(sql);
                            
                                 while(rs.next())
                                 {       
                                    //subject
                                     String sql1 = "SELECT s.subjectname "
                                             + "FROM teacher_subjects AS t "
                                             + "LEFT JOIN subject AS s ON s.subjectid = t.subjectid "
                                             + "WHERE t.teacherid = '"+rs.getInt("teacherid") +"' ";
                                     
                                     ResultSet rs1 = objDatabaseFile.codeselect(sql1);
                                     
                                     String s1 = "<table border='2px' align='center'>";
                                     
                                     while(rs1.next())
                                     {                                                 
                                         s1 += "<tr>";
                                         s1 += "<td>"+rs1.getString(1)+"</td>";
                                         s1 += "</tr>";                                         
                                     }
                                     rs1.close();
                                     s1 += "</table>";
                                     
                                     //grade
                                     String sql2 = "SELECT s.gradename "
                                             + "FROM teacher_grades AS t "
                                             + "LEFT JOIN grade AS s ON s.gradeid = t.gradeid "
                                             + "WHERE t.teacherid = '"+rs.getInt("teacherid") +"' ";
                                     
                                     ResultSet rs2 = objDatabaseFile.codeselect(sql2);
                                     
                                     String s2 = "<table border='2px' align='center'>";
                                     
                                     while(rs2.next())
                                     {                                                 
                                         s2 += "<tr>";
                                         s2 += "<td>"+rs2.getString(1)+"</td>";
                                         s2 += "</tr>";                                         
                                     }
                                     rs2.close();
                                     s2 += "</table>";
                                     
                                     //section
                                     String sql3 = "SELECT s.sectionsname "
                                             + "FROM teacher_sections AS t "
                                             + "LEFT JOIN sections AS s ON s.sectionid = t.sectionid "
                                             + "WHERE t.teacherid = '"+rs.getInt("teacherid") +"' ";
                                     
                                     ResultSet rs3 = objDatabaseFile.codeselect(sql3);
                                     
                                     String s3 = "<table border='2px' align='center'>";
                                     
                                     while(rs3.next())
                                     {                                                 
                                         s3 += "<tr>";
                                         s3 += "<td>"+rs3.getString(1)+"</td>";
                                         s3 += "</tr>";                                         
                                     }
                                     rs2.close();
                                     s3 += "</table>";
                                   
                                     out.println("<tr><td>" + g++ 
                                             + "</td><td>" + rs.getString("FullName") 
                                             + "</td><td>" + rs.getString("Age") 
                                             + "</td><td>" + rs.getString("IPAddress")
                                             + "</td><td>" + rs.getString("ContactNo")
                                             + "</td><td>" + rs.getString("Address")                                                                                    
                                             + "</td><td>" + s1.toString()
                                             + "</td><td>" + s2.toString()
                                             + "</td><td>" + s3.toString()                                                                                                                
                                             + "</td><td>" + rs.getString("Grade")                                                                                                                                                                                                                                                                                                                                                                                                           
                                             + "<td><a href='teacherprofileedit.jsp?index="+ rs.getInt("teacherid") +"'><img src='images/Edit.png'></img></a></td>" 
                                             + "<td><a href='codeDelete.jsp?index="+ rs.getInt("teacherid") +"'><img src='images/Delete.png'></img></a></td>"                                                                                                                                                                                                                            
                                             + "</td></tr>");
                                     s1 = null;
                                     s2 = null;
                                     s3 = null;
                                 }
                                
                                 rs.close();
                                 
                                 if(g == 1)
                                 {
                                      out.println("<tr>"
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td style='color: red;'> Not Result Found! </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"    
                                                + "<td> &nbsp; </td>"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                                                + "</tr>");
                                 }
                                 out.println("</table>");
                                 
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
                <div class="wrapper row2">
  <div class="rnd">
    <!-- ###### -->
    <div id="topnav">
      <ul>
          <li class="active" >&copy;St.Xavier's College Maitighar</li>    
            
      </ul>
    </div>
    <!-- ###### -->
  </div>
</div>
                
    </body>
</html>
