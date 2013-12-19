require "linked_list_item"

class LinkedList
	def initialize(*items)
		@first_item = nil
		items.each do |item|
			add_item(item)
		end
	end

	def add_item(payload)
		prev_item = @first_item
		if(prev_item)
			until prev_item.last?
				prev_item = prev_item.next_list_item
			end
			prev_item.next_list_item = LinkedListItem.new(payload)
		else
			@first_item = LinkedListItem.new(payload)
		end

	end

	def get(num)
		item = @first_item
		if num>=0
			num.times do
				if !item
					raise IndexError, "That index does not exist"
				end
				item = item.next_list_item
			end
		else raise IndexError, "Negative index is undefined"
		end
		return item.payload
	end

	def size
		prev_item = @first_item
		size = 0
		if(prev_item)
			size =1
			until prev_item.last?
				prev_item = prev_item.next_list_item
				size+=1
			end
		end
		size
	end

	def last
		if @first_item
			last = @first_item
			until last.last?
				last = last.next_list_item
			end
			return last.payload
		else return @first_item
		end
	end

	def to_s
		if(@first_item)
			item = @first_item
			s = '| '
			s+= item.payload.to_s
			item= item.next_list_item
			while(item)
				s+= ', '
				s+= item.payload.to_s
				item = item.next_list_item
			end
			s+= ' |'
			return s
		else return "| |"
		end
	end

	def [] index
		self.get(index)
	end

	def []= index, value
		curr_item = @first_item
		index.times do
			curr_item = curr_item.next_list_item
		end
		curr_item.payload = value		
	end

	def remove(index)
		curr_item = @first_item
		if(self.size > index)
			if index == 0
				@first_item = curr_item.next_list_item
			else
				prev_item = curr_item
				index.times do
					prev_item = curr_item
					curr_item = curr_item.next_list_item
				end
				prev_item.next_list_item = curr_item.next_list_item
			end
		else raise IndexError, "How will you remove the item which is not there?"
		end
		return curr_item.payload 	
	end

	def indexOf(payloadIn)
		if @first_item == nil
			return @first_item
		end
		if(@first_item.payload == payloadIn)
			return 0
		else
			index = 1
			curr_item = @first_item.next_list_item
			while curr_item.payload != payloadIn
				curr_item = curr_item.next_list_item
				index += 1
				if !curr_item 
					return nil
				end
			end
			index
		end
	end

	def sorted?
		if self.size <= 1
			return true
		else
			item1 = @first_item
			item2 = @first_item.next_list_item
			until item2.nil?
				if(item1 > item2) 
					return false
				else
					item1 = item2
					true
					item2 = item2.next_list_item
				end  
			end
			return true
		end
	end

	def sort
		tempList = LinkedList.new()
		if self.size <= 1
			return self
		else
puts "\nin else"
			until self.sorted?
				item1 = @first_item
				item2 = @first_item.next_list_item
				if(item2 < item1)
					temp = item1.payload
					item1.payload = item2.payload
					item2.payload = temp
				end
				until item2.nil? do
					if(item2 < item1)
						temp = item1.payload
						item1.payload = item2.payload
						item2.payload = temp
					end
					item1 = item2
					item2 = item2.next_list_item
					puts self.to_s
				end
			end
			return self
		end
	end

	def swap_with_next(index)
		if(index == 0)
			temp = @first_item.payload
			@first_item.payload = @first_item.next_list_item.payload
			@first_item.next_list_item.payload = temp
		elsif index >= ((self.size) -1)
			raise IndexError, "There is nothing to swap with"
		else
			item = @first_item
			index.times do
				item = item.next_list_item
			end
			temp = item.payload
			item.payload = item.next_list_item.payload
			item.next_list_item.payload = temp
		end
	end
end