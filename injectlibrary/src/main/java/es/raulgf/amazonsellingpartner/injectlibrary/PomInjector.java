package es.raulgf.amazonsellingpartner.injectlibrary;

import java.io.Closeable;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;

import org.apache.maven.model.Model;
import org.apache.maven.model.io.xpp3.MavenXpp3Reader;
import org.apache.maven.model.io.xpp3.MavenXpp3Writer;
import org.codehaus.plexus.util.xml.pull.XmlPullParserException;

public class PomInjector implements Closeable {
	
	private Path pomPath;
	private FileReader fileReader;
	private Model model;

	public PomInjector(Path pomPath) throws IOException, XmlPullParserException {
		this.pomPath = pomPath;
		this.model = this.loadModel();
	}

	private Model loadModel() throws IOException, XmlPullParserException {
		this.fileReader = new FileReader(this.pomPath.toFile());
		MavenXpp3Reader reader = new MavenXpp3Reader();
		return reader.read(this.fileReader);
	}

	public void inject(PomDependency dependency) {
		this.model.addDependency(PomDependency.toDependency(dependency));
	}

	public void save() throws IOException {
		try (FileWriter fw = new FileWriter(this.pomPath.toFile(), false)) {
			MavenXpp3Writer writer = new MavenXpp3Writer();
			writer.write(fw, model);
		}
	}

	public void close() throws IOException {
		this.fileReader.close();
	}

}
