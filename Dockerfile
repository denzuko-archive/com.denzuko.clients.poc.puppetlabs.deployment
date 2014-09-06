FROM ubuntu:14.04
MAINTAINER Dwight A Spencer (@denzuko) "dspencer@computekindustries.com"

# Base System Installation
RUN apt-get update && apt-get -y install ruby ruby-bundler librarian-puppet wget git-core
RUN echo "gem: --no-ri --no-rdoc" | tee ~/.gemrc

# Import Configuration
WORKDIR /
ADD Gemfile /
ADD Puppetfile /
ADD Procfile /
ADD manifests /etc/puppet/manifests/

# Initialize Environment
RUN bundle install && librarian-puppet install
RUN puppet module install 'puppetlabs-apt'
RUN puppet module install 'puppetlabs-stdlib'
RUN puppet module install 'puppetlabs-vcsrepo'
RUN puppet module install 'jfryman-nginx'
RUN puppet apply /etc/puppet/manifests/site.pp
RUN ss state listening

# Open ports
EXPOSE 8080
EXPOSE 80
ENTRYPOINT ["foreman"]

# Start application
CMD ["start"]
