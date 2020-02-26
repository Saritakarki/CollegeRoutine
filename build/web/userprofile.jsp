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
                        <li class="active"><a href="userprofile.jsp">USER PROFILE</a></li>
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
                    <h1>User's Profile</h1>
                   
                    <%
                        try
                        {
                                 int g = 1;
                             
                                 out.println("<table border='2px' align='center'>");
                                 out.println("<tr>");
                                 out.println("<th>Sno</th>");
                                 out.println("<th>Name</th>");                
                                 out.println("<th>PhoneNo</th>");
                                 out.println("<th>Email</th>");
                                 out.println("<th>Address</th>");                              
                                 out.println("</tr>");

                                 String sql = "SELECT * "
                                         + "FROM userinfo "
                                         + "WHERE UserName = '" + session.getAttribute("x") + "' ";

                                 DatabaseFile objDatabaseFile = new DatabaseFile();

                                 ResultSet rs = objDatabaseFile.codeselect(sql);
                            
                                 while(rs.next())
                                 {                                   
                                     out.println("<tr><td>" + g++ + "</td><td>" + rs.getString("Name") + "</td><td>" + rs.getString("PhoneNo") + "</td><td>" + rs.getString("Email") +  "</td><td>" + rs.getString("Address") + "</td></tr>");
                                 }
                                
                                 rs.close();
                                 
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
