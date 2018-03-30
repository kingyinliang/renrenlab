package com.renrenlab.rlab.common.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.Random;

/**
 * 验证码生成工具类
 */
public class CaptchaGenerator {

    private final static String randString = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ";// 随机产生的字符串
    private final static int width = 80;// 图片宽
    private final static int height = 30;// 图片高
    private final static int lineSize = 20;// 干扰线数量
    private final static int stringNum = 5;// 随机产生字符数量
    private Random random = new Random();

    /*
     * 获得字体
     */
    private Font getFont() {
        return new Font("Fixedsys", Font.CENTER_BASELINE, 20);
    }

    /*
     * 获得颜色
     */
    private Color getRandColor(int fc, int bc) {
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc - 16);
        int g = fc + random.nextInt(bc - fc - 14);
        int b = fc + random.nextInt(bc - fc - 18);
        return new Color(r, g, b);
    }

    /**
     * 生成随机图片
     */
    public String generateOneAndWriteToStream(OutputStream out) {
        int width = 230;
        int height = 70;
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB); // 创建BufferedImage类的对象
        Graphics g = image.getGraphics(); // 创建Graphics类的对象
        Graphics2D g2d = (Graphics2D) g; // 通过Graphics类的对象创建一个Graphics2D类的对象
        Random random = new Random(); // 实例化一个Random对象
        Font mFont = new Font("华文宋体", Font.BOLD, 32); // 通过Font构造字体
        g.setColor(getRandColor(200, 250)); // 改变图形的当前颜色为随机生成的颜色
        g.fillRect(0, 0, width, height); // 绘制一个填色矩形

        // 画一条折线
        BasicStroke bs = new BasicStroke(2f, BasicStroke.CAP_BUTT,
                BasicStroke.JOIN_BEVEL); // 创建一个供画笔选择线条粗细的对象
        g2d.setStroke(bs); // 改变线条的粗细
        g.setColor(Color.DARK_GRAY); // 设置当前颜色为预定义颜色中的深灰色
        int[] xPoints = new int[3];
        int[] yPoints = new int[3];
        for (int j = 0; j < 3; j++) {
            xPoints[j] = random.nextInt(width - 1);
            yPoints[j] = random.nextInt(height - 1);
        }
        g.drawPolyline(xPoints, yPoints, 3);
        int[] xPoints_ = new int[3];
        int[] yPoints_ = new int[3];
        for (int j = 0; j < 3; j++) {
            xPoints_[j] = random.nextInt(width - 1);
            yPoints_[j] = random.nextInt(height - 1);
        }
        g.drawPolyline(xPoints_, yPoints_, 3);
        // 生成并输出随机的验证文字
        g.setFont(mFont);
        String sRand = "";
        int itmp = 0;
        for (int i = 0; i < 6; i++) {
            if (random.nextInt(2) == 1) {
//                itmp = random.nextInt(26) + 65;
                do {
                    itmp = random.nextInt(26) + 65; // 生成A~Z的字母,排除i,l,o
                } while (itmp == 73 || itmp == 76 || itmp == 79);
            } else {
                do {
                    itmp = random.nextInt(10) + 48; // 生成0~9的数字  , 排除0和1
                } while (itmp == 48 || itmp == 49);
            }
            char ctmp = (char) itmp;
            sRand += String.valueOf(ctmp);
            Color color = new Color(20 + random.nextInt(110),
                    20 + random.nextInt(110), 20 + random.nextInt(110));
            g.setColor(color);
            /**** 随机缩放文字并将文字旋转指定角度 **/
            // 将文字旋转指定角度
            Graphics2D g2d_word = (Graphics2D) g;
            AffineTransform trans = new AffineTransform();
            trans.rotate(random.nextInt(15) * 3.14 / 180, 15 * i + 10, 7);
            // 缩放文字
            float scaleSize = random.nextFloat() + 0.8f;
            if (scaleSize > 1.1f)
                scaleSize = 1f;
            trans.scale(scaleSize, scaleSize);
            g2d_word.setTransform(trans);
            /************************/
            g.drawString(String.valueOf(ctmp), 30 * i + 30, 35);
        }
        System.out.println("产生一个验证码 ：" + sRand);
        g.dispose();
        try {
            ImageIO.write(image, "JPEG", out);//将内存中的图片通过流形式输出
        } catch (Exception e) {
            System.out.println("输出验证码图片出错");
            e.printStackTrace();
        } finally {

        }
        return sRand;
    }

    /*
     * 绘制字符串
     */

    private String drowString(Graphics g, String randomString, int i) {
        g.setFont(getFont());
        g.setColor(new Color(random.nextInt(101), random.nextInt(111), random
                .nextInt(121)));
        String rand = String.valueOf(getRandomString(random.nextInt(randString
                .length())));
        randomString += rand;
        g.translate(random.nextInt(3), random.nextInt(3));
        g.drawString(rand, 8 * i, 14);
        return randomString;
    }

    /*
     * 绘制干扰线
     */
    private void drowLine(Graphics g) {
        int x = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(13);
        int yl = random.nextInt(15);
        g.setFont(new Font("Fixedsys", Font.CENTER_BASELINE, 20));
        g.drawLine(x, y, x + xl, y + yl);
    }

    /*
     * 获取随机的字符
     */
    public String getRandomString(int num) {
        return String.valueOf(randString.charAt(num));
    }
}
