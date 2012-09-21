require 'rspec'
require File.join(File.dirname(__FILE__), '../lib/services/population_service')

describe "Population Service" do

  it "should get population for a given census tract" do
    population_service = PopulationService.new
    population_service.population_of_tract("01001020100").should be(1912)
    population_service.population_of_tract("06077001900").should be(5592)
  end
end