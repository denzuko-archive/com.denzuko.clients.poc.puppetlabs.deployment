= puppetlabs-deployment =

Basic deployment of puppet and nginx over docker container.

View the results: http://cadc001.dapla.net:8080/

[![Build Status](https://travis-ci.org/denzuko/puppetlabs-deployment.svg)](https://travis-ci.org/denzuko/puppetlabs-deployment)


== Installation ==

Basic preseptions is that one would already have a working docker, linux and rake configuration. CoreOS is a good distribution for this which already has a basic docker setup in place.

=== Procedure ===

> git clone https://github.com/denzuko/puppetlabs-deployment.git

> cd puppetlabs-deployment

> Edit Pupppetfile and Gemfile as needed for your application

> Change the sample git repository in manifest/site.pp to your application's repository.

> rake docker:build && rake docker:start

== Roadmap ==

    - Expand Docker support in Rakefile
    - Vagrent deployment
    - Add Vagrant commands to Rakefile which start the bootstrapping
    - Use a simple config.yml to define application repository, listening port, and container name
