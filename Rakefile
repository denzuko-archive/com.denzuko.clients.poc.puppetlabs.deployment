task :default => "docker:start"

namespace :docker do
	desc "Builds container"
	task :build do
		exec "docker build -t 'puppetlabs/exercise-website' ."
	end

	desc "Starts container"
	task :start do
		exec "docker run -d -p 8080:8080 'puppetlabs/exercise-website' start"
	end

	desc "Restarts contaienr"
	task :restart do
		exec "docker restart $(docker ps | awk '/puppetlabs.exercise-website/ { print $1 }')"
	end

	desc "Stops container"
	task :stop do
		exec "docker stop $(docker ps|awk '/puppetlabs.exercise-website/ {print $1}')"
	end
end
