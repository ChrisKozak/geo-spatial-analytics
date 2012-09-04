require "rspec"
require "lib/population_parser"

describe "Population Parser" do

  it "should parse the populations of census tracts from a csv" do
    expected_population_for_tract = {"020700"=>2891, "020900"=>5675, "020801"=>3081, "021000"=>2894, "020802"=>10435, "021100"=>3320, "020100"=>1912, "010100"=>3804, "020200"=>2170, "020300"=>3373, "020400"=>4386, "020500"=>10766, "020600"=>3668}
    actual_population_for_tract = PopulationParser.parse('spec/resources/census_tract_population.csv')
    actual_population_for_tract.should eql expected_population_for_tract
  end
end