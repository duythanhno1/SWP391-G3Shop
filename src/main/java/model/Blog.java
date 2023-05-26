/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Blog {

    private int blog_id;
    private String blog_title;
    private String description;
    private String image;
    private int author_id;
    private Date post_date;
    private String blogCategory;
    private int status;
    private boolean active;
    private String userName;

    public Blog() {
    }

    public Blog(String blog_title, String userName, String image, Date post_date, String blog_category, String description) {
        this.blog_title = blog_title;
        this.description = description;
        this.image = image;
        this.userName = userName;
        this.post_date = post_date;
        this.blogCategory = blog_category;
    }

    public Blog(String blog_title, String img, Date post_date, String blog_category, String description) {
        this.blog_title = blog_title;
        this.description = description;
        this.post_date = post_date;
        this.image = img;
        this.blogCategory = blog_category;
    }
    public Blog(String blog_title, String description, String img, int blog_id) {
        this.blog_title = blog_title;
        this.description = description;
        this.blog_id = blog_id;
        this.image = img;
    }
    
    public Blog(int blog_id,String blog_title,String description,String img,boolean active,String value,String fullname){
        this.blog_id = blog_id;
        this.blog_title = blog_title;
        this.description = description;
        this.image = img;
        this.active = active;
        this.blogCategory = value;
        this.userName = fullname;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getBlog_title() {
        return blog_title;
    }

    public void setBlog_title(String blog_title) {
        this.blog_title = blog_title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public Date getPost_date() {
        return post_date;
    }

    public void setPost_date(Date post_date) {
        this.post_date = post_date;
    }

    public String getBlogCategory() {
        return blogCategory;
    }

    public void setBlogCategory(String blogCategory) {
        this.blogCategory = blogCategory;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "Blog{" + "blog_id=" + blog_id + ", blog_title=" + blog_title + ", description=" + description + ", image=" + image + ", author_id=" + author_id + ", post_date=" + post_date + ", blogCategory=" + blogCategory + ", status=" + status + ", active=" + active + ", userName=" + userName + '}';
    }




    
    
}


