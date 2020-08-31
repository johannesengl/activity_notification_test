class User < ActiveRecord::Base
	has_many :invoices
	acts_as_target
end
