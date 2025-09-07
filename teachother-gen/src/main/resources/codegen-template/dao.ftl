package ${packageName};

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


/**
 * DAO for ${entityDesc.simpleName}.
 */
@Repository
public interface ${simpleName} extends JpaRepository<${entityDesc.simpleName}, Integer> {

}