package com.ejada.springbootecommerce.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import com.ejada.springbootecommerce.entity.Country;
import com.ejada.springbootecommerce.entity.Product;
import com.ejada.springbootecommerce.entity.ProductCategory;
import com.ejada.springbootecommerce.entity.State;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;


@Configuration
public class MyDataRestConfig implements RepositoryRestConfigurer{
	
	private EntityManager entityManager;
	
	@Autowired
	public MyDataRestConfig(EntityManager theEntityManager) {
		this.entityManager = theEntityManager;
	}

	@Override
	public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config, CorsRegistry cors) {
		
		HttpMethod[] unSupportedActions = {HttpMethod.PUT, HttpMethod.POST, HttpMethod.DELETE};
		
		// disable HTTP methods: PUT, POST and DELETE
        disableHttpMethods(Product.class, config, unSupportedActions);
        disableHttpMethods(ProductCategory.class, config, unSupportedActions);
        disableHttpMethods(Country.class, config, unSupportedActions);
        disableHttpMethods(State.class, config, unSupportedActions);
				
		// call an internal helper method
		exposeIds(config);
	}
	
	// for disabling HTTP methods: PUT, POST and DELETE
	private void disableHttpMethods(Class theClass, RepositoryRestConfiguration config, HttpMethod[] theUnsupportedActions) {
        config.getExposureConfiguration()
                .forDomainType(theClass)
                .withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
                .withCollectionExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions));
    }

	// for exposing entities id
	private void exposeIds(RepositoryRestConfiguration config) {
		
		// get a set of entities types
		Set<EntityType<?>> entityTypes = entityManager.getMetamodel().getEntities();
		
		// create a list of classes to contain the entities
		List<Class> entityClasses = new ArrayList<>();
		
		// converting entities types to class type and fill up the entities 
		for(EntityType tempEntityType : entityTypes) {
			entityClasses.add(tempEntityType.getJavaType());
		}
		
		// converting list of classes to array of classes and exposing ids
		Class[] domainTypes = entityClasses.toArray(new Class[0]);
		config.exposeIdsFor(domainTypes);
		   
	}

}
