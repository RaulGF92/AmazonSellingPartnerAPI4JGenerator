package es.raulgf.amazonsellingpartner.injectlibrary;

import org.apache.maven.model.Dependency;

import lombok.Builder;

@Builder
public class PomDependency {
	
	private String groupId;
	private String artifactId;
	private String version;
	
	public static Dependency toDependency(PomDependency dependency) {
		Dependency response = new Dependency();
		response.setGroupId(dependency.groupId);
		response.setArtifactId(dependency.artifactId);
		response.setVersion(dependency.version);
		return response ;
	}
	
}
