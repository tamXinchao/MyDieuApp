package asm.java5Nhom6.HomeController;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asm.java5Nhom6.dao.UsersDao;
import asm.java5Nhom6.entity.Users;

@Controller
public class UsersController {

    @Autowired
    private UsersDao usersDao;

    @RequestMapping("/users")
    public String getUser(@RequestParam(value = "fullname", required = false) String fullname, Model model) {
        List<Users> list1;
        if (fullname != null && !fullname.isEmpty()) {
            list1 = usersDao.findByName(fullname);
        } else {
            list1 = usersDao.findAll();
        }
        model.addAttribute("users", list1);
        return "test"; // Tên của file JSP
    }
}