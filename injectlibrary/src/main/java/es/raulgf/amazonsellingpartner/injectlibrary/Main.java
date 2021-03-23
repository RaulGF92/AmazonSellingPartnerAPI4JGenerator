package es.raulgf.amazonsellingpartner.injectlibrary;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.codehaus.plexus.util.xml.pull.XmlPullParserException;

public class Main {

	public static void main(String[] args) throws IOException, XmlPullParserException {
		
		if(args.length < 1) {
			throw new RuntimeException("Not found pom.xml path");
		} 
		String _path = args[0];
		System.out.println("path:" + _path);
		
		
		Path pomPath = Paths.get(_path);
		PomDependency dependency = PomDependency.builder()
				.groupId("com.amazon.sellingpartnerapi")
				.artifactId("sellingpartnerapi-aa-java")
				.version("1.0")
				.build();
		
		try(PomInjector pomInjector = new PomInjector(pomPath)) {
			pomInjector.inject(dependency);
			pomInjector.save();
		}
	}

}
