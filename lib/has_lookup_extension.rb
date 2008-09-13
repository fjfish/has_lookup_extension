# HasLookupExtension
module HasLookupExtension
  def self.enable
    return if ActiveRecord::Base.instance_methods.include? 'has_lookup_code'
    ActiveRecord::Base.class_eval { extend LookupHelper }
  end
end
module LookupHelper
  # Don't put any trailing non-chars as underscores
  # This method is used to create sensible names for the lookup helpers
  def self._sensible_code_(code)
    code = code.to_s.downcase
    code.gsub!(/[[:punct:]]+/,' ')
    code.strip!
    code.gsub!(/[[:space:]]+/,'_')
    code
  end
  # Note: I'm sure that this meta stuff can be replaced, just haven't
  # had time to look at it and this works ..
  def has_lookup_code(lookup_list)
    lookup_list.each_pair do |k,v|
      class_eval "def self.#{k.to_s}_list ; LookupCode.get_domain_list('#{v}') ; end"
      class_eval "def self.#{k.to_s}_lookup ; LookupCode.get_domain_lookup('#{v}') ; end"
      class_eval "def self.sorted_#{k.to_s}_list ; LookupCode.get_sorted_domain_list('#{v}') ; end"
      easy_access_list = self.send "#{k.to_s}_list"
      easy_access_list.each_pair { |code,id| class_eval "def self.#{k.to_s}_#{LookupHelper._sensible_code_(code)} ; #{id} ; end"} unless easy_access_list.nil?
    end
    lookup_list.each_key do |k|
      class_eval "def #{k.to_s}_str ; self.class.#{k.to_s}_lookup[self.#{k.to_s}] || \"\" rescue \"\"; end"
      class_eval "def formatted_#{k.to_s}_str ; return "" if self.#{k.to_s} == 0; self.class.#{k.to_s}_lookup[self.#{k.to_s}] || \"\" rescue \"\"; end"
    end
  end
end
