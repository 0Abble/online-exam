package io.renren.common.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author 3fes
 * @Date 2022/10/25 9:21
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseEntity implements Serializable {


    /**
     * 描述
     */
//    @ExcelProperty("描述")
    private String description;

    /**
     * 逻辑删除 0表示为删除， 1表示以删除
     */
//    @ExcelIgnore
    @TableLogic
    private Integer isDeleted;

    /**
     * 创建人
     */
//    @ExcelProperty("创建人")
    private String createBy;

    /**
     * 修改人
     */
//    @ExcelProperty("修改人")
    private String updateBy;

    /**
     * 创建时间
     */
//    @ExcelProperty("创建时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 修改时间
     */
//    @ExcelProperty("修改时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.UPDATE)
    private Date updateTime;
}
