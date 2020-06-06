# frozen_string_literal: true

# Model facade of the Planter application
class PlanterFacade
  require_relative 'model/model.rb'
  require_relative 'model/source/source.rb'

  @@source = PlantSource.new

  def self.source
    @@source
  end

  def self.check
    puts 'facade is alive'
  end
end
