class Faq < ApplicationRecord
	self.table_name = 'erp_electrical_faqs'

	def self.get_active
    self.order('custom_order asc')
  end

	def get_question
			self.question
	end

	def get_reply
			self.reply
	end
end