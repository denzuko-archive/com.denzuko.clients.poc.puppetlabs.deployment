task :default => "docker:start"

namepace :docker do
	desc "Builds container"
	task :build do
		exec "docker build -t 'puppetlabs/exercise-website' ."
	end

	desc "Starts container"
	task :start do
		exec "docker run -d -p 8080:8080 'puppetlabs/exercise-website' start"
	end

	desc "Stops container"
	task :stop do
		exec "docker stop 'puppetlabs/exercise-website'"
	end
end
