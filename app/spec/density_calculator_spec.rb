require "rspec"
require 'mocha'
require 'lib/density_calculator'
require 'lib/population_service'
require 'lib/geometry_service'

describe "Population Density Calculator" do

  it "should calculate the population density for a given census tract" do
    #@population_service.stubs(:population).returns("100")
    #@geometry_service.stubs(:area_in_square_miles).returns("2")
    density_calculator = DensityCalculator.new(PopulationService.new, GeometryService.new)
    density_calculator.population_density_of_tract("020100").should be 50
  end
end