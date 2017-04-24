module ValidatesDateOnWithin
	extend ActiveSupport::Concern

	module ClassMethods
	  def validates_dated_on_within(attr, &range_lambda)
	    validates_each :date_of_birth_on do |record, attr, value|
	      range = range_lambda.call
	      record.errors.add(attr_name, :inclusion, :value => value) unless range.include?(value)
	    end
	  end
	end
end
