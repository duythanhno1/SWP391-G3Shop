/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import model.Blog;
import model.User;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext {

    public ArrayList<Blog> getRecentPost() {
        ArrayList<Blog> bloList = new ArrayList<>();
        try {
            String sql = "select top 5 blog_title,substring(description,0,70),img,blog_id from blog order by post_date desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                bloList.add(b);
            }
        } catch (SQLException e) {
        }
        return bloList;
    }

    public ArrayList<Blog> getHotPost() {
        ArrayList<Blog> bloList = new ArrayList<>();
        try {
            String sql = "select top 6 blog_title,substring(description,0,70),img,blog_id from blog order by views desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                bloList.add(b);
            }
        } catch (SQLException e) {
        }
        return bloList;
    }

    public ArrayList<Blog> getAllPost(String[] value, String order) {
        ArrayList<Blog> bloList = new ArrayList<>();

        String sql = "select b.blog_title,substring(b.description,0,70),b.img,b.blog_id from blog b,setting s where b.active = 1  and s.setting_id = b.blog_category";
        if (value != null) {
            sql += "  and s.value in (";
            for (int i = 0; i < value.length; i++) {
                if (i == 0) {
                    sql += "?";
                } else {
                    sql += ",?";
                }
            }
            sql += ")";
        }
        if (order != null) {
            sql += " order by b.post_date ";
            if (order.equalsIgnoreCase("NTO")) {
                sql += "desc";
            } else {
                sql += "asc";
            }
        }

        try {

            PreparedStatement stm = connection.prepareStatement(sql);
            if (value != null) {
                for (int i = 0; i < value.length; i++) {
                    stm.setString(i + 1, value[i]);
                }
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                bloList.add(b);
            }
        } catch (SQLException e) {
        }
        return bloList;
    }

    public ArrayList<Blog> getPostMarketing(String category, int author, int status, int sort, String search, int order) {
        ArrayList<Blog> bloList = new ArrayList<>();
        try {

            String sql = "select b.blog_id,b.blog_title,substring(b.description,0,130),b.img,b.active,s.value,u.fullname from blog b join setting s on s.setting_id = b.blog_category join [user] u on u.user_id = b.author_id where 1 = 1 and s.value like ? and b.author_id between ? and ? and b.active between ? and ? and b.blog_title like ? ";

            switch (sort) {
                case 1:
                    sql += " order by b.blog_title";
                    break;
                case 2:
                    sql += " order by s.value";
                    break;
                case 3:
                    sql += " order by b.author_id";
                    break;
                case 4:
                    sql += " order by substring(b.description,0,10000)";
                    break;
                case 5:
                    sql += " order by b.active";
                    break;
                default:
                    sql += " ";
            }
            if (sort != -1) {
                switch (order) {
                    case 1:
                        sql += " desc";
                        break;
                    case 0:
                        sql += " asc";
                        break;

                }
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (!category.equals("-1")) {
                stm.setString(1, category);
            } else {
                stm.setString(1, "%[a-zA-Z0-9]%");
            }
            if (author != -1) {
                stm.setInt(2, author);
                stm.setInt(3, author);
            } else {
                stm.setInt(2, Integer.MIN_VALUE);
                stm.setInt(3, Integer.MAX_VALUE);
            }
            if (status != -1) {
                stm.setInt(4, status);
                stm.setInt(5, status);
            } else {
                stm.setInt(4, Integer.MIN_VALUE);
                stm.setInt(5, Integer.MAX_VALUE);
            }
            if (search != null) {
                stm.setString(6, "%" + search + "%");
            } else {
                stm.setString(6, "%[a-zA-Z0-9]%");
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getString(6), rs.getString(7));
                bloList.add(b);
            }
        } catch (SQLException e) {
        }
        return bloList;
    }

    public ArrayList<String> getCatPost() {
        ArrayList<String> catList = new ArrayList<>();
        try {
            String sql = "select value from setting where type = 'blog category'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                catList.add(rs.getString(1));
            }
        } catch (SQLException e) {
        }
        return catList;
    }

    public Blog getDetailPost(int id) {
        Blog b = new Blog();
        try {
            String sql = "select b.blog_title,u.fullname,b.img,b.post_date,s.value,b.description\n"
                    + "   from setting s,blog b,[user] u\n"
                    + "   where s.setting_id = b.blog_category and u.user_id = b.author_id\n"
                    + " and b.blog_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                b = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6));
                break;
            }
        } catch (SQLException e) {
        }
        return b;
    }

    public int getTotalSearchPost(String s) {
        int total = 0;
        try {
            String sql = "select count(*) from blog where blog_title like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + s + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public ArrayList<Blog> getAllSearchPost(String s) {
        ArrayList<Blog> bloList = new ArrayList<>();
        try {
            String sql = "select blog_title,substring(description,0,50),img,blog_id from blog  where blog_title like ? order by post_date";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + s + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                bloList.add(b);
            }
        } catch (SQLException e) {
        }
        return bloList;
    }

    public ArrayList<Blog> getAllPost() {
        ArrayList<Blog> bloList = new ArrayList<>();
        try {
            String sql = "select top(1) blog_title,substring(description,0,50),img,blog_id from blog where blog.active = 1 and  blog_id = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                bloList.add(b);
            }
        } catch (SQLException e) {
        }
        return bloList;
    }

    public ArrayList<User> getAllAuthor() {
        ArrayList<User> userList = new ArrayList<>();
        try {
            String sql = "select user_id,fullname from [user]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                userList.add(new User(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return userList;
    }

    public void updateStatus(int id, int value) {
        try {
            String sql = "update blog set active = ? where blog_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, value);
            stm.setInt(2, id);
            stm.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void updatePost(String title, String description, String image, int status, int cate, int idEdit) {
        try {
            String sql = "update blog set description = ? , blog_title = ?,active = ?,img = ?,blog_category = ? where blog_id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, description);
            stm.setString(2, title);
            stm.setString(4, image);
            stm.setInt(3, status);
            stm.setInt(5, cate);
            stm.setInt(6, idEdit);
            stm.executeUpdate();

        } catch (SQLException e) {
        }
    }

//    public static void main(String[] args) {
//        System.out.println(new BlogDAO().getAllPost());
//        new BlogDAO().updatePost("Using multiroom audio is as ", "Perhaps you remember the iPhone 7 Plus - the phone that brought a telephoto camera and made multiple cameras mainstream, something we've been taking for granted for years now. It wasn't the first one to feature more than one rear camera", "phone.jpg", 1);
//        System.out.println(new BlogDAO().getAllPost());
//    }
    public void addPost(String titleAdd, String descriptionAdd, String imgAdd, int authorID, LocalDate now, int cate, int i, int status3) {
        try {
            String sql = "INSERT INTO [dbo].[blog]\n"
                    + "           \n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,23\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, titleAdd);
            stm.setString(2, descriptionAdd);
            stm.setString(3, imgAdd);
            stm.setInt(4, authorID);
            stm.setDate(5, java.sql.Date.valueOf(now));
            stm.setInt(6, cate);
            stm.setInt(7, i);
            stm.setInt(8, status3);
            stm.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public String getImage(int id) {
        String result = "";
        try {
            String sql = "select img from blog where blog_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }

        } catch (SQLException e) {
        }
        return null;
    }
}
