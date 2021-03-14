# frozen_string_literal: true

# Sorts entries according to params provided
class EntrySorter
  def initialize(log_entries)
    @log_entries = log_entries
  end

  def sort(unique: false, order: :desc)
    modifier = sort_modifier(order)
    entries = log_entries(unique)
    entries.sort { |a, b| modifier * a[1] <=> modifier * b[1] }
  end

  private

  def log_entries(unique)
    @log_entries
      .each_with_object({}) { |entry, acc| acc[entry.path] = (acc[entry.path] || []) + [entry.ip] }
      .map { |key, value| [key, unique ? value.uniq.count : value.count] }
  end

  def sort_modifier(sort_order)
    case sort_order
    when :asc
      1
    when :desc
      -1
    else
      raise ArgumentError('Order param must be either :asc or :desc')
    end
  end
end
