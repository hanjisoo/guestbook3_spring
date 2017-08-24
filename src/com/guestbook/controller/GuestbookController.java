package com.guestbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guestbook.dao.GuestbookDao;
import com.guestbook.vo.GuestbookVo;


@Controller
public class GuestbookController {

	@Autowired
	private GuestbookDao dao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		
		List<GuestbookVo> list=dao.getList();
		/*System.out.println(list.toString());*/
		model.addAttribute("list", list);
		
		/*return"WEB-INF/views/list.jsp";*/
		return"list";
	}
	
	@RequestMapping("/delete")
	public String delete(@ModelAttribute GuestbookVo vo) {
		dao.delete(vo);
		return"redirect:/list";
	}
	
	@RequestMapping("/add")
	public String add(@ModelAttribute GuestbookVo vo){
		System.out.println(vo.toString());
		dao.insert(vo);
		return"redirect:/list";
	}
	
	@RequestMapping(value="/deleteform/{no}")
	public String deleteform(Model model,@PathVariable("no") int no) {
		System.out.println("이히");
		model.addAttribute("num", no);
		return "deleteform";
	}
}
