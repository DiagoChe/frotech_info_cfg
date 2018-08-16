package controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import bean.mesconfig;
import dao.mesconfigDao;

@Controller
public class mesconfigController {
	/**
     * 
     * 从数据库中获取全部配置信息，将数据返回给主页index.jsp
     * 
     * @param model
     * @return 返回值类型： String
     */
	@SuppressWarnings("resource")
	@RequestMapping(value = "/all")
	public String queryAll(Model model) {
	    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
	    //从ioc容器中获取dao
	    mesconfigDao dao = (mesconfigDao) context.getBean("dao");
	    model.addAttribute("mesconfig", dao.queryAll());
	    return "index.jsp"; 
	}
	/**
     * 通过关键词查找信息，使用模糊查找，将结果返回给index.jsp
     * 
     * @param keyword
     * @param model
     * @return 返回值类型： String
     */
    @SuppressWarnings("resource")
	@RequestMapping(value = "/queryByKeyword")
    public String queryByKeyword(String keyword, Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        //从ioc容器中获取dao
        mesconfigDao dao = (mesconfigDao) context.getBean("dao");
        model.addAttribute("mesconfigs", dao.queryByKeyword(keyword));
        return "index.jsp";
    }
    /**
     * 添加新信息，并将结果返回给all页面，由all转发到主页
     * @param title
     * @param keyword
     * @param description
     * @param model
     * @return 返回值类型： String
     */
    @SuppressWarnings("resource")
	@RequestMapping(value = "/add")
    public String addStu(String title, String keyword, String description, Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        mesconfigDao dao = (mesconfigDao) context.getBean("dao");
        mesconfig mes = new mesconfig();
        mes.setTitle(title);
        mes.setKeyword(keyword);
        mes.setDescription(description);
        boolean result = dao.addStu(mes);
        if (result){
            model.addAttribute("msg", "<script>alert('添加成功！')</script>");}
        else{
            model.addAttribute("msg", "<script>alert('添加失败！')</script>");}
        return "/all";
    }
    /**
     * 通过关键词删除信息
     * @param keyword
     * @param model
     * @return 返回值类型： String
     */
    @SuppressWarnings("resource")
	@RequestMapping(value = "/deleteByKeyword")
    public String deleteByKeyword(String keyword, Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        mesconfigDao dao = (mesconfigDao) context.getBean("dao");
        boolean result = dao.deleteStu(keyword);
        if (result)
            model.addAttribute("msg", "<script>alert('删除成功！')</script>");
        else
            model.addAttribute("msg", "<script>alert('删除失败！')</script>");
        return "all";
        }
    /**
     * 编辑更新信息
     * @param title
     * @param keyword
     * @param description
     * @param model
     * @return 返回值类型： String
     */
    @SuppressWarnings("resource")
	@RequestMapping(value = "/update")
    public String updateStu(String title, String keyword, String description, Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        mesconfigDao dao = (mesconfigDao) context.getBean("dao");
        mesconfig mes = new mesconfig();
        mes.setTitle(title);
        mes.setKeyword(keyword);
        mes.setDescription(description);
        boolean result = dao.updateStu(mes);
        if (result)
            model.addAttribute("msg", msg("修改成功"));
        else
            model.addAttribute("msg", msg("修改失败"));
        return "all";
    }
    /**
     * 要弹出的页面消息
     * @param msg
     * @return 返回值类型： String
     */
    public String msg(String msg) {
    return "<script>alert('" + msg + "')</script>";
    }
}

