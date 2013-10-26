require 'uri'

class VirtualDomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # TODO: figure out a way to test domains
  end
end