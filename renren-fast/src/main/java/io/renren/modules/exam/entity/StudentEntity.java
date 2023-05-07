package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import io.renren.common.entity.BaseEntity;
import lombok.Data;

/**
 * 学生信息表
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
@Data
@TableName("exam_student")
public class StudentEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 学号
	 */
	private String stuNo;
	/**
	 * 姓名
	 */
	private String stuName;
	/**
	 * 年级
	 */
	private String grade;
	/**
	 * 专业
	 */
	private String major;
	/**
	 * 班级
	 */
	private String clazz;
	/**
	 * 学院
	 */
	private String institute;
	/**
	 * 电话号码
	 */
	private String tel;
	/**
	 * 电子邮件
	 */
	private String email;
	/**
	 * 密码
	 */
	private String pwd;
	/**
	 * 身份证号
	 */
	private String cardid;
	/**
	 * 性别
	 */
	private String sex;


}
