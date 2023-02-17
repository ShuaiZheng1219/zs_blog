package com.site.blog.my.core;

import com.site.blog.my.core.util.MD5Util;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MyBlogApplicationTests {

	@Test
	public void contextLoads() {
		String s = MD5Util.MD5Encode("yuweiting1219", "UTF-8");
		System.out.println(s);
	}

}
