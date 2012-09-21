require "rspec"
require File.join(File.dirname(__FILE__), '../lib/services/parser/population_parser')

describe "Population Parser" do

  it "should parse the populations of census tracts from a csv" do
    expected_population_for_tract = {"01001020200"=>2170, "01001020300"=>3373, "01003010100"=>3804, "01001020400"=>4386, "01001020500"=>10766, "01001020600"=>3668, "01001020700"=>2891, "01001020900"=>5675, "01001020801"=>3081, "01001021000"=>2894, "01001020802"=>10435, "01001021100"=>3320, "01001020100"=>1912}
    actual_population_for_tract = PopulationParser.parse('spec/resources/census_tract_population.csv')
    actual_population_for_tract.should eql expected_population_for_tract
  end
end