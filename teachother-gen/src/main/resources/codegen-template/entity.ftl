package ${packageName};

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

/**
 * Entity for ${tableName}(<#if comment??>${comment}</#if>) table.
 */
@Entity<#if tableName??>(name = "${tableName}")</#if>
public class ${simpleName} implements Serializable {

<#list ownEntityPropertyDescs as property>
		
		<#if property.date || property.time || property.timestamp>
		${property.setPropertyClassName("java.sql.Date")}
		</#if>
		
    <#if property.id>
    @Id
    <#if property.generationType??>
    @GeneratedValue(strategy = GenerationType.${property.generationType})
    </#if>
    </#if>
    <#if property.version>
    @Version
    </#if>
    <#if property.columnName??>
    @Column(name = "${property.columnName}")
    </#if>
    <#assign flg = property.propertyClassName?starts_with(".")>
    private ${flg?string(property.propertyClassSimpleName, property.propertyClassName)} ${property.name};

</#list>

<#list ownEntityPropertyDescs as property>
		
	<#assign flg = property.propertyClassName?starts_with(".")>
	public ${flg?string(property.propertyClassSimpleName, property.propertyClassName)} get${property.name?cap_first}() {
	    return this.${property.name};
	}

	public void set${property.name?cap_first}(${flg?string(property.propertyClassSimpleName, property.propertyClassName)} ${property.name}) {
	    this.${property.name} = ${property.name};
	}
		
</#list>
}