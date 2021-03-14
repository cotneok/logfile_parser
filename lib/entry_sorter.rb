# frozen_string_literal: true

class EntrySorter
  def initialize(log_entries)
    @log_entries = log_entries
  end

  def sort(unique: false, order: :desc)
    modifier = sort_modifier(order)
    log_entries(unique, modifier)
  end

  private

  def log_entries(unique, modifier)

  end

  def sort_modifier(sort_order)

  end
end
