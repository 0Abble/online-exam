package io.renren.util;

import com.itextpdf.text.*;
import com.itextpdf.text.Font;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.*;
import io.renren.common.constant.ExamConstant;
import io.renren.common.constant.enums.ExamEnum;
import io.renren.modules.exam.entity.vo.PaperInfoVO;
import io.renren.modules.exam.service.impl.PaperPdfPage;
import org.apache.logging.log4j.util.BiConsumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ResourceUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.awt.*;
import java.io.*;
import java.net.URLEncoder;
import java.util.function.Consumer;

/**
 * @Author 3fes
 * @Date 2023/1/28 15:14
 **/

public class PdfUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(PdfUtil.class);

    Document document;
    /*private static Font headfont;// 设置字体大小
    private static Font keyfont;// 设置字体大小
    private static Font textfont;// 设置字体大小*/
    /**
     * 基础配置
     */
    private static String PDF_SITE = "F:\\temp\\temp.pdf";

    private static String FONT;
    static {
        try {
            FONT = ResourceUtils.getFile("classpath:static/font/mst.ttf").getPath();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    // 基础样式
    private static Font TITLE_FONT = FontFactory.getFont(FONT, BaseFont.IDENTITY_H,20, Font.BOLD);
    private static Font NODE_FONT = FontFactory.getFont(FONT, BaseFont.IDENTITY_H,15, Font.BOLD);
    private static Font BLOCK_FONT = FontFactory.getFont(FONT, BaseFont.IDENTITY_H,13, Font.BOLD, BaseColor.BLACK);
    private static Font INFO_FONT = FontFactory.getFont(FONT, BaseFont.IDENTITY_H,12, Font.NORMAL,BaseColor.BLACK);
    private static Font CONTENT_FONT = FontFactory.getFont(FONT, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

    int maxWidth = 520;

    /*static {

        BaseFont bfChinese;

        try {

            // bfChinese =
            // BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);

            bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

            headfont = new Font(bfChinese, 10, Font.BOLD);// 设置字体大小

            keyfont = new Font(bfChinese, 8, Font.BOLD);// 设置字体大小

            textfont = new Font(bfChinese, 8, Font.NORMAL);// 设置字体大小

        } catch (Exception e) {

            e.printStackTrace();

        }

    }*/

    public PdfUtil(File file) {
        document = new Document();// 建立一个Document对象
        document.setPageSize(PageSize.A4);// 设置页面大小

        try {

            PdfWriter.getInstance(document, new FileOutputStream(file));

            document.open();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    /*public PdfPCell createCell(String value, Font font, int align) {

        PdfPCell cell = new PdfPCell();

        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);

        cell.setHorizontalAlignment(align);

        cell.setPhrase(new Phrase(value, font));

        return cell;

    }

    public PdfPCell createCell(String value, Font font, int align, float width) {

        PdfPCell cell = new PdfPCell();

        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);

        cell.setHorizontalAlignment(align);

        cell.setPhrase(new Phrase(value, font));

        return cell;

    }

    public PdfPCell createCell(String value, Font keyfont2) {

        PdfPCell cell = new PdfPCell();

        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);

        cell.setHorizontalAlignment(Element.ALIGN_CENTER);

        cell.setPhrase(new Phrase(value, keyfont2));

        return cell;

    }

    public PdfPCell createCell(String value, Font font, int align, int colspan) {

        PdfPCell cell = new PdfPCell();

        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);

        cell.setHorizontalAlignment(align);

        cell.setRowspan(colspan);

        cell.setPhrase(new Phrase(value, font));

        return cell;

    }

    public PdfPCell createCell(String value, Font font, int align, int colspan, boolean boderFlag) {

        PdfPCell cell = new PdfPCell();

        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);

        cell.setHorizontalAlignment(align);

        cell.setColspan(colspan);

        cell.setPhrase(new Phrase(value, font));

        cell.setPadding(3.0f);

        if (!boderFlag) {

            cell.setBorder(0);

            cell.setPaddingTop(15.0f);

            cell.setPaddingBottom(8.0f);

        }

        return cell;

    }

    public PdfPTable createTable(int colNumber) {

        PdfPTable table = new PdfPTable(colNumber);

        try {

            table.setTotalWidth(maxWidth);

            table.setLockedWidth(true);

            table.setHorizontalAlignment(Element.ALIGN_CENTER);

            table.getDefaultCell().setBorder(1);

        } catch (Exception e) {

            e.printStackTrace();

        }

        return table;

    }

    public PdfPTable createTable(float[] widths) {

        PdfPTable table = new PdfPTable(widths);

        try {

            table.setTotalWidth(maxWidth);

            table.setLockedWidth(true);

            table.setHorizontalAlignment(Element.ALIGN_CENTER);

            table.getDefaultCell().setBorder(1);

        } catch (Exception e) {

            e.printStackTrace();

        }

        return table;

    }

    public PdfPTable createBlankTable() {

        PdfPTable table = new PdfPTable(1);

        table.getDefaultCell().setBorder(0);

        table.addCell(createCell("", keyfont));

        table.setSpacingAfter(20.0f);

        table.setSpacingBefore(20.0f);

        return table;

    }*/

    public void generatePDF(PaperInfoVO paperInfoVO) throws Exception {
        // 报告标题
        document.add(PdfFontUtil.getParagraph(paperInfoVO.getPaperTitle(),TITLE_FONT,1)) ;
        paperInfoVO.getQuestionList().forEach(type -> {
            if (!type.getList().isEmpty()) {
                setTitle(type.getTypeName(), BLOCK_FONT, document);
                type.getList().forEach(getIndex((question, index) -> {
                    setTitle((index+1)+"、"+question.getQuestionTitle(), INFO_FONT, document);
                    if (type.getId().equals(ExamEnum.SINGLE_QSN.getCode()) || type.getId().equals(ExamEnum.MULTIPLE_QSN.getCode())) {
                        String[] choice = question.getContent().split(ExamConstant.splitChar);
                        for (int i=0;i<choice.length;i++) {
                            String temp =(char)(65+i) + ": " + choice[i].toString();
                            setTitle(temp, INFO_FONT, document);
                        }
                    } else if (type.getId().equals(ExamEnum.COMPLETION_QSN.getCode())) {
                        String[] answers = question.getAnswer().split(ExamConstant.splitChar);
                        StringBuilder temp  = new StringBuilder();
                        for (String answer : answers) {
                            temp.append("_____________________      ");
                        }
                        setTitle(temp.toString(), INFO_FONT, document);
                    } else {
                        setTitle("正确    错误", INFO_FONT, document);
                    }
                }));
            }
        });
        document.close();

    }

    private void setTitle(String text, Font font, Document document) {
        try {
            document.add(PdfFontUtil.getParagraph("\n"+text, font,-1));
        } catch (DocumentException e) {
            LOGGER.error(e.getMessage());
        }
    }

    private  <T> Consumer<T> getIndex(BiConsumer<T, Integer> consumer) {
        class IndexObject {
            int index;
        }
        IndexObject indexObject = new IndexObject();
        return i -> {
            consumer.accept(i, indexObject.index++);
        };
    }

    /**
     * 添加水印
     *
     * @param inputFile
     *            原PDF文件路径
     * @param outputFile
     *            添加水印后的PDF文件路径
     * @param waterMarkName
     *            水印文字
     */
    public static void waterMark(String inputFile, String outputFile, String waterMarkName) {
        int interval = -5;
        try {
            PdfReader reader = new PdfReader(inputFile);
            PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(outputFile));

            BaseFont base = BaseFont.createFont(FONT, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            Rectangle pageRect = null;
            PdfGState gs = new PdfGState();
            // 设置透明度
            gs.setFillOpacity(0.1f);
            gs.setStrokeOpacity(0.4f);
            int total = reader.getNumberOfPages() + 1;

            JLabel label = new JLabel();
            FontMetrics metrics;
            int textH = 0;
            int textW = 0;
            label.setText(waterMarkName);
            metrics = label.getFontMetrics(label.getFont());
            textH = metrics.getHeight();
            textW = metrics.stringWidth(label.getText());

            PdfContentByte under;
            for (int i = 1; i < total; i++) {
                pageRect = reader.getPageSizeWithRotation(i);
                under = stamper.getOverContent(i);
                under.saveState();
                under.setGState(gs);
                under.beginText();
                under.setFontAndSize(base, 20);

                // 水印文字成30度角倾斜
                // 你可以随心所欲的改你自己想要的角度
                for (int height = interval + textH; height < pageRect.getHeight(); height = height + textH * 3) {
                    for (int width = interval + textW; width < pageRect.getWidth() + textW; width = width + textW * 2) {
                        under.showTextAligned(Element.ALIGN_LEFT, waterMarkName, width - textW, height - textH, 30);
                    }
                }
                // 添加水印文字
                under.endText();
            }

            // 一定不要忘记关闭流
            stamper.close();
            reader.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 导出PDF
     *
     * @param req
     * @param resp
     * @param downloadFile
     *            要下载的文件的文件路径 （路径到文件名称：.../XXX.pdf）
     * @param filename
     *            下载到本地的文件名称
     */
    public static void exportPDF(HttpServletRequest req, HttpServletResponse resp, String downloadFile, String filename, String tempFile) {

        DataInputStream in = null;
        OutputStream out = null;
        try {
            resp.reset();// 清空输出流

            String resultFileName = filename + System.currentTimeMillis() + ".pdf";
            resultFileName = URLEncoder.encode(resultFileName, "UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setHeader("Content-disposition", "attachment; filename=" + resultFileName);// 设定输出文件头
            resp.setContentType("application/pdf");// 定义输出类型
            // 输入流：本地文件路径
            in = new DataInputStream(new FileInputStream(new File(downloadFile)));
            // 输出流
            out = resp.getOutputStream();
            // 输出文件
            int bytes = 0;
            byte[] bufferOut = new byte[1024];
            while ((bytes = in.read(bufferOut)) != -1) {
                out.write(bufferOut, 0, bytes);
            }
        } catch (Exception e) {
            e.printStackTrace();
//            resp.reset();
            try {
                OutputStreamWriter writer = new OutputStreamWriter(resp.getOutputStream(), "UTF-8");
                String data = "<script language='javascript'>alert(\"\\u64cd\\u4f5c\\u5f02\\u5e38\\uff01\");</script>";
                writer.write(data);
                writer.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        } finally {
            if (null != in) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (null != out) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        // 删除临时文件
        File file = new File(downloadFile);
        file.delete();
        File file2 = new File(tempFile);
        file2.delete();

    }

}
