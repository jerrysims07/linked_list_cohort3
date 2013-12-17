#define linked_list_item class
class LinkedListItem 
	include Comparable
	attr_reader :payload
	attr_writer :payload
	# attr_writer :next_list_item
	attr_reader :next_list_item

	def initialize(value)
		@payload = value
		@next_list_item= nil
		@object_value = nil
	end

	def next_list_item=(nxt)
		if nxt === self
			raise ArgumentError, "linked_list_item may not point to self"
		else
			@next_list_item = nxt
		end
	end

	def last?
		@next_list_item == nil
	end

	def <=>(item)
		if(self.payload.class == item.payload.class)
			self.payload <=> item.payload
		else
			self.object_value <=> item.object_value	
		end
	end

	def ===(item)
		self.object_id === item.object_id
	end



	def object_value
		case @payload.class.to_s
		when "Symbol"
			@object_value = 5
		when "String"
			@object_value = 4
		else 
			@object_value = 0
		end
		return @object_value
	end
end