#define linked_list_item class
class LinkedListItem 
	include Comparable
	attr_reader :payload
	# attr_writer :next_list_item
	attr_reader :next_list_item

	def initialize(value)
		@payload = value
		@next_list_item= nil
	end

	def next_list_item=(nxt)
		if nxt == self
			raise ArgumentError, "linked_list_item may not point to self"
		else
			@next_list_item = nxt
		end
	end

	def last?
		@next_list_item == nil
	end

	def <=>(item)
		self.payload <=> item.payload
	end

	def ===(item)
		self.object_id === item.object_id
	end


end