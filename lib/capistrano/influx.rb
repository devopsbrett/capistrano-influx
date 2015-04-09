require "capistrano/influx/version"
require 'capistrano'
require 'influxdb'

module Capistrano
  module Influx

    def connection
      db = fetch(:influx_database)
      host = fetch(:influx_host, '127.0.0.1')
      port = fetch(:influx_port, 8086)
      user = fetch(:influx_user)
      pass = fetch(:influx_pass)
      @influxdb ||= InfluxDB::Client.new  db,
                                          username: user,
                                          password: pass,
                                          host: host,
                                          port: port
      @influxdb
    end

    def influx_deploy(app, branch, stage, deployer)
      conn = connection
      name = fetch(:influx_series)
      data = {
        user: deployer,
        project: app,
        version: branch,
        environment: stage,
        description: "#{deployer} deployed #{app} #{branch} to #{stage} successfully"
      }
      conn.write_point(name, data)
    end

    def self.extended(configuration)
      configuration.load do
        after 'deploy', 'influx:store_deploy'

        set :deployer do
          ENV['SSHUSER'] || `git config user.name`.chomp
        end

        namespace :influx do
          task :store_deploy do
            if fetch(:send_to_influx, false)
              influx_deploy(fetch(:application), fetch(:branch), fetch(:stage, 'production'), fetch(:deployer))
            end
          end
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Configuration.instance.extend(Capistrano::Influx)
end
