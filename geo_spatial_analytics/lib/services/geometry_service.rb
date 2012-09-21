require 'rubygems'
require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database =>  '.db'

#Connect to postgres
#load dataset externally and get querying working first
)




require 'spatial_adapter/postgresql'

class GeometryService
  def area_in_square_miles tract_id
    #Query postgis for alabama census tracts
  end
end
