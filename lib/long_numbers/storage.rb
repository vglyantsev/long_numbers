module LongNumbers
  class Storage < Array
    def sort
      super { |a, b| b.rjust(1000) <=> a.rjust(1000) }
    end
  end
end
