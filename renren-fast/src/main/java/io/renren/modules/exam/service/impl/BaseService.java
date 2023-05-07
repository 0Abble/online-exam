package io.renren.modules.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.common.entity.BaseEntity;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.exam.entity.QuestionEntity;
import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.service.StudentService;
import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.util.JWTTokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Author 3fes
 * @Date 2023/1/8 20:59
 **/
@Service
public class BaseService {

    @Resource
    private SysUserDao sysUserDao;
    @Autowired
    private RedisUtils redisUtils;

    public<T extends BaseEntity> List<T> relation(IPage<T> page) {
        List<T> records = page.getRecords();
        Set<String> sysUserIds = new HashSet<>();
        records.forEach(item -> {
            sysUserIds.add(item.getCreateBy());
            sysUserIds.add(item.getUpdateBy());
        });
        List<SysUserEntity> sysUserEntities = new ArrayList<>();
        if (!sysUserIds.isEmpty()) {
            sysUserEntities = sysUserDao.selectList(new QueryWrapper<SysUserEntity>().eq("status", 1).in("work_no", sysUserIds));
        }
        List<SysUserEntity> finalSysUserEntities = sysUserEntities;
        records.forEach(stu -> {
            finalSysUserEntities.forEach(sysUser -> {
                if (StringUtils.hasText(stu.getCreateBy()) && stu.getCreateBy().equals(String.valueOf(sysUser.getWorkNo()))) {
                    stu.setCreateBy(sysUser.getRealName());
                }
                if (StringUtils.hasText(stu.getUpdateBy()) && stu.getUpdateBy().equals(String.valueOf(sysUser.getWorkNo()))) {
                    stu.setUpdateBy(sysUser.getRealName());
                }
            });
        });
        return records;
    }


    /*public StudentEntity getCurrentStudent(String token) throws Exception {
        StudentEntity studentEntity = new StudentEntity();
        if (redisUtils.hasKey(token)) {
            studentEntity = redisUtils.get(token, StudentEntity.class);
        } else {
            String account = JWTTokenUtils.geAccountByToken(token);
            studentEntity = studentService.getOne(new QueryWrapper<StudentEntity>().eq("is_deleted", 0).eq("stu_no", account));
            redisUtils.set(token, studentEntity);
        }
        return studentEntity;
    }*/

    public void studentLogout(String token) {
        redisUtils.delete(token);
    }
}
