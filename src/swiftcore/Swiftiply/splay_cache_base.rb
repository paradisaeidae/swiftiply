require 'swiftcore/Swiftiply/cache_base_mixin'

module Swiftcore
	# Use Array instead of Deque, if Deque wasn't available.
	Deque = Array unless HasDeque
	
	module Swiftiply
		class CacheBase < Swiftcore::SplayTreeMap
			include CacheBaseMixin
			def initialize(vw = 900, time_limit = 0.05, maxsize = 100)
				@vw = vw
				@tl = time_limit
				@vwtl = vw * time_limit
				@vq = Deque.new
				super()
				self.max_size = maxsize
			end
		end
	end
end