package cn.erp.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Type {
    private int tid;
    private String typeName;
    private String typeDescribe;
    private String typeNotes;
    private int createBy;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    // 解决json格式的日期操作
    @JSONField(format = "yyyy-MM-dd")
    private Date createTime;
    private int modifyBy;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date modifyTime;
    public Type(String typeName, String typeNotes, int createBy, Date createTime) {
        super();
        this.typeName = typeName;
        this.typeNotes = typeNotes;
        this.createBy = createBy;
        this.createTime = createTime;
    }
    
}
