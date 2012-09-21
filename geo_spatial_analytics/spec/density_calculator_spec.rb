require "rspec"
require File.join(File.dirname(__FILE__), '../lib/density_calculator')
require File.join(File.dirname(__FILE__), '../lib/services/population_service')
require File.join(File.dirname(__FILE__), '../lib/services/geometry_service')

describe "Population Density Calculator" do

  it "should calculate the population density for a given census tract" do
    @population_service.stub(:population_of_tract).with(any_args).and_return(100)
    @geometry_service.stub(:area_in_square_miles).and_return(2)
    density_calculator = DensityCalculator.new(@population_service, @geometryService)

    density_calculator.population_density_of_tract("020100").should be 50
  end
end