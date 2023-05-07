package io.renren.common.constant.enums;

/**
 * @Author 3fes
 * @Date 2023/1/28 13:00
 **/

public enum  ExamEnum {

    SINGLE_QSN(1, "单选题"),
    MULTIPLE_QSN(2, "多选题"),
    COMPLETION_QSN(3, "填空题"),
    JUDGE_QSN(4, "判断题"),
    SHORT_QSN(5, "填空题")
    ;


    private Integer code;
    private String msg;

    ExamEnum() {}
    ExamEnum(int code, String msg){
        this.code = code;
        this.msg = msg;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
