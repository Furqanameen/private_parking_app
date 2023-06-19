module SlotsHelper
	def set_slot_id
		return params[:id] ||  @reservation.slot_id
	end
end
