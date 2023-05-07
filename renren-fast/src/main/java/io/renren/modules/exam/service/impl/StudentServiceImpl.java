package io.renren.modules.exam.service.impl;

import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.StudentDao;
import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.service.StudentService;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;


@Service("studentService")
public class StudentServiceImpl extends ServiceImpl<StudentDao, StudentEntity> implements StudentService {


    @Autowired
    private BaseService baseService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        String key = (String) params.get("key");
        String stuNo = (String) params.get("stuNo");
        String stuName = (String) params.get("stuName");
        String major = (String) params.get("major");
        String clazz = (String) params.get("clazz");

        QueryWrapper<StudentEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_deleted", 0);
        if (StringUtils.hasText(stuNo)) {
            queryWrapper.and(r -> r.eq("stu_no", stuNo));
        }
        if (StringUtils.hasText(stuName)) {
            queryWrapper.and(r -> r.like("stu_name", stuName));
        }
        if (StringUtils.hasText(major)) {
            queryWrapper.and(r -> r.eq("major", major));
        }
        if (StringUtils.hasText(clazz)) {
            queryWrapper.and(r -> r.eq("clazz", clazz));
        }

        IPage<StudentEntity> page = this.page(
                new Query<StudentEntity>().getPage(params),
                queryWrapper
        );


        page.setRecords(baseService.relation(page));
        return new PageUtils(page);
    }

}
