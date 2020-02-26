<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Time Table Task</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<%@page errorPage="ErrorPage.jsp"%>
<%@page session="true"%>
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
    <div class="fl_right"></div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row2">
  <div class="rnd">
    <!-- ###### -->
    <div id="topnav">
      <ul>        
        <li class="active"><a href="Signout.jsp">Sign Out</a></li>
      </ul>
    </div>
    <!-- ###### -->
  </div>
</div>
<!--####################################################################################################### -->
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
       <!--####################################################################################################### -->
       <h1>Time Table Manager</h1>
            
      <form action="#" method="post">
          
          <table align="center" border="0px" width="100px">
              
              <tr>
                  <td>&nbsp;</td>
                  <td><a href="logout.jsp">Would u like to signout completely</a></td>
              </tr>
              
          </table>
          
      </form>
               
      </div>
      
      <%
      //getting response
      try
      {
          if( (request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals(""))) )
          {
              out.println(request.getParameter("msg"));
          }
      }
      catch(Exception e)
      {
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
