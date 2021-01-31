# frozen_string_literal: true

# Exits Application.
class ExitApplication
  def initialize(data); end

  def execute
    puts 'Closing Planter Jr.'
    exit!
  end
end
