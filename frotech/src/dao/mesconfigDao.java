package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
 
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import bean.mesconfig;


public class mesconfigDao {

		 /**
	     * @Fields jdbcTemplate : TODO
	     */

	    private JdbcTemplate jdbcTemplate;

	    /**
	     * spring提供的类
	     * 
	     * @param jdbcTemplate
	     *            返回值类型： void
	     */
	    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
	    	this.jdbcTemplate = jdbcTemplate;
	    }

	    /**
	     * 查询信息
	     * 
	     * @return 返回值类型： List<frotech_config>
	     */
	    public List<mesconfig> queryAll() {
	    String sql = "select title,keyword,description from frotech_config";
	    //将查询结果映射到Student类中，添加到list中，并返回
	    return jdbcTemplate.query(sql, new mesconfigMapper());
	    }
	    /**
	     * 通过关键词查询
	     * 
	     * @param keyword
	     * @return 返回值类型： List<mesconfig>
	     */
	    public List<mesconfig> queryByKeyword(String keyword) {
	    String sql = "select title,keyword,description from frotech_config where keyword like '%" + keyword + "%'";
	    return jdbcTemplate.query(sql, new mesconfigMapper());
	    }
	    /**
	     * 添加学生
	     * 
	     * @param mes
	     * @return 返回值类型： boolean
	     */
	    public boolean addStu(mesconfig mes) {
	    String sql = "insert into frotech_config(title,keyword,description) values(?,?,?)";
	    return jdbcTemplate.update(sql,
	        new Object[] {mes.getTitle(), mes.getKeyword(), mes.getDescription() },
	        new int[] {Types.VARCHAR, Types.VARCHAR, Types.VARCHAR }) == 1;
	    }
	    /**
	     * 删除信息
	     * 
	     * @param title
	     * @param keyword
	     * @param description
	     * @return 返回值类型： boolean
	     */
	    public boolean deleteStu(String keyword) {
	    String sql = "delete from frotech_config where keyword = ?";
	    return jdbcTemplate.update(sql,keyword) == 1;
	    }

	    /**
	     * 更新学生信息
	     * 
	     * @param mes
	     * @return 返回值类型： boolean
	     */
	    public boolean updateStu(mesconfig mes) {
	    String sql = "update frotech_config set title=? ,keyword=?,description= ? ";
	    Object stuObj[] = new Object[] { mes.getTitle(), mes.getKeyword(), mes.getDescription() };
	    return jdbcTemplate.update(sql, stuObj) == 1;
	    }
	    
	    /**
	     * 
	     * mesconfigMapper数据库映射
	     * 
	     * @ClassName mesconfigMapper
	     */

	    class mesconfigMapper implements RowMapper<mesconfig> {

	    @Override
	    public mesconfig mapRow(ResultSet rs, int rowNum) throws SQLException {
	        // TODO Auto-generated method stub
	        mesconfig mes = new mesconfig();
	        mes.setTitle(rs.getString(1));
	        mes.setKeyword(rs.getString(2));
	        mes.setDescription(rs.getString(3));

	        return mes;
	    }

	    }
}
