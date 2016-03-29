class IncidentType < ApplicationRecord
  serialize :meta
  has_many :incidents

  def level_definitions
    meta&.fetch(:levels, {})
  end

  def level_definition(level)
    0.upto(level).inject(default_level_definition) do |definition, level|
      leveldef = level_definition_specific(level)

      definition[:channel_ids].push(*leveldef[:channel_ids])

      definition
    end
  end

  def level_definition_specific(level)
    default_level_definition.merge((level_definitions[level.to_i] || level_definitions[level.to_s] || {}).symbolize_keys)
  end

  private def default_level_definition
    {
      channel_ids: []
    }
  end

end
