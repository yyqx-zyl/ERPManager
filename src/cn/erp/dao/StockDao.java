package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.erp.pojo.Stock;
@Repository
public interface StockDao {
    List<Stock> getStockList();
    @Insert("insert into erp_stock(productName,typeId,productNum,remarks,createBy,createTime)"
        + " values(#{productName},#{typeId},#{productNum},#{remarks},#{createBy},#{createTime})")
    int addStock(Stock stock);
    @Update("update erp_stock set productName=#{productName},typeId=#{typeId},productNum=#{productNum},"
        + "remarks=#{remarks},modifyBy=#{modifyBy},modifyTime=#{modifyTime} where sid=#{sid}")
    int updateStock(Stock stock);
    @Delete("delete from erp_stock where sid=#{sid}")
    int deleteStock(@Param("sid") int sid);
    @Select("select * from erp_stock where sid=#{sid}")
    Stock findById(@Param("sid") int sid);
    
}
