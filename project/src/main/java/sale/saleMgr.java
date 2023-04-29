package sale;

import java.sql.Connection;
import java.sql.PreparedStatement;

import store.DBConnectionMgr;

public class saleMgr {
	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = 
			"C:/java/JSP/DEC/src/main/webapp/store";
	public static final String ENCODING = "UTF-8";
	public static final int MAXSIZE = 1024*1024*20;//20MB
	
	public saleMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean addSale(saleBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "insert sale(id,productNo,type,quantity,price,paydt,paymethod,paystate)"
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setInt(2, bean.getProductNo());
			pstmt.setInt(3, bean.getType());//영화관람권인지 일반 상품인지 확인
			pstmt.setInt(4, bean.getQuantity());
			pstmt.setInt(5, bean.getPrice());
			pstmt.setString(6, bean.getPaydt());
			pstmt.setInt(7, bean.getPaymethod());
			pstmt.setInt(8, bean.getPaystate());

			if(pstmt.executeUpdate()==1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
		
	}
}
