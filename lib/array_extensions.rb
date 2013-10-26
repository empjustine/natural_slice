module ArrayExtensions

  def natural_slice definition

    return Array.natural_slice(definition).map { |indexes|
      if indexes.is_a?(Range) && indexes.begin > indexes.end
        indexes.begin.downto(indexes.end).map { |index| self[index] }
      else
        self[indexes]
      end
    }.flatten(1)
  end

  alias_method :s_slice, :natural_slice
end


module ArrayClassExtensions

  def natural_slice definition

    definition.split(',').map { |slice|
      parts = /^(?<begin>-?\d+)(?<dash>-?)(?<end>-?\d*)$/.match slice
      parts[:dash].empty? ? slice.to_i : (parts[:begin].to_i .. parts[:end].to_i)
    }
  end

  alias_method :s_slice, :natural_slice
end


class Array

  include ArrayExtensions
  extend ArrayClassExtensions
end
