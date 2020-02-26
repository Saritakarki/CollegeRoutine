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
                        <li><a href="viewtimetable.jsp">VIEW TIME TABLE</a></li>                                                  
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
                  <h1>View Semester Time Table</h1>
                   
                  <form action="codeviewtimetable.jsp" method="post">
                    
                  <table align="center" border="0px" width="100px">

                      <tr>
                      <td>Semester</td>
                      <td><select name="sections" style="width:340px;">  
                              <option value="-select-">-select-</option>
                              <%
                              try
                              {
                                  ResultSet rs = null;

                                  String sql = "SELECT sectionid, sectionsname FROM sections";

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
                          
                  <tr >
                  <td>Department</td>
                  <td><select name="grades" style="width:340px;">  
                           <option value="-select-">-select-</option>
                          <%
                          try
                          {
                              ResultSet rs = null;
                              
                              String sql = "SELECT * FROM grade";
                              
                              DatabaseFile obj = new DatabaseFile();
                              
                              rs = obj.codeselect(sql);
                              
                              while(rs.next())
                              {
                                  %>
                                  <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
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
                      <td>&nbsp;</td>
                      <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                  </tr>
              
                  </table>
                      
                  <br/>
                  <br/>
                  
                  <h1>View Teacher Time Table</h1>
                   
                  <form action="codeviewteachertimetable.jsp" method="post">
                    
                  <table align="center" border="0px" width="100px">

                      <tr>
                      <td>Teacher Name</td>
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
                      <td>&nbsp;</td>
                      <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                  </tr>
              
                  </table>
                          

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
