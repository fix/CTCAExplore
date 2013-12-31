class BootStrap {
	
	def download(String remoteUrl, String localUrl){
		def file = new FileOutputStream(localUrl)
		def out = new BufferedOutputStream(file)
		out << new URL(remoteUrl).openStream()
		out.close()
	}
	
    def init = { servletContext ->
		println new File("~/.ctcae/CTCAE_4.03_2010-06-14.owl").absolutePath
		
		if(!new File("~/.ctcae/CTCAE_4.03_2010-06-14.owl").exists()) {
			new File("~/.ctcae/").mkdirs()
			download("http://evs.nci.nih.gov/ftp1/CTCAE/CTCAE_4.03_2010-06-14.owl","~/.ctcae/CTCAE_4.03_2010-06-14.owl")
		}
		
		def importer=new com.ctcaexplore.OWLImporter("~/.ctcae/CTCAE_4.03_2010-06-14.owl")
		importer.parse()
    }
    def destroy = {
    }
}
