# frozen_string_literal: true

# Model facade of the Planter application
class PlanterFacade
  require_relative 'model/model.rb'
  require_relative 'model/source/source.rb'
  require_relative 'model/diagram/diagram.rb'

  @@source = PlantSource.new
  @@diagram = PlantDiagram.new

  def self.source
    @@source
  end

  def self.diagram
    @@diagram
  end

  def self.check
    puts 'facade is alive'
  end
end
