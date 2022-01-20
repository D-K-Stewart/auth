package com.david.auth.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.david.auth.models.Book;
import com.david.auth.models.LoginUser;
import com.david.auth.models.User;
import com.david.auth.services.BookService;
import com.david.auth.services.UserService;
    
@Controller
public class HomeController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private BookService bookService;
    
    
    @RequestMapping("/")
    public String home(Model model) {
    	model.addAttribute("newUser", new User());
    	model.addAttribute("newLogin", new LoginUser());
    	return "index.jsp";
    }
    
//    //all books
//    @RequestMapping("/index")
//    public String index(Model model, HttpSession session) {
//        
//    	model.addAttribute("allBooks", bookService.allBooks());
//        model.addAttribute("user", userService.findOne((Long)session.getAttribute("user_id")));
//        return "index.jsp";
//    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userService.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userService.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/home";
        
    }
    
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
    	Long userID = (Long) session.getAttribute("user_id");
    	if(userID == null) {
    		return "redirect:/loginreg";
    	}
    	else {
    		User thisUser = userService.findOne(userID);
    		System.out.println(thisUser);
    		model.addAttribute("name", thisUser.getFirstName());
    		List<Book> books = bookService.allBooks();
        	model.addAttribute("books", books);
    		return "home.jsp";
    	}
    }
    
//    }
    
//    @GetMapping("/sh")
//    public String show(Model model, HttpSession session) {
//    	if (session.isNew() || session.getAttribute("user_id") == null) {
//    		return "redirect:/";
//    	}
//    	User loggedInUser = this.userServ.findOne((Long) session.getAttribute("user_id"));
//    	model.addAttribute("loggedInUser", loggedInUser);
//    	return "show.jsp";
//    }
    
    //new book show
    @RequestMapping("/newBook")
    public String newBook(@ModelAttribute("book")Book book, Model model, HttpSession session) {
    	Long user_id = (Long)session.getAttribute("user_id");
    	if(user_id == null) {
    		return "redirect:/books";
    	}
    	model.addAttribute("user", user_id);
    	return "new.jsp";
    }

    
//    //create new book
	@RequestMapping(value="/createBook", method=RequestMethod.POST)
	public String CreatedBy(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session, Model model) {
		model.addAttribute("users", userService.allUsers());
		Long user_id = (Long)session.getAttribute("user_id");
    	if(user_id == null) {
    		return "redirect:/books";
    	}
    	
    	else if(result.hasErrors()) {
			return "new.jsp";
			
		}
    	else {
			bookService.create(book);
			return "redirect:/home";
		}
	}
    	

    
    @RequestMapping(value="/editedBook/{id}", method=RequestMethod.PUT)
    public String editbook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {
    	if(result.hasErrors()) {
    		return "edit.jsp";
    	}else {
    		bookService.update(book);
    		return "redirect:/home";
    	}
    }
    
    @RequestMapping(value="/editBook/{id}")
    public String editbook(@PathVariable("id") Long id, @ModelAttribute("book")Book book, Model model, HttpSession session) {
    	Book oneBook = bookService.oneBook(id);
    	model.addAttribute("book", oneBook);
//    	Long user_id = (Long)session.getAttribute("user_id");
//    	model.addAttribute("user", user_id);
    		return "edit.jsp";
    }
 
    
    //show one book
    @RequestMapping("/oneBook/{id}")
    public String oneBook(@PathVariable("id") Long id, Model model, HttpSession session) {
    	User user = userService.findOne((Long) session.getAttribute("user_id"));
    	
    			model.addAttribute("user", user);
    			model.addAttribute("book", bookService.oneBook(id));
    			return "show.jsp";
    			}
    
    
    //logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
    //delete book
    @RequestMapping("/delete/{id}")
    public String destroy(@PathVariable("id") Long id) {
    	bookService.destroy(id);
    	return "redirect:/home";
    }
    
}