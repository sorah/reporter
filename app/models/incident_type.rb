class IncidentType < ApplicationRecord
  serialize :meta
  has_many :incidents

  def level_definitions
    meta&.fetch(:levels, {})
  end

  def level_definition(level)
    0.upto(level).inject(default_level_definition) do |definition, level|
      leveldef = (level_definitions[level.to_i] || level_definitions[level.to_s])&.deep_symbolize_keys
      next definition unless leveldef

      definition[:channels].push(*leveldef[:channels])

      definition
    end.tap do |definition|
      definition[:channels].map! { |_| _.kind_of?(Integer) ? {id: _} : _ }
    end
  end

  private def default_level_definition
    {
      channels: []
    }
  end

end
