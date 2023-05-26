/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import model.User;
import service.MD5;
import service.SendMail;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public User getUserByEmail(String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean checkLogin(String email, String password) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE email = ? AND password = ? and active = 1");
            ps.setString(1, email);
            ps.setString(2, MD5.getMd5(password));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void insertUser(String fullname, String phone, String address, String email, String password, int gender) {
        try {
            String randomKey = MD5.getMd5(String.valueOf(new Random().nextInt(999999)));
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[user]\n"
                    + "           ([fullname]\n"
                    + "           ,[email]\n"
                    + "           ,[password]\n"
                    + "           ,[gender]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[role]\n"
                    + "           ,[active]\n"
                    + "           ,[key]"
                    + "           ,[avatar])\n"
                    + "     VALUES (?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, MD5.getMd5(password));
            ps.setInt(4, gender);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.setInt(7, 7);
            ps.setInt(8, 0);
            ps.setString(9, randomKey);
            ps.setString(10, "https://iconape.com/wp-content/files/im/10836/svg/iconfinder_3_avatar_2754579.svg");
            SendMail.send(email, "Verify SignUp G3shop.vn", messageRegister(fullname, phone, address, email, randomKey));
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    private String messageRegister(String fullname, String phone, String address, String email, String randomKey) {
        return "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n"
                + "    <title>Document</title>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n"
                + "        <tbody>\n"
                + "            <tr>\n"
                + "                <td style=\"border-collapse:collapse;border-left:1px solid #ff6e40;border-right:1px solid #ff6e40\">\n"
                + "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
                + "                        <tbody>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:18px 20px 20px 20px;vertical-align:middle;line-height:20px;font-family:Arial;background-color:#ff6e40;text-align:center\">\n"
                + "                                    <span style=\"color:#ffffff;font-size:115%;text-transform:uppercase\">Active account\n"
                + "                                    </span> </td>\n"
                + "                            </tr>\n"
                + "\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:4px 20px 12px 20px\"> <span style=\"font-size:12px;color:#252525;font-family:Arial,Helvetica,sans-serif;line-height:18px\">\n"
                + "                                        We have received a request to open an account with the following key information:</span>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:20px 0px 12px 0px\">\n"
                + "                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
                + "                                        <tbody>\n"
                + "                                            <tr>\n"
                + "                                                <td style=\"padding:8px 10px 8px 20px;font-family:Arial,Helvetica,sans-serif;color:#666666;font-size:12px;border-bottom:1px solid #dcdcdc\" align=\"right\"><span>Fullname:</span></td>\n"
                + "                                                <td style=\"padding:8px 20px 8px 10px;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#2525253;border-bottom:1px solid #dcdcdc\" align=\"left\"><strong>" + fullname + "</strong></td>\n"
                + "                                            </tr>\n"
                + "                                            <tr>\n"
                + "                                                <td style=\"padding:8px 10px 8px 20px;font-family:Arial,Helvetica,sans-serif;color:#666666;font-size:12px;border-bottom:1px solid #dcdcdc\" align=\"right\"><span>Email:\n"
                + "                                                    </span></td>\n"
                + "                                                <td style=\"padding:8px 20px 8px 10px;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#2525253;border-bottom:1px solid #dcdcdc\" align=\"left\"><a href=\"mailto:" + email + "\" target=\"_blank\">" + email + "</a></td>\n"
                + "                                            </tr>\n"
                + "                                            <tr>\n"
                + "                                                <td style=\"padding:8px 10px 8px 20px;font-family:Arial,Helvetica,sans-serif;color:#666666;font-size:12px;border-bottom:1px solid #dcdcdc\" align=\"right\"><span>Phone:\n"
                + "                                                    </span></td>\n"
                + "                                                <td style=\"padding:8px 20px 8px 10px;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#2525253;border-bottom:1px solid #dcdcdc\" align=\"left\">" + phone + "</td>\n"
                + "                                            </tr>\n"
                + "                                            <tr>\n"
                + "                                                <td style=\"padding:8px 10px 8px 20px;font-family:Arial,Helvetica,sans-serif;color:#666666;font-size:12px;border-bottom:1px solid #dcdcdc\" align=\"right\"><span>Address:\n"
                + "                                                    </span></td>\n"
                + "                                                <td style=\"padding:8px 20px 8px 10px;font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#2525253;border-bottom:1px solid #dcdcdc\" align=\"left\">" + address + "</td>\n"
                + "                                            </tr>\n"
                + "                                        </tbody>\n"
                + "                                    </table>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:4px 20px 12px 20px\"> <strong style=\"font-size:12px;color:#252525;font-family:Arial,Helvetica,sans-serif;line-height:18px\">\n"
                + "                                        To continue with the registration process, please click on the link below:</strong> </td>\n"
                + "                            </tr>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:10px 20px 12px 20px\">\n"
                + "                                    <div style=\"background:rgb(255,248,204);border:1px solid rgb(255,140,0);padding:10px;border-radius:3px 3px 0px 0px;font-size:11px;font-family:'Courier New',Courier,monospace\" align=\"center\"> <a title=\"Đường dẫn kích hoạt tài khoản\" href=\"http://localhost:8080/onlineShop/verify?action=register&email=" + email + "&key=" + randomKey + "\" style=\"text-decoration:none;color:#252525\" target=\"_blank\">http://localhost:8080/onlineShop/verify?action=register&email=" + email + "&key=" + randomKey + "</a>\n"
                + "                                    </div>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "                </td>\n"
                + "            </tr>\n"
                + "            <tr>\n"
                + "                <td>\n"
                + "                    <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                + "                        <tbody>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:4px 20px 12px 20px;border-left:1px solid #ff6e40;border-right:1px solid #ff6e40\"><span style=\"font-size:12px;color:#252525;font-family:Arial,Helvetica,sans-serif\">Thank you for your interest and use of our services</span> </td>\n"
                + "                            </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "                </td>\n"
                + "            </tr>\n"
                + "        </tbody>\n"
                + "    </table>\n"
                + "</body>\n"
                + "\n"
                + "</html>";
//        return "To confirm registration please click here: http://localhost:8080/onlineShop/verify?email=" + email + "&key=" + codeRandom;
    }

    public boolean checkEmail(String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkEmailAndKey(String email, String keyRandom) {
        try {
            PreparedStatement ps = connection.prepareStatement("select * from [user] where email = ? and [key] = ?");
            ps.setString(1, email);
            ps.setString(2, keyRandom);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void activeAccount(String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[user]\n"
                    + "   SET [active] = 1\n"
                    + "      ,[key] = NULL\n"
                    + " WHERE email = ?");
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertKey(String email) {
        try {
            String randomKey = MD5.getMd5(String.valueOf(new Random().nextInt(999999)));
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[user]\n"
                    + "   SET [key] = ?\n"
                    + " WHERE email = ?");
            ps.setString(1, randomKey);
            ps.setString(2, email);
            SendMail.send(email, "Verify reset password G3shop.vn", messageResetPass(email, randomKey));
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    private String messageResetPass(String email, String randomKey) {
        return "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n"
                + "    <title>Document</title>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n"
                + "        <tbody>\n"
                + "            <tr>\n"
                + "                <td style=\"border-collapse:collapse;border-left:1px solid #ff6e40;border-right:1px solid #ff6e40\">\n"
                + "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
                + "                        <tbody>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:18px 20px 20px 20px;vertical-align:middle;line-height:20px;font-family:Arial;background-color:#ff6e40;text-align:center\">\n"
                + "                                    <span style=\"color:#ffffff;font-size:115%;text-transform:uppercase\">Active account\n"
                + "                                    </span> </td>\n"
                + "                            </tr>\n"
                + "\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:4px 20px 12px 20px\"> <span style=\"font-size:12px;color:#252525;font-family:Arial,Helvetica,sans-serif;line-height:18px\">\n"
                + "                                        We have received a request to open an account with the following key information:</span>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:20px 0px 12px 0px\">\n"
                + "                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
                + "                                        <tbody>\n"
                + "                                        </tbody>\n"
                + "                                    </table>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:4px 20px 12px 20px\"> <strong style=\"font-size:12px;color:#252525;font-family:Arial,Helvetica,sans-serif;line-height:18px\">\n"
                + "                                        To continue with the reset password process, please click on the link below:</strong> </td>\n"
                + "                            </tr>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:10px 20px 12px 20px\">\n"
                + "                                    <div style=\"background:rgb(255,248,204);border:1px solid rgb(255,140,0);padding:10px;border-radius:3px 3px 0px 0px;font-size:11px;font-family:'Courier New',Courier,monospace\" align=\"center\"> <a title=\"Đường dẫn kích hoạt tài khoản\" href=\"http://localhost:8080/onlineShop/verify?action=forgot&email=" + email + "&key=" + randomKey + "\" style=\"text-decoration:none;color:#252525\" target=\"_blank\">http://localhost:8080/onlineShop/verify?action=forgot&email=" + email + "&key=" + randomKey + "</a>\n"
                + "                                    </div>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "                </td>\n"
                + "            </tr>\n"
                + "            <tr>\n"
                + "                <td>\n"
                + "                    <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                + "                        <tbody>\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding:4px 20px 12px 20px;border-left:1px solid #ff6e40;border-right:1px solid #ff6e40\"><span style=\"font-size:12px;color:#252525;font-family:Arial,Helvetica,sans-serif\">Thank you for your interest and use of our services</span> </td>\n"
                + "                            </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "                </td>\n"
                + "            </tr>\n"
                + "        </tbody>\n"
                + "    </table>\n"
                + "</body>\n"
                + "\n"
                + "</html>";
    }

    public void updatePassword(String email, String password) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[user]\n"
                    + "   SET [password] = ?\n"
                    + "      ,[key] = NULL\n"
                    + " WHERE email = ?");
            ps.setString(1, MD5.getMd5(password));
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProfile(String fullname, int gender, String phone, String address, String avatar, String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[user]\n"
                    + "   SET [fullname] = ?\n"
                    + "      ,[gender] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[address] =? \n"
                    + "      ,[avatar] = ?\n"
                    + " WHERE email = ?");
            ps.setString(1, fullname);
            ps.setInt(2, gender);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, avatar);
            ps.setString(6, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    
}
