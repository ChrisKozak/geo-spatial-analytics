require "csv-mapper"

class PopulationParser

  def self.parse file_name
    census_to_population_map = {}
    census_to_population_tuples(file_name).each { |census_to_population_tuple|
      census_to_population_map.merge!(census_to_population_tuple)
    }
    census_to_population_map
  end

  def self.census_to_population_tuples(file_name)
    parse_csv(file_name).map do |result|
      {result.statefp+result.countyfp+result.tractce => result.population.to_i}
    end
  end

  def self.parse_csv(file_name)
    CsvMapper.import(file_name) do
      read_attributes_from_file
    end
  end
end