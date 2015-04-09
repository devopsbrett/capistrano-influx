require 'spec_helper'

describe Capistrano::Influx do
  it 'has a version number' do
    expect(Capistrano::Influx::VERSION).not_to be nil
  end

  before do
    @configuration = Capistrano::Configuration.new
    @configuration.extend(Capistrano::Spec::ConfigurationExtension)
    @configuration.extend(Capistrano::Influx)

    @influxdb = double
  end


  it 'defines influx:store_deploy' do
    expect(@configuration.find_task('influx:store_deploy')).to_not be_nil
  end

  it 'performs influx:store_deploy after deploy' do
    @configuration.should callback('influx:store_deploy').after('deploy')
  end
end
