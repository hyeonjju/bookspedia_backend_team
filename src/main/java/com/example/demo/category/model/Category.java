package com.example.demo.category.model;

import com.example.demo.content.model.Content;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "CATEGORY")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 20)
    private String name;


    @OneToMany(mappedBy = "categoryId", orphanRemoval = true)
    @ToString.Exclude
    private List<Content> contentList = new ArrayList<>();

}
