package com.camping.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
  })
@Log4j2
public class MemberTests {

  @Setter(onMethod_ = @Autowired)
  private PasswordEncoder pwencoder;
  
  @Setter(onMethod_ = @Autowired)
  private DataSource ds;
  
  @Test
  public void testInsertMember() {

    String sql = "insert into member(mem_id, mem_pw, mem_name, mem_email, mem_tel, mem_date) values (?,?,?,?,?,sysdate)";
    
    for(int i = 1; i <= 3; i++) {
      
      Connection con = null;
      PreparedStatement pstmt = null;
      
      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);
        
        pstmt.setString(2, pwencoder.encode("1234"));
        
        if(i == 1) {
          
          pstmt.setString(1, "user");
          pstmt.setString(3,"일반사용자");
          pstmt.setNString(4, "email");
          pstmt.setNString(5, "tel");
          
        }else if (i == 2) {
          
          pstmt.setString(1, "manager");
          pstmt.setString(3,"운영자");
          pstmt.setNString(4, "email");
          pstmt.setNString(5, "tel");
          
        }else {
          
          pstmt.setString(1, "admin");
          pstmt.setString(3,"관리자");
          pstmt.setNString(4, "email");
          pstmt.setNString(5, "tel");
          
        }
        
        pstmt.executeUpdate();
        
      }catch(Exception e) {
        e.printStackTrace();
      }finally {
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }
        
      }
    }//end for
  }
  
  @Test
  public void testInsertAuth() {
    
    
    String sql = "insert into member_auth (mem_id, auth) values (?,?)";
    
    for(int i = 1; i <= 3; i++) {
      
      Connection con = null;
      PreparedStatement pstmt = null;
      
      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);
      
        
        if(i == 1) {
          
          pstmt.setString(1, "user");
          pstmt.setString(2,"ROLE_USER");
          
        }else if (i == 2) {
          
          pstmt.setString(1, "manager");
          pstmt.setString(2,"ROLE_MEMBER");
          
        }else {
          
          pstmt.setString(1, "admin");
          pstmt.setString(2,"ROLE_ADMIN");
          
        }
        
        pstmt.executeUpdate();
        
      }catch(Exception e) {
        e.printStackTrace();
      }finally {
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }
        
      }
    }//end for
  }

  
}


