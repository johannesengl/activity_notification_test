class Invoice < ActiveRecord::Base
	belongs_to :user

	acts_as_notifiable :partners, {
	  targets: -> (invoice, key) { [invoice.user] },
	  notifiable_path: :invoice_notifiable_path,
	  tracked: { only: [:create], key: 'invoice.create' },
	}

	def invoice_notifiable_path
		binding.pry
	  "test-123"
	end
end
