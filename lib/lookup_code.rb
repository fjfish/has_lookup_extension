# == Schema Information
# Schema version: 20080813130821
#
# Table name: lookup_codes
#
#  id        :integer       not null, primary key
#  domain    :string(255)   not null
#  lookup_id :integer       not null
#  value     :string(255)   not null
#

# == Schema Information
# Schema version: 20080807103253
#
# Table name: lookup_codes
#
#  id        :integer       not null, primary key
#  domain    :string(255)   not null
#  lookup_id :integer       not null
#  value     :string(255)   not null
#

class LookupCode < ActiveRecord::Base

  class << self

    # This allows the model to lookup the meaning from the value
    def get_value(domain,lookup_id)
      return unless domain
      get_domain_lookup(domain)[lookup_id]
    end
    # Return a hash list of the form value => key, for use in form tags
    # This one returns the key as an integer so that defaults work in the form, which is the default
    def get_domain_list(domain)
      begin
        return unless domain
        @domain_list ||= {}
        unless @domain_list[domain]
          new_hash = {}
          LookupCode.find_all_by_domain( domain, :order => "lookup_id").each {|l| new_hash[l.value] = l.lookup_id }
          @domain_list[domain] = new_hash unless new_hash == {}
        end
        @domain_list[domain]
      rescue
        {}
      end
    end
    # Return an array of 2 element arrays as required by lookups in rhtml
    # sorted by the value
    # Note that the value for 0 will still be first
    def get_sorted_domain_list(domain)
      return unless domain
      @sorted_domain_list ||= {}
      unless @sorted_domain_list[domain]
        new_sorted_list = get_domain_list(domain).clone
        element_0 = LookupCode.find_by_domain_and_lookup_id( domain, 0 )
        new_sorted_list.delete_if{ |k,v| v == 0}
        new_sorted_list = new_sorted_list.to_a.sort{ |x,y| x[0] <=> y[0]}
        new_sorted_list = [[element_0.value,0]] + new_sorted_list unless element_0.blank?
        @sorted_domain_list[domain] = new_sorted_list
      end
      @sorted_domain_list[domain]
    end

    # This lets us look the codes up the other way key => value
    def get_domain_lookup(domain)
      @domain_cache ||= {}
      unless @domain_cache[domain]
        @domain_cache[domain] =  get_domain_list(domain).invert
      end
      @domain_cache[domain]
    end

    def clear_cache
      @domain_list = {}
      @sorted_domain_list = {}
      @str_list = {}
      @domain_cache = {}
    end
  end
end
