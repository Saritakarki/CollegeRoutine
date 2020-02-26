<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<%
try
{
     //session
     HttpSession hs = request.getSession(true);
       
    //argument
    String username =  hs.getAttribute("x").toString();
        
    //getting values from design page
    String fullname = request.getParameter("fullname");
    String age = request.getParameter("age");
    String nationality = request.getParameter("nationality");
    String contactno = request.getParameter("contactno");   
    String address = request.getParameter("address");
    String passportno = "1222";
    String passportexpy = "2016-09-12";
    String visatype = "HIB";
    String school = "Yes";
    String subjects[] = request.getParameterValues("subjects");
    String grades[] = request.getParameterValues("grades");
    String sections[] = request.getParameterValues("sections");
    String tutor = "y";
    String grade = request.getParameter("grade");
    
    if( ((fullname!=null) && (!fullname.trim().equals(""))) && ((age!=null) && (!age.trim().equals(""))) 
            && ((nationality!=null) && (!nationality.trim().equals(""))) && ((contactno!=null) && (!contactno.trim().equals(""))) 
            && ((address!=null) && (!address.trim().equals(""))) && ((passportno!=null) && (!passportno.trim().equals("")))
            && ((passportexpy!=null) && (!passportexpy.trim().equals(""))) && ((visatype!=null) && (!visatype.trim().equals("")))
            && ((school!=null) && (!school.trim().equals(""))) && ((tutor!=null) && (!tutor.trim().equals("")))
            && ((grade!=null) && (!grade.trim().equals(""))) && (subjects!=null) && (grades!=null) && (sections!=null))
    {        
        //type casting
        Long mobile = Long.parseLong(contactno);
       
        //jdbc connection
        try
        {           
            //calling database class
            DatabaseFile obj = new DatabaseFile();
            
            String sql = "INSERT INTO teacherinfo(FullName, Age, Nationality, ContactNo, Address, PassportNo, PassportExpiryDate, VisaType, SchoolAccommodation, Tutor, Grade, RecordedDate)"
                    + " VALUES('"+fullname+"', '"+age+"', '"+nationality+"', '"+mobile+"', '"+address+"', '"+passportno+"', '"+passportexpy+"', '"+visatype+"', '"+school+"', '"+tutor+"', '"+grade+"', now())";

            obj.codeinsert(sql);
            
            String sql1 = "SELECT teacherid "
                    + "FROM teacherinfo "
                    + "ORDER BY teacherid DESC "
                    + " LIMIT 1";
            
            ResultSet rs = obj.codeselect(sql1);
            
            int teacherid = 0;
            
            while(rs.next())
            {
                teacherid = rs.getInt("teacherid");
            }
            
            rs.close();
                   
            //subjects
            for(int i = 0; i < subjects.length; i++)
            {
                String sql2 = "INSERT INTO teacher_subjects(teacherid, subjectid) VALUES('"+teacherid+"', '"+subjects[i]+"')";
                
                obj.codeinsert(sql2);
            }
            
            //grade
            for(int i = 0; i < grades.length; i++)
            {
                String sql3 = "INSERT INTO teacher_grades(teacherid, gradeid) VALUES('"+teacherid+"', '"+grades[i]+"')";
                
                obj.codeinsert(sql3);
            }
            
            //sections
            for(int i = 0; i < sections.length; i++)
            {
                String sql4 = "INSERT INTO teacher_sections(teacherid, sectionid) VALUES('"+teacherid+"', '"+sections[i]+"')";
                
                obj.codeinsert(sql4);
            }
           
           %>
               <jsp:forward page="viewteacherprofile.jsp">
                   <jsp:param name="msg" value="Account Created Sucessfully!"></jsp:param>               
               </jsp:forward>
           <%

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    else
    {
           %>
           <jsp:forward page="teacherprofile.jsp">
               <jsp:param name="msg" value="Please Fill All Details"></jsp:param>
           </jsp:forward>
           <%
    }
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
%>