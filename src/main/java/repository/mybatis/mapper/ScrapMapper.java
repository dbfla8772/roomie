package repository.mybatis.mapper;
import model.Profile;
import model.Scrap;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScrapMapper {
    List<Profile> findScrapList(int s_id);
    int isScraped(@Param("s_id") int s_id, @Param("scrap_id") int scrap_id);
    int insertScrap(Scrap scrap);
    int deleteScrap(@Param("s_id") int s_id, @Param("scrap_id") int scrap_id);

}