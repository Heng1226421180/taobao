package com.unicom.taobao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@ServletComponentScan(basePackages = {"com.unicom.filter"})
@ComponentScan(basePackages = {"com.unicom"})//指定spring管理的bean所在的包
@MapperScan("com.unicom.dao")//指定mybatis的mapper接口所在的包
@EnableTransactionManagement
@SpringBootApplication
public class TaobaoApplication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(TaobaoApplication.class);
    }
    public static void main(String[] args) {
        SpringApplication.run(TaobaoApplication.class, args);
    }
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")//指定数据源的前缀 ,在application.properties文件中指定
    public DataSource dataSource() {
        return new DataSource();
    }

    @Bean
    public PlatformTransactionManager transactionManager(DataSource dataSource) {
        //System.out.println("创建事物管理器");
        return new DataSourceTransactionManager(dataSource);
    }
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        //mapper映射文件位置
        //System.out.println("运行了mapper");
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath:/mybatis/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }
}
