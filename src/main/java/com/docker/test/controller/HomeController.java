package com.docker.test.controller;

import com.docker.test.dto.ContentRequestDto;
import com.docker.test.entity.Contents;
import com.docker.test.repository.ContentsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class HomeController {

    private final ContentsRepository contentsRepository;

    @GetMapping("/")
    public String home() {
        return "form";
    }

    @PostMapping("/")
    public String form(@ModelAttribute ContentRequestDto content) {
        contentsRepository.save(new Contents(content.getContent()));
        return "redirect:/";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Contents> contents = new ArrayList<>();
        Iterable<Contents> contentsIterable = contentsRepository.findAll();
        contentsIterable.forEach(contents::add);

        model.addAttribute("contents", contents);
        return "list";
    }
}
