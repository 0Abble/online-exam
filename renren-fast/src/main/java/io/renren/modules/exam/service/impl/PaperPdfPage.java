package io.renren.modules.exam.service.impl;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import io.renren.common.constant.ExamConstant;
import io.renren.common.constant.enums.ExamEnum;
import io.renren.modules.exam.entity.QuestionEntity;
import io.renren.modules.exam.entity.vo.PaperInfoVO;
import io.renren.modules.exam.service.PaperService;
import io.renren.util.PdfFontUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.BiConsumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.List;
import java.util.function.Consumer;

/**
 * @Author 3fes
 * @Date 2023/1/28 10:37
 **/
@Slf4j
@Service
public class PaperPdfPage {
    private static final Logger LOGGER = LoggerFactory.getLogger(PaperPdfPage.class);

    @Autowired
    private PaperService paperService;

    private static String PDF_SITE = "D:\\home\\temp.pdf";

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


    public void exportPaperInfo(String paperId,  HttpServletResponse response) throws Exception {
        PaperInfoVO paperInfoVO = paperService.getPaperInfoByPaperId(paperId);
        // 建立一个Document对象
        Document document = new Document();
        // 设置页面大小
        document.setPageSize(PageSize.A4);
        PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
        document.open();
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
                    } else if (type.getId().equals(ExamEnum.JUDGE_QSN.getCode())) {
                        setTitle("正确    错误", INFO_FONT, document);
                    }
                }));
            }
        });
        document.close();
        writer.flush();
        writer.close();
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
}
