class DensityCalculator
  def initialize population_service, geometry_service
    @population_service = population_service
    @geometry_service = geometry_service
  end

  def population_density_of_tract(tract_id)
    @population_service.population_of_tract(tract_id)/@geometry_service.area_in_square_miles(tract_id)
  end

end