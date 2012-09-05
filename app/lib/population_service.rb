require 'lib/population_parser'

class PopulationService
  def initialize
    @population_map = PopulationParser.parse('lib/resources/CenPop2010_Mean_TR.txt')
  end

  def population_of_tract tract_id
    @population_map[tract_id]
  end
end