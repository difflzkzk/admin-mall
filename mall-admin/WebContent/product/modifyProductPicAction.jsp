<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	// 1. 상품아이디와 이미지파일을 받는다.
	// 2. 이미지파일을 서버 /images폴더에 새로운이름으로 저장
	// 3. 저장된 이미지의 이름을 상품테이블에서 수정한다. ex) default.jpg -> 새로생성된 이름으로 변경
	
	/* <form enctype="multipart/form-data">방식은 기존방식 사용 불가  
	String productId = request.getParameter("prodcutId");
	String productPic = request.getParameter("prodcutPic");
	System.out.println(productId+"<--productId"); // null
	System.out.println(productPic+"<--productPic"); // null
	*/
	
	// cos.jar 외부라이브러리 사용(내부 라이브러리 사용도 가능하지만 사용방법이 복잡)
	int size = 1024 * 1024 *100; // 100M
	String path = application.getRealPath("images"); // D:\javawork\mall-admin\WebContent\images
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	
	int productId = Integer.parseInt(multi.getParameter("productId"));
	System.out.println(productId+"<--productId"); 
	// System.out.println(multi.getOriginalFileName("productPic")+"<-- 파일원본이름");
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic")+"<-- 새로생성된파일이름");
	Product product = new Product();	
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	// update product set product_pic=? where product_id=?
	// productDao.updateProductPic(product); 
%>
